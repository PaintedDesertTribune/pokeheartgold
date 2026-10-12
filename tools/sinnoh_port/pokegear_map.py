"""Build the Sinnoh page of the Pokégear map from Diamond's Town Map.

Diamond: files/graphic/tmap_gra member 19 (4bpp tiles), 22 (Sinnoh tilemap, 32x24), 24 (route/town overlay) and
palette 0. HeartGold's map layers are 8bpp over the 256-colour palette pgmap_gra 63, so each Diamond colour is
matched to the nearest colour HeartGold's own map tiles already use, the route overlay is composited into the
picture pixel by pixel, and the result is written as an indexed PNG tile sheet (member 70, converted to NCGR at build
time like member 10) plus a 64x32 NSCR (member 71) holding the 32x22 map at rows 2..23, HeartGold's own offset.
"""
import os
import struct
import sys
import zlib

DP = sys.argv[1] if len(sys.argv) > 1 else "/Users/shawn/code/pokediamond"
TM = f"{DP}/files/graphic/tmap_gra/"
PG = "files/application/pokegear/map/pgmap_gra/"
MAP_ROWS = 22   # rows 22-23 of Diamond's tilemap are the app's bottom bar


def nclr(path):
    b = open(path, "rb").read()
    off = struct.unpack_from("<I", b, 0x24)[0]
    data = b[0x18 + off:]                       # Diamond's size field overstates the data; take what is there
    data = data[:len(data) // 2 * 2]
    return [((v & 31) * 8, ((v >> 5) & 31) * 8, ((v >> 10) & 31) * 8) for v in struct.unpack_from(f"<{len(data) // 2}H", data, 0)]


def ncgr4(path):
    b = open(path, "rb").read()
    n = struct.unpack_from("<I", b, 0x28)[0]
    off = struct.unpack_from("<I", b, 0x2C)[0]
    data = b[0x18 + off:0x18 + off + n]
    return [[p for byte in data[t * 32:(t + 1) * 32] for p in (byte & 15, byte >> 4)] for t in range(len(data) // 32)]


def nscr(path):
    b = open(path, "rb").read()
    w, h = struct.unpack_from("<HH", b, 0x18)
    n = struct.unpack_from("<I", b, 0x20)[0]
    return w // 8, h // 8, list(struct.unpack_from(f"<{n // 2}H", b, 0x24))


def png_read_indexed(path):
    b = open(path, "rb").read()
    pos, idat, plte = 8, b"", None
    while pos < len(b):
        n = struct.unpack(">I", b[pos:pos + 4])[0]
        t, d = b[pos + 4:pos + 8], b[pos + 8:pos + 8 + n]
        pos += 12 + n
        if t == b"IHDR":
            w, h = struct.unpack(">II", d[:8])
        elif t == b"PLTE":
            plte = [tuple(d[i:i + 3]) for i in range(0, n, 3)]
        elif t == b"IDAT":
            idat += d
    raw = zlib.decompress(idat)
    rows = [raw[y * (w + 1) + 1:y * (w + 1) + 1 + w] for y in range(h)]
    assert all(raw[y * (w + 1)] == 0 for y in range(h)), "png filter"
    return w, h, plte, rows


def png_write_indexed(path, w, h, plte, rows):
    def chunk(t, d):
        return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    raw = b"".join(b"\x00" + bytes(r) for r in rows)
    out = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 3, 0, 0, 0))
    out += chunk(b"PLTE", b"".join(bytes(c) for c in plte)) + chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")
    open(path, "wb").write(out)


def main():
    pal = nclr(TM + "narc_0000.NCLR")
    tiles = ncgr4(TM + "narc_0019.NCGR")
    w, h, base = nscr(TM + "narc_0022.NSCR")
    _, _, routes = nscr(TM + "narc_0024.NSCR")
    assert (w, h) == (32, 24)
    # HeartGold palette: the colours its own map tiles use (safe indices), from NCLR 63 and the png 10 pixels
    hg_pal = nclr(PG + "pgmap_gra_00000063.NCLR")
    _, _, plte10, rows10 = png_read_indexed(PG + "pgmap_gra_00000010.png")
    used = sorted({p for r in rows10 for p in r})

    def nearest(rgb):
        return min(used, key=lambda i: sum((a - b) ** 2 for a, b in zip(hg_pal[i], rgb)))
    # composite: per screen cell, route tile pixels (non-zero) over the base tile pixels; result is an 8x8 index block
    def pix(ent, x, y):
        tid, hf, vf, pb = ent & 0x3FF, (ent >> 10) & 1, (ent >> 11) & 1, ent >> 12
        t = tiles[tid]
        return t[(7 - y if vf else y) * 8 + (7 - x if hf else x)], pb
    cells = []
    for i in range(32 * MAP_ROWS):
        block = []
        for y in range(8):
            for x in range(8):
                c, pb = pix(base[i], x, y)
                rc, rpb = pix(routes[i], x, y)
                if rc:
                    c, pb = rc, rpb
                block.append(nearest(pal[pb * 16 + c]))
        cells.append(bytes(block))
    uniq = {}
    order = []
    entries = []
    for blk in cells:
        if blk not in uniq:
            uniq[blk] = len(order)
            order.append(blk)
        entries.append(uniq[blk])
    assert len(order) <= 768, len(order)
    print(f"{len(order)} unique tiles")
    # tile sheet png: 64 tiles per row, 8bpp indexed with NCLR 63 as PLTE
    sheet_rows_n = (len(order) + 63) // 64
    sheet = [bytearray(512) for _ in range(sheet_rows_n * 8)]
    for n, blk in enumerate(order):
        tx, ty = (n % 64) * 8, (n // 64) * 8
        for y in range(8):
            sheet[ty + y][tx:tx + 8] = blk[y * 8:(y + 1) * 8]
    png_write_indexed(PG + "pgmap_gra_00000070.png", 512, sheet_rows_n * 8, hg_pal[:256], sheet)   # NCLR 63 carries a trailing block past its 256 colours
    # NSCR 64x32 (512x256): map at rows 2..23, palette bank 0, no flips
    tm = [0] * (64 * 32)
    for i, e in enumerate(entries):
        x, y = i % 32, i // 32
        tm[(y + 2) * 64 + x] = e
    data = b"".join(struct.pack("<H", e) for e in tm)
    scrn = b"NRCS" + struct.pack("<I", 0x14 + len(data)) + struct.pack("<HHHHI", 512, 256, 2, 2, len(data)) + data   # mode words as in member 11
    nscr_bin = b"RCSN" + struct.pack("<HHIHH", 0xFEFF, 0x0100, 0x10 + len(scrn), 0x10, 1) + scrn
    open(PG + "pgmap_gra_00000071.NSCR", "wb").write(nscr_bin)
    print("wrote pgmap_gra_00000070.png and pgmap_gra_00000071.NSCR")


if __name__ == "__main__":
    main()
