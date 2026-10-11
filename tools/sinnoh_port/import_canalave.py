#!/usr/bin/env python3
"""Import Canalave City's overworld data from the pokediamond repo into this repo.

Appends new members to HeartGold's prebuilt field archives and writes a new map matrix.
Run from the pokeheartgold repo root on a clean checkout of the archives:

    python3 tools/sinnoh_port/import_canalave.py ../pokediamond

What it does
  * land data (a/0/6/5):   Diamond chunks 48 and 49 -> HeartGold format (adds the 0x1234 marker
                           and an empty BGS section), building ids remapped
  * building models (a/0/4/0): the Diamond NSBMDs Canalave uses, appended
  * building anim list (a/1/0/7): one default (no animation) 24-byte entry per new model
  * bm_field_matshp.dat:   one empty row per new model
  * map texture set (a/0/4/4): Diamond tex set 15, appended
  * area build list (a/0/4/3): the new model ids, appended
  * area data (a/0/4/2):   one entry pointing at the new build list and tex set
  * map matrix:            files/fielddata/mapmatrix/map_matrix/map_matrix_0288_C02.bin (1 x 2)

It prints the indices it created so the map header can reference them.
"""
import os
import struct
import sys

DP_CHUNKS = [48, 49]           # land_data ids of Canalave City in Diamond's main matrix
DP_AREA_BUILD = 11             # area_build list Canalave's area uses
DP_TEX_SET = 15                # map_tex_set Canalave's area uses
MATRIX_NAME = "C02"
MATRIX_FILE = "files/fielddata/mapmatrix/map_matrix/map_matrix_0288_C02.bin"

HG_LAND = "files/a/0/6/5"
HG_MODELS = "files/a/0/4/0"
HG_ANIM = "files/a/1/0/7"
HG_TEX = "files/a/0/4/4"
HG_BUILDLIST = "files/a/0/4/3"
HG_AREA = "files/a/0/4/2"
HG_MATSHP = "files/fielddata/build_model/bm_field_matshp.dat"

# Expected member counts on a stock checkout; the tool refuses to run twice.
EXPECTED = {HG_LAND: 676, HG_MODELS: 340, HG_ANIM: 340, HG_TEX: 106, HG_BUILDLIST: 104, HG_AREA: 106}


def narc_read(path):
    b = open(path, "rb").read()
    assert b[:4] == b"NARC", path
    p = 0x10
    assert b[p:p + 4] == b"BTAF"
    fat_size = struct.unpack_from("<I", b, p + 4)[0]
    n = struct.unpack_from("<H", b, p + 8)[0]
    fat = [struct.unpack_from("<II", b, p + 12 + 8 * i) for i in range(n)]
    p += fat_size
    assert b[p:p + 4] == b"BTNF"
    fnt_size = struct.unpack_from("<I", b, p + 4)[0]
    fnt = b[p:p + fnt_size]
    p += fnt_size
    assert b[p:p + 4] == b"GMIF"
    img = p + 8
    members = [b[img + s:img + e] for s, e in fat]
    return members, fnt


def narc_write(path, members, fnt):
    def pad4(x):
        return x + b"\xff" * (-len(x) % 4)
    fat = bytearray()
    img = bytearray()
    for m in members:
        s = len(img)
        img += m
        e = len(img)
        fat += struct.pack("<II", s, e)
        img = bytearray(pad4(bytes(img)))
    fatb = b"BTAF" + struct.pack("<IHH", 12 + len(fat), len(members), 0) + fat
    gmif = b"GMIF" + struct.pack("<I", 8 + len(img)) + img
    total = 16 + len(fatb) + len(fnt) + len(gmif)
    hdr = b"NARC" + struct.pack("<HHIHH", 0xFFFE, 0x0100, total, 16, 3)
    open(path, "wb").write(hdr + fatb + fnt + gmif)


def dp_land(dp, idx):
    return open(f"{dp}/files/fielddata/land_data/land_data_release/narc_{idx:04d}.bin", "rb").read()


def convert_land(chunk, id_map):
    perm, bld, mdl, bdhc = struct.unpack_from("<4I", chunk, 0)
    body = bytearray(chunk[0x10:])
    assert len(body) == perm + bld + mdl + bdhc, "Diamond land data sizes do not add up"
    # remap building ids (first u32 of each 48-byte entry)
    for i in range(bld // 0x30):
        off = perm + i * 0x30
        old = struct.unpack_from("<I", body, off)[0]
        struct.pack_into("<I", body, off, id_map[old])
    # HeartGold header: four sizes, then u16 0x1234 marker and u16 BGS size (0 = none)
    hdr = struct.pack("<4IHH", perm, bld, mdl, bdhc, 0x1234, 0)
    return bytes(hdr) + bytes(body)


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    dp = sys.argv[1].rstrip("/")
    for path, count in EXPECTED.items():
        got = len(narc_read(path)[0])
        if got != count:
            sys.exit(f"{path} has {got} members, expected {count}: already imported? run on a clean checkout")

    # 1. which Diamond building models does Canalave use
    area_build = open(f"{dp}/files/fielddata/areadata/area_build_model/area_build/narc_{DP_AREA_BUILD:04d}.bin", "rb").read()
    dp_ids = list(struct.unpack_from(f"<{len(area_build)//2}H", area_build, 0))
    chunks = {c: dp_land(dp, c) for c in DP_CHUNKS}
    for c in chunks.values():
        perm, bld = struct.unpack_from("<2I", c, 0)
        for i in range(bld // 0x30):
            bid = struct.unpack_from("<I", c, 0x10 + perm + i * 0x30)[0]
            if bid not in dp_ids:
                dp_ids.append(bid)
    dp_ids = sorted(set(dp_ids))

    # 2. append the models, their anim-list rows and matshp rows
    models, fnt = narc_read(HG_MODELS)
    dp_models, _ = narc_read(f"{dp}/files/fielddata/build_model/build_model.narc")
    id_map = {}
    for bid in dp_ids:
        id_map[bid] = len(models)
        models.append(dp_models[bid])
    narc_write(HG_MODELS, models, fnt)

    anim, fnt = narc_read(HG_ANIM)
    for _ in dp_ids:
        anim.append(b"\xff\xff" + b"\x00" * 6 + b"\xff" * 16)
    narc_write(HG_ANIM, anim, fnt)

    ms = open(HG_MATSHP, "rb").read()
    n, e = struct.unpack_from("<HH", ms, 0)
    table = ms[4:4 + 4 * n] + struct.pack("<HH", 0, 0xFFFF) * len(dp_ids)
    open(HG_MATSHP, "wb").write(struct.pack("<HH", n + len(dp_ids), e) + table + ms[4 + 4 * n:])

    # 3. texture set, build list, area data
    tex, fnt = narc_read(HG_TEX)
    tex_index = len(tex)
    tex.append(open(f"{dp}/files/fielddata/areadata/area_map_tex/map_tex_set/narc_{DP_TEX_SET:04d}.bin", "rb").read())
    narc_write(HG_TEX, tex, fnt)

    lists, fnt = narc_read(HG_BUILDLIST)
    list_index = len(lists)
    lists.append(b"".join(struct.pack("<H", id_map[b]) for b in dp_ids))
    narc_write(HG_BUILDLIST, lists, fnt)

    areas, fnt = narc_read(HG_AREA)
    area_index = len(areas)
    # build list, tex set, unused, outdoor (field models), lighting
    areas.append(struct.pack("<HHHBB", list_index, tex_index, 0, 1, 1))
    narc_write(HG_AREA, areas, fnt)

    # 4. land data
    land, fnt = narc_read(HG_LAND)
    land_ids = []
    for c in DP_CHUNKS:
        land_ids.append(len(land))
        land.append(convert_land(chunks[c], id_map))
    narc_write(HG_LAND, land, fnt)

    # 5. matrix: 1 wide, 2 tall, no header section (filled with the map id at load), altitudes 0
    w, h = 1, len(DP_CHUNKS)
    name = MATRIX_NAME.encode()
    m = struct.pack("<BBBBB", w, h, 0, 1, len(name)) + name
    m += bytes(w * h)                                    # altitudes
    m += b"".join(struct.pack("<H", i) for i in land_ids)  # land data ids, row-major
    os.makedirs(os.path.dirname(MATRIX_FILE), exist_ok=True)
    open(MATRIX_FILE, "wb").write(m)

    print(f"models appended: {len(dp_ids)} (Diamond ids {dp_ids})")
    print(f"areaDataBank = {area_index}  (build list {list_index}, tex set {tex_index})")
    print(f"land data ids = {land_ids}")
    print(f"matrix written: {MATRIX_FILE}")


if __name__ == "__main__":
    main()
