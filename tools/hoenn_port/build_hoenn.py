#!/usr/bin/env python3
"""Import Hoenn maps from the pokeruby repo into this repo, after the Sinnoh import.

    python3 tools/hoenn_port/build_hoenn.py ../pokediamond ../pokeruby

Runs the Sinnoh importer first (it restores the stock archives from master and regenerates Sinnoh), then
appends Hoenn on top, so the result is deterministic. Reads tools/hoenn_port/maps.txt (one pokeruby MAP_
constant per line).

A Gen 3 map is a 2D grid of 16x16 metatiles drawn on two layers; HeartGold wants a 3D model per 32x32 chunk.
Every distinct (metatile, layer) image becomes a 16x16 256-colour texture in a Hoenn texture set, and the
chunk model is a flat sheet of quads, one per rectangle of identical tiles (the texture repeats across it).
Tiles the player walks behind (the layer Ruby draws above the player) sit one unit above the ground.

Per map it produces: a land chunk (permissions from Ruby's collision bits, no buildings, the model, a flat
height map), a 1x1 matrix, an area with its texture set, an empty event bank, a stub script bank, a text
bank, a map header entry and a MAP_HOENN_ constant.
"""
import json, os, re, struct, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
sys.path.insert(0, os.path.join(ROOT, "tools", "sinnoh_port"))
sys.path.insert(0, HERE)
import build_sinnoh as B  # noqa: E402  (chdirs to ROOT on import)
import nsbtx  # noqa: E402
import nsbmd  # noqa: E402
from gba import Ruby, LAYER_NORMAL, LAYER_COVERED, LAYER_SPLIT  # noqa: E402

os.chdir(ROOT)
CHUNK = 32
PREFIX = "H"            # generated map codes: H + a short name, so nothing collides with HeartGold's or Sinnoh's

# Ruby metatile behaviours (include/constants/metatile_behaviors.h) that matter for walking; the rest are plain ground.
MB_TALL_GRASS = 0x02
MB_BLOCKED_BY_COLLISION = None


def ids_in_use():
    """First free index for every per-map resource, read from what the tree holds after the Sinnoh import."""
    def mx(names, pat):
        return max([int(m.group(1)) for n in names for m in [re.match(pat, n)] if m] + [-1]) + 1
    maps_h = open("include/constants/maps.h").read()
    return dict(
        map=max(int(v) for n, v in re.findall(r"#define (MAP_\w+)\s+(\d+)", maps_h) if not n.startswith("MAP_HOENN_")) + 1,
        msg=mx(os.listdir("files/msgdata/msg"), r"msg_(\d{4})"),
        scr=mx(os.listdir("files/fielddata/script/scr_seq"), r"scr_seq_(\d{4})"),
        evt=mx(os.listdir("files/fielddata/eventdata/zone_event"), r"(\d{3})_"),
        matrix=mx(os.listdir("files/fielddata/mapmatrix/map_matrix"), r"map_matrix_(\d{4})"),
    )


def bgr555(rgb):
    r, g, b = rgb
    return (r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10)


class HoennMap:
    """One Ruby map rendered into textures, quads and a permission grid for one HeartGold chunk."""

    def __init__(self, rb, map_id):
        self.rb = rb
        self.m = rb.maps[map_id]
        self.layout = self.m["layout"]
        self.w, self.h, self.cells = rb.grid(self.layout)
        assert self.w <= CHUNK and self.h <= CHUNK, (map_id, self.w, self.h)   # bigger maps span several chunks: later
        self.ox, self.oy = (CHUNK - self.w) // 2, (CHUNK - self.h) // 2
        l = rb.layouts[self.layout]
        self.border = struct.unpack("<4H", open(f"{rb.repo}/{l['border_filepath']}", "rb").read()[:8])
        self.images = {}      # (metatile id, layer) -> 256 bytes (16x16 global palette indices) or None if blank
        self.palette = [0] * 256
        for p in range(12):
            pal = self._palette(p)
            for c in range(16):
                self.palette[p * 16 + c] = bgr555(pal[c])
        self.palette[0] = 0

    def _palette(self, p):
        l = self.rb.layouts[self.layout]
        ts = self.rb.tileset(l["primary_tileset"] if p < 6 else l["secondary_tileset"])
        return ts["palettes"][p]

    def layer_image(self, mid, layer):
        """16x16 image of one layer (0 bottom, 1 top) of a metatile as global palette indices; None when fully blank."""
        key = (mid, layer)
        if key not in self.images:
            tiles, _attr = self.rb.metatile(self.layout, mid)
            img = bytearray(256)
            blank = True
            for sub in range(4):
                word = tiles[layer * 4 + sub]
                px, _pal = self.rb.tile_pixels(self.layout, word)
                pal = word >> 12
                sx, sy = (sub & 1) * 8, (sub >> 1) * 8
                for y in range(8):
                    for x in range(8):
                        c = px[y * 8 + x]
                        if c:
                            img[(sy + y) * 16 + sx + x] = pal * 16 + c
                            blank = False
            self.images[key] = None if blank else bytes(img)
        return self.images[key]

    def above_player(self, mid):
        """Does Ruby draw this metatile's top half over the player? (NORMAL and SPLIT layer types do; COVERED does not.)"""
        _tiles, attr = self.rb.metatile(self.layout, mid)
        return (attr >> 12) != LAYER_COVERED

    def chunk_cell(self, cx, cz):
        """(metatile id, collision, elevation) for a chunk tile, using the border pattern outside the map."""
        x, y = cx - self.ox, cz - self.oy
        if 0 <= x < self.w and 0 <= y < self.h:
            return self.cells[y * self.w + x]
        return self.border[(y & 1) * 2 + (x & 1)], 1, 0

    def border_image(self, layer):
        """32x32 image of the 2x2 border pattern for one layer, or None when blank; cached under ("border", layer)."""
        key = ("border", layer)
        if key not in self.images:
            img, blank = bytearray(32 * 32), True
            for by in range(2):
                for bx in range(2):
                    tile = self.layer_image(self.border[by * 2 + bx], layer)
                    if tile is None:
                        continue
                    blank = False
                    for y in range(16):
                        img[(by * 16 + y) * 32 + bx * 16:(by * 16 + y) * 32 + bx * 16 + 16] = tile[y * 16:y * 16 + 16]
            self.images[key] = None if blank else bytes(img)
        return self.images[key]

    def rectangles(self):
        """Greedy decomposition of the chunk into rectangles of identical (metatile, layer), plus the border bands
        drawn with the repeating 32x32 border texture. Entries: (key, x0, z0, w, h, u offset, v offset) in tiles/texels."""
        out = []
        for layer in (0, 1):
            grid = {}
            for y in range(self.h):
                for x in range(self.w):
                    mid = self.cells[y * self.w + x][0]
                    if self.layer_image(mid, layer) is not None:
                        grid[(x + self.ox, y + self.oy)] = mid
            done = set()
            for cz in range(self.oy, self.oy + self.h):
                for cx in range(self.ox, self.ox + self.w):
                    if (cx, cz) in done or (cx, cz) not in grid:
                        continue
                    mid = grid[(cx, cz)]
                    w = 1
                    while grid.get((cx + w, cz)) == mid and (cx + w, cz) not in done:
                        w += 1
                    h = 1
                    while all(grid.get((cx + i, cz + h)) == mid and (cx + i, cz + h) not in done for i in range(w)):
                        h += 1
                    for i in range(w):
                        for j in range(h):
                            done.add((cx + i, cz + j))
                    out.append(((mid, layer), cx, cz, w, h, 0, 0))
            if self.border_image(layer) is not None:
                x1, z1 = self.ox + self.w, self.oy + self.h
                for bx, bz, bw, bh in ((0, 0, CHUNK, self.oy), (0, z1, CHUNK, CHUNK - z1),
                                       (0, self.oy, self.ox, self.h), (x1, self.oy, CHUNK - x1, self.h)):
                    if bw > 0 and bh > 0:   # the border pattern is phased from the map's top-left corner, as the GBA draws it
                        out.append((("border", layer), bx, bz, bw, bh, ((bx - self.ox) % 2) * 16, ((bz - self.oy) % 2) * 16))
        return out

    def permissions(self):
        perm = bytearray(CHUNK * CHUNK * 2)
        for cz in range(CHUNK):
            for cx in range(CHUNK):
                mid, col, _elev = self.chunk_cell(cx, cz)
                _tiles, attr = self.rb.metatile(self.layout, mid)
                behaviour = attr & 0xFF
                ttype = 0
                if behaviour == MB_TALL_GRASS:
                    ttype = 0x02          # TILE_BEHAVIOR_TALL_GRASS in HeartGold's enum
                perm[(cz * CHUNK + cx) * 2] = ttype
                perm[(cz * CHUNK + cx) * 2 + 1] = 0x80 if col else 0
        return bytes(perm)


def build_textures_and_model(hm, code, map_index):
    """Texture set (NSBTX bytes) and chunk model (NSBMD bytes) for one map."""
    rects = hm.rectangles()
    keys = list(dict.fromkeys(k for k, *_ in rects))
    tex_names = {k: f"h{map_index:02d}t{i:03d}" for i, k in enumerate(keys)}   # unique within the map's texture set
    textures = {}
    for k in keys:
        size = 32 if k[0] == "border" else 16
        log = 2 if size == 32 else 1                                               # texture size code: 8 << log
        param = (4 << 26) | (log << 23) | (log << 20) | (3 << 16) | (1 << 29)      # 256-colour, repeat S/T, colour 0 clear
        extra = size | (size << 11) | 0x80000000
        textures[nsbmd.name16(tex_names[k])] = (param, extra, hm.images[k], 4)
    pal_name = f"h{map_index:02d}pal"
    palettes = {nsbmd.name16(pal_name): b"".join(struct.pack("<H", c) for c in hm.palette)}
    tex_set = nsbtx.write_nsbtx(textures, palettes)
    materials, shapes = [], []
    t = nsbmd.VTX_UNIT
    for i, k in enumerate(keys):
        size = 32 if k[0] == "border" else 16
        materials.append((tex_names[k], tex_names[k], pal_name, size, size, True))
        y = 0 if k[1] == 0 else 1 / nsbmd.POS_SCALE           # the above-player layer floats one world unit up
        quads = []
        for kk, cx, cz, w, h, u0, v0 in rects:
            if kk != k:
                continue
            x0, z0 = (cx - CHUNK // 2) * t, (cz - CHUNK // 2) * t
            x1, z1 = x0 + w * t, z0 + h * t
            u1, v1 = u0 + w * 16, v0 + h * 16
            quads.append([(x0, y, z0, u0, v0), (x0, y, z1, u0, v1), (x1, y, z1, u1, v1), (x1, y, z0, u1, v0)])
        shapes.append((i, quads))
    model = nsbmd.write_model(f"map_{code.lower()}"[:15], materials, shapes)
    return tex_set, model, len(keys), len(rects)


def meson_list(path, after_marker, items):
    """Keep a HOENN_PORT block of file names right after the Sinnoh block in a meson list."""
    s = open(path).read()
    if "# HOENN_PORT_BEGIN" not in s:
        assert after_marker in s, (path, after_marker)
        s = s.replace(after_marker, after_marker + "\n    # HOENN_PORT_BEGIN\n    # HOENN_PORT_END", 1)
        open(path, "w").write(s)
    B.replace_block(path, "    # HOENN_PORT_BEGIN", "    # HOENN_PORT_END", "".join(f"    '{x}',\n" for x in items))


def main():
    dp_repo, rb_repo = sys.argv[1], sys.argv[2]
    sys.argv = [sys.argv[0], dp_repo]
    B.main()                                   # Sinnoh first: it restores the stock archives and regenerates its maps
    rb = Ruby(rb_repo)
    manifest = [l for l in open(os.path.join(HERE, "maps.txt")).read().split() if l.startswith("MAP_")]
    gen_list = os.path.join(HERE, "generated.txt")      # files the previous run made; removed so ids do not drift
    if os.path.exists(gen_list):
        for path in open(gen_list).read().split("\n"):
            if path and os.path.exists(path):
                os.remove(path)
    generated_files = []
    first = ids_in_use()
    narcs = B.Narcs()
    flat_bdhc = narcs.member("land", 1)[len(narcs.member("land", 1)) - struct.unpack_from("<I", narcs.member("land", 1), 12)[0]:]
    todo, header_entries, map_defines = [], [], []
    gen_matrices, gen_events, gen_scripts, gen_hdrs, gen_msgs, gen_codes = [], [], [], [], [], []
    empty_buildtex = nsbtx.write_nsbtx({}, {})
    for i, map_id in enumerate(manifest):
        hm = HoennMap(rb, map_id)
        short = re.sub(r"[^A-Z0-9]", "", map_id[len("MAP_"):].replace("_", ""))[:10]
        code = PREFIX + short                                  # e.g. HLITTLEROOT
        hgid, hgname = first["map"] + i, f"MAP_HOENN_{map_id[4:]}"
        gen_codes.append(code)
        tex_set, model, ntex, nrect = build_textures_and_model(hm, code, i)
        print(f"{map_id}: {hm.w}x{hm.h}, {ntex} textures, {nrect} quads, model {len(model)} bytes, texture set {len(tex_set)} bytes")
        # --- area: no buildings, our texture set
        tex_idx = narcs.append("tex", tex_set)
        list_idx = narcs.append("buildlist", struct.pack("<H", 0))
        assert narcs.append("buildtex", empty_buildtex) == list_idx
        area_idx = narcs.append("area", struct.pack("<HHHBB", list_idx, tex_idx, 0xFFFF, 1, 1))
        # --- land chunk + 1x1 matrix
        perm = hm.permissions()
        chunk = struct.pack("<4IHH", len(perm), 0, len(model), len(flat_bdhc), 0x1234, 0) + perm + model + flat_bdhc
        land_idx = narcs.append("land", chunk)
        mname = code.encode()[:15]
        mx = struct.pack("<BBBBB", 1, 1, 0, 1, len(mname)) + mname + bytes([0]) + struct.pack("<H", land_idx)
        matrix_idx = first["matrix"] + i
        mpath = f"files/fielddata/mapmatrix/map_matrix/map_matrix_{matrix_idx:04d}_{code}.bin"
        open(mpath, "wb").write(mx)
        gen_matrices.append(os.path.basename(mpath))
        # --- events (none yet), scripts (one stub), text (one line)
        evt_idx = first["evt"] + i
        evname = f"{evt_idx:03d}_{code}"
        ev = {"header": f"fielddata/script/scr_seq/event_{code}.h", "bgs": [], "objects": [], "warps": [], "coords": []}
        json.dump(ev, open(f"files/fielddata/eventdata/zone_event/{evname}.json", "w"), indent=2)
        gen_events.append(evname)
        evh = [f"#ifndef SCR_SEQ_{code}_H_", f"#define SCR_SEQ_{code}_H_", "", f"#define _EV_scr_seq_{code}_000 0", "", "#endif"]
        open(f"files/fielddata/script/scr_seq/event_{code}.h", "w").write("\n".join(evh) + "\n")
        generated_files.append(f"files/fielddata/script/scr_seq/event_{code}.h")
        msg_idx = first["msg"] + i
        bank = f"msg_{msg_idx:04d}_{code}"
        json.dump({"key": 0x4800 + i, "messages": [{"id": f"{bank}_00000", "en_US": f"{map_id[4:].replace('_', ' ').title()}"}]},
                  open(f"files/msgdata/msg/{bank}.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
        gen_msgs.append(bank)
        scr_idx = first["scr"] + 2 * i
        scr_name, hdr_name = f"scr_seq_{scr_idx:04d}_{code}", f"scr_seq_{scr_idx + 1:04d}_{code}_hdr"
        inc = f'#include "constants/scrcmd.h"\n#include "fielddata/script/scr_seq/event_{code}.h"\n'
        open(f"files/fielddata/script/scr_seq/{scr_name}.s", "w").write(
            inc + f'#include "msgdata/msg/{bank}.h"\n#include "macros/script.inc"\n#include "macros/movement.inc"\n\n'
            f"\tScrDef scr_seq_{code}_000\n\tScrDefEnd\n\nscr_seq_{code}_000:\n\tEnd\n\n\t.balign 4, 0\n")
        open(f"files/fielddata/script/scr_seq/{hdr_name}.s", "w").write(
            inc + '#include "constants/init_script_types.h"\n#include "macros/script.inc"\n\n\tInitScriptEntryEnd\n\n\tInitScriptEnd\n')
        gen_scripts.append(scr_name)
        gen_hdrs.append(hdr_name)
        generated_files += [mpath, f"files/fielddata/eventdata/zone_event/{evname}.json", f"files/msgdata/msg/{bank}.json",
                            f"files/fielddata/script/scr_seq/{scr_name}.s", f"files/fielddata/script/scr_seq/{hdr_name}.s"]
        # --- header
        header_entries.append(f"""    [{hgname}] = {{
                        .wildEncounterBank = ENCDATA_NA,
                        .areaDataBank = {area_idx},
                        .moveModelBank = 15,
                        .worldMapX = 0,
                        .worldMapY = 0,
                        .matrixId = NARC_map_matrix_map_matrix_{matrix_idx:04d}_{code}_bin,
                        .scriptsBank = {scr_name}_bin,
                        .scriptHeaderBank = {hdr_name}_bin,
                        .msgBank = {bank},
                        .dayMusicId = SEQ_GS_T_WAKABA,
                        .nightMusicId = SEQ_GS_T_WAKABA,
                        .eventsBank = NARC_zone_event_{evname}_bin,
                        .mapsec = MAPSEC_NEW_BARK_TOWN,
                        .areaIcon = 1,
                        .momCallIntroParam = 6,
                        .regionNo = MAP_REGION_HOENN,
                        .weather = 0,
                        .cameraType = 0,
                        .followMode = MAP_FOLLOWMODE_ALLOW,
                        .battleBg = BATTLE_BG_CITY,
                        .bikeAllowed = TRUE,
                        .runningAllowed_Unused = TRUE,
                        .escapeRopeAllowed = FALSE,
                        .flyAllowed = FALSE,
                        .outgoingCalls = FALSE,
                        .incomingCalls = FALSE,
                        .radioSignal = FALSE,
                        }},""")
        map_defines.append(f"#define {hgname:<49} {hgid} // Ruby {map_id} ({code})")
        todo.append(f"{map_id}: mapsec is a New Bark placeholder; music is HeartGold's New Bark theme (decision 17)")
    narcs.save()
    # --- generated constants and lists
    mh_h = "include/map_header.h"
    s = open(mh_h).read()
    if "MAP_REGION_HOENN" not in s:
        open(mh_h, "w").write(s.replace("    MAP_REGION_SINNOH = 2,", "    MAP_REGION_SINNOH = 2,\n    MAP_REGION_HOENN = 3,", 1))
    B.ensure_markers("include/constants/maps.h", "// SINNOH_PORT_END", "// HOENN_PORT_BEGIN", "// HOENN_PORT_END", before=False)
    B.replace_block("include/constants/maps.h", "// HOENN_PORT_BEGIN", "// HOENN_PORT_END", "\n".join(map_defines) + "\n")
    mh = "src/data/map_headers.h"
    B.ensure_markers(mh, "// SINNOH_PORT_END", "// HOENN_PORT_BEGIN", "// HOENN_PORT_END", before=False)
    B.replace_block(mh, "// HOENN_PORT_BEGIN", "// HOENN_PORT_END", "\n".join(header_entries) + "\n")
    meson_list("files/fielddata/mapmatrix/map_matrix/meson.build", "    # SINNOH_PORT_END", gen_matrices)
    meson_list("files/fielddata/eventdata/zone_event/meson.build", "    # SINNOH_PORT_END", [f"{e}.json" for e in gen_events])
    sp = "files/fielddata/script/scr_seq/meson.build"
    s = open(sp).read()
    if "# HOENN_PORT_HDR_BEGIN" not in s:
        s = s.replace("    # SINNOH_PORT_HDR_END", "    # SINNOH_PORT_HDR_END\n    # HOENN_PORT_HDR_BEGIN\n    # HOENN_PORT_HDR_END", 1)
        s = s.replace("    # SINNOH_PORT_END", "    # SINNOH_PORT_END\n    # HOENN_PORT_BEGIN\n    # HOENN_PORT_END", 1)
        open(sp, "w").write(s)
    B.replace_block(sp, "    # HOENN_PORT_HDR_BEGIN", "    # HOENN_PORT_HDR_END", "".join(f"    'event_{c}.h',\n" for c in gen_codes))
    B.replace_block(sp, "    # HOENN_PORT_BEGIN", "    # HOENN_PORT_END", "".join(f"    '{x}.s',\n" for x in gen_scripts + gen_hdrs))
    open(gen_list, "w").write("\n".join(generated_files) + "\n")
    lines = [l for l in open("files/msgdata/NARC_msg.txt").read().split("\n") if l.strip()]
    lines += [f"NARC_msg_{bank}_bin" for bank in gen_msgs if f"NARC_msg_{bank}_bin" not in lines]
    open("files/msgdata/NARC_msg.txt", "w").write("\n".join(lines) + "\n")
    for ts, idx in sorted(rb.animated_refs):
        todo.append(f"{ts}: tile {idx} is an animated slot (tileset_anims.c); drawn blank until animation frames are imported")
    open(os.path.join(HERE, "TODO.txt"), "w").write("\n".join(todo) + "\n")
    print(f"imported {len(manifest)} Hoenn maps; {len(todo)} follow-ups in tools/hoenn_port/TODO.txt")


if __name__ == "__main__":
    main()
