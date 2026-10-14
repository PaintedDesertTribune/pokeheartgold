"""Readers for pokeruby's map data: layouts, tilesets, metatiles and the per-map tile grid.

A Gen 3 map is a grid of u16 cells: bits 0-9 metatile id (0-511 primary tileset, 512+ secondary), bits 10-11
collision, bits 12-15 elevation. A metatile is 8 u16 tiles (two 2x2 layers, bottom first); each tile u16 is
bits 0-9 tile index, bit 10 hflip, bit 11 vflip, bits 12-15 palette. Tiles are 8x8 4bpp from tiles.png; the
primary tileset owns palettes 0-5 and tiles 0-511, the secondary palettes 6-11 and tiles 512+.
"""
import json, os, re, struct, zlib

NUM_TILES_IN_PRIMARY = 512
NUM_METATILES_IN_PRIMARY = 512
NUM_PALS_IN_PRIMARY = 6
LAYER_NORMAL, LAYER_COVERED, LAYER_SPLIT = 0, 1, 2   # which bg layers a metatile's two halves use (see global.fieldmap.h)


def read_indexed_png(path):
    """(width, height, pixels) of a non-interlaced palette PNG of 1/2/4/8 bits per pixel; pixels are palette indices."""
    d = open(path, "rb").read()
    assert d[:8] == bytes([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]), path
    p, idat, w = 8, b"", None
    while p < len(d):
        n, kind = struct.unpack_from(">I4s", d, p)
        body = d[p + 8:p + 8 + n]
        if kind == b"IHDR":
            w, h, depth, ctype, _c, _f, inter = struct.unpack(">IIBBBBB", body)
            assert ctype == 3 and inter == 0 and depth in (1, 2, 4, 8), (path, ctype, depth, inter)
        elif kind == b"IDAT":
            idat += body
        p += 12 + n
    raw = zlib.decompress(idat)
    stride = (w * depth + 7) // 8
    out, prev, q = bytearray(), bytearray(stride), 0
    for _y in range(h):
        f, line = raw[q], bytearray(raw[q + 1:q + 1 + stride])
        q += 1 + stride
        for i in range(stride):   # PNG filters: none, sub, up, average, paeth (byte-wise, bpp = 1 for sub-byte depths)
            a = line[i - 1] if i >= 1 else 0
            b = prev[i]
            c = prev[i - 1] if i >= 1 else 0
            if f == 1:
                line[i] = (line[i] + a) & 255
            elif f == 2:
                line[i] = (line[i] + b) & 255
            elif f == 3:
                line[i] = (line[i] + (a + b) // 2) & 255
            elif f == 4:
                pa, pb, pc = abs(b - c), abs(a - c), abs(a + b - 2 * c)
                line[i] = (line[i] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        if depth == 8:
            out += line[:w]
        else:
            per = 8 // depth
            mask = (1 << depth) - 1
            out += bytes((line[x // per] >> (8 - depth * (x % per + 1))) & mask for x in range(w))
        prev = line
    return w, h, bytes(out)


class Ruby:
    def __init__(self, repo):
        self.repo = repo
        self.layouts = {l["id"]: l for l in json.load(open(f"{repo}/data/layouts/layouts.json"))["layouts"]}
        self.maps = {}
        for name in os.listdir(f"{repo}/data/maps"):
            p = f"{repo}/data/maps/{name}/map.json"
            if os.path.exists(p):
                m = json.load(open(p))
                self.maps[m["id"]] = m
        # tileset symbol -> directory, from data/tilesets/headers.inc + graphics.inc
        self.tileset_dirs = {}
        # secondary tilesets are declared in data/tilesets/graphics.inc, the primary ones in src/data/graphics.c
        gfx = open(f"{repo}/data/tilesets/graphics.inc").read() + open(f"{repo}/src/data/graphics.c").read()
        for sym, path in re.findall(r"(gTilesetTiles_\w+)(?:::[^\n]*\n\s*\.incbin|\[\] = INCBIN_U16\() ?\"data/tilesets/([\w/]+)/tiles", gfx):
            self.tileset_dirs["gTileset_" + sym[len("gTilesetTiles_"):]] = f"{repo}/data/tilesets/{path}"
        self._tilesets = {}
        self.animated_refs = set()

    def tileset(self, sym):
        if sym not in self._tilesets:
            d = self.tileset_dirs[sym]
            w, h, px = read_indexed_png(f"{d}/tiles.png")
            assert w == 128, (sym, w, h)
            tiles = []
            for ty in range(h // 8):
                for tx in range(w // 8):
                    tiles.append(bytes(px[(ty * 8 + y) * w + tx * 8 + x] & 15 for y in range(8) for x in range(8)))
            pals = []
            for i in range(16):
                p = f"{d}/palettes/{i:02d}.pal"
                lines = open(p).read().split("\n")
                assert lines[0].startswith("JASC"), p
                pals.append([tuple(int(v) for v in ln.split()) for ln in lines[3:19]])
            mt = open(f"{d}/metatiles.bin", "rb").read()
            metatiles = [struct.unpack_from("<8H", mt, i * 16) for i in range(len(mt) // 16)]
            ma = open(f"{d}/metatile_attributes.bin", "rb").read()
            attrs = struct.unpack(f"<{len(ma)//2}H", ma)
            self._tilesets[sym] = dict(tiles=tiles, palettes=pals, metatiles=metatiles, attrs=attrs)
        return self._tilesets[sym]

    def grid(self, layout_id):
        """(w, h, cells) with cells as (metatile id, collision, elevation) row-major."""
        l = self.layouts[layout_id]
        b = open(f"{self.repo}/{l['blockdata_filepath']}", "rb").read()
        w, h = l["width"], l["height"]
        cells = [((c & 0x3FF), (c >> 10) & 3, c >> 12) for c in struct.unpack(f"<{w*h}H", b)]
        return w, h, cells

    def metatile(self, layout_id, mid):
        """(8 tile words, attribute word, tileset dict holding the tiles, tile index base) for a metatile id in a layout."""
        l = self.layouts[layout_id]
        if mid < NUM_METATILES_IN_PRIMARY:
            ts = self.tileset(l["primary_tileset"])
            return ts["metatiles"][mid], ts["attrs"][mid]
        ts = self.tileset(l["secondary_tileset"])
        i = mid - NUM_METATILES_IN_PRIMARY
        return ts["metatiles"][i], ts["attrs"][i]

    def tile_pixels(self, layout_id, word):
        """64 palette-local indices (row-major, flips applied) and the 16-colour palette for one tile word."""
        l = self.layouts[layout_id]
        idx, hf, vf, pal = word & 0x3FF, (word >> 10) & 1, (word >> 11) & 1, word >> 12
        prim, sec = self.tileset(l["primary_tileset"]), self.tileset(l["secondary_tileset"])
        palette = prim["palettes"][pal] if pal < NUM_PALS_IN_PRIMARY else sec["palettes"][pal]
        pool, i = (prim["tiles"], idx) if idx < NUM_TILES_IN_PRIMARY else (sec["tiles"], idx - NUM_TILES_IN_PRIMARY)
        if i >= len(pool):
            # An animated tile: the game copies animation frames into these slots at runtime (src/tileset_anims.c),
            # so the static tiles.png has nothing here. Blank for now; recorded so the importer can list it.
            self.animated_refs.add((l["primary_tileset"] if idx < NUM_TILES_IN_PRIMARY else l["secondary_tileset"], idx))
            return bytes(64), palette
        src = pool[i]
        px = bytearray(64)
        for y in range(8):
            for x in range(8):
                sx = 7 - x if hf else x
                sy = 7 - y if vf else y
                px[y * 8 + x] = src[sy * 8 + sx]
        return bytes(px), palette


if __name__ == "__main__":
    import sys
    rb = Ruby(sys.argv[1] if len(sys.argv) > 1 else "../pokeruby")
    lid = sys.argv[2] if len(sys.argv) > 2 else "LAYOUT_LITTLEROOT_TOWN"
    w, h, cells = rb.grid(lid)
    print(lid, w, "x", h, "cells; metatiles used:", len(set(c[0] for c in cells)))
    words = set()
    top_used = 0
    for mid, col, elev in cells:
        tiles, attr = rb.metatile(lid, mid)
        words.update(t for t in tiles if t & 0x3FF)
        if any(t & 0x3FF for t in tiles[4:]):
            top_used += 1
    print("unique non-blank tile words:", len(words), "; cells with a second layer:", top_used)
    print("collision values:", sorted(set(c[1] for c in cells)), "elevations:", sorted(set(c[2] for c in cells)))
    print("layer types used:", sorted(set((rb.metatile(lid, c[0])[1] >> 12) for c in cells)))
