"""Diamond -> HeartGold BDHC (walkable-height map) converter.

Diamond's BDHC: 0x44-byte header (u16 sizes/counts at 0x08..0x13), then points (12 bytes: fx16 x, fx32 height,
fx16 y), slopes (3 x s32 normal), plates as triangles (u16 x3 point indices, u16 slope, fx32 plane constant), then
lookup strips. Every rectangle is two consecutive triangles.
HeartGold's BDHC: "BDHC" + six u16 counts (points, slopes, heights, plates, strips, indices); points (fx16 x, fx16 y),
slopes (3 x s32), heights (fx32), plates (u16 min point, max point, slope, height), strips (u16 0, s16 y, u16 count,
u16 first index), plate indices. Layout and the strip algorithm follow DS Map Studio's BdhcLoaderDP/BdhcWriterHGSS.
"""
import struct


def read_dp(b):
    assert b[:4] == b"BDHC", "not a BDHC"
    size_pt, n_pt, size_sl, n_sl, size_pl, n_pl = struct.unpack_from("<6H", b, 8)
    o = 0x44
    pts = [struct.unpack_from("<HhIHh", b, o + i * size_pt) for i in range(n_pt)]      # fracX, x, height, fracY, y
    o += size_pt * n_pt
    slopes = [b[o + i * size_sl: o + (i + 1) * size_sl] for i in range(n_sl)]
    o += size_sl * n_sl
    tris = []
    for i in range(n_pl):
        p0, p1, p2, sl = struct.unpack_from("<4H", b, o + i * size_pl)
        tris.append((p0, p1, p2, sl, b[o + i * size_pl + 8: o + i * size_pl + 12]))
    return pts, slopes, tris


def read_hg(b):
    n_pt, n_sl, n_h, n_pl, n_st, n_ix = struct.unpack_from("<6H", b, 4)
    o = 16
    pts = [struct.unpack_from("<HhHh", b, o + i * 8) for i in range(n_pt)]; o += 8 * n_pt
    slopes = [b[o + i * 12: o + (i + 1) * 12] for i in range(n_sl)]; o += 12 * n_sl
    heights = [b[o + i * 4: o + (i + 1) * 4] for i in range(n_h)]; o += 4 * n_h
    plates = [struct.unpack_from("<4H", b, o + i * 8) for i in range(n_pl)]; o += 8 * n_pl
    strips = [struct.unpack_from("<HhHH", b, o + i * 8) for i in range(n_st)]; o += 8 * n_st
    idx = list(struct.unpack_from(f"<{n_ix}H", b, o))
    return pts, slopes, heights, plates, strips, idx


def make_strips(rects):
    """rects: list of (x0, y0, x1, y1) in tile units. Returns [(y, [plate indices])].
    A strip covers the band between two consecutive distinct plate edges and lists, by index, every plate that
    overlaps the band (closed at the top). This reproduces stock HeartGold tables for 585 of 674 chunks and a
    superset of them for 669."""
    y0s = {r[1] for r in rects}
    y1s = {r[3] for r in rects}
    ys = sorted(y1s | {y for y in y0s if y > min(y0s)})
    strips, prev = [], -32768
    for y in ys:
        strips.append((y, sorted(j for j, r in enumerate(rects) if prev < r[3] and y >= r[1])))
        prev = y
    return strips


def write_hg(pts, slopes, heights, plates, rects):
    strips = make_strips(rects)
    idx = [j for _, members in strips for j in members]
    out = b"BDHC" + struct.pack("<6H", len(pts), len(slopes), len(heights), len(plates), len(strips), len(idx))
    out += b"".join(struct.pack("<HhHh", *p) for p in pts)
    out += b"".join(slopes) + b"".join(heights)
    out += b"".join(struct.pack("<4H", *p) for p in plates)
    off = 0
    for y, members in strips:
        out += struct.pack("<HhHH", 0, y, len(members), off)
        off += len(members)
    out += struct.pack(f"<{len(idx)}H", *idx)
    return out


def convert(dp_bytes):
    pts, slopes, tris = read_dp(dp_bytes)
    hg_pts, pt_index = [], {}
    heights, h_index = [], {}
    plates, rects = [], []

    def point(fx, x, fy, y):
        key = (fx, x, fy, y)
        if key not in pt_index:
            pt_index[key] = len(hg_pts)
            hg_pts.append(key)
        return pt_index[key]

    for i in range(0, len(tris), 2):
        p0, p1, p2, sl, dist = tris[i]
        corners = [pts[k] for k in (p0, p1, p2)]
        xs = sorted((c[0], c[1]) for c in corners)   # (frac, int) pairs sort by int first when frac is 0
        xs = sorted(((c[1], c[0]) for c in corners))
        ys = sorted(((c[4], c[3]) for c in corners))
        (x0, fx0), (x1, fx1) = xs[0], xs[-1]
        (y0, fy0), (y1, fy1) = ys[0], ys[-1]
        if dist not in h_index:
            h_index[dist] = len(heights)
            heights.append(dist)
        plates.append((point(fx0, x0, fy0, y0), point(fx1, x1, fy1, y1), sl, h_index[dist]))
        rects.append((x0, y0, x1, y1))
    return write_hg(hg_pts, slopes, heights, plates, rects)


if __name__ == "__main__":
    import sys
    sys.stdout.write(f"{len(convert(open(sys.argv[1], 'rb').read()))} bytes\n")
