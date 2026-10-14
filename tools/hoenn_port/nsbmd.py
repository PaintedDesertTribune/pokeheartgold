"""Minimal NSBMD (BMD0 / MDL0) writer for flat, textured map chunks, plus a reader to check the result.

Mirrors the layout of HeartGold's own land-chunk models (one node, materials that name textures in the
area's texture set, one display-list shape per material, render commands that bind each pair):

    BMD0 header | MDL0 block: model dict | model: header(0x40) node dict + node | SBC | materials | shapes

Units: the engine multiplies vertices by posScale (64 here, like HeartGold's chunks), so one 16-unit map
tile is 0.25 in vertex units and a 32x32 chunk spans -4..4 centred on the origin.
"""
import os, struct, sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "sinnoh_port"))
import nsbtx  # noqa: E402

POS_SCALE = 64
VTX_UNIT = 16 / POS_SCALE          # one map tile, in vertex units


def name16(s):
    b = s.encode() if isinstance(s, str) else s
    assert len(b) <= 16, s
    return b.ljust(16, b"\0")


def fx16(v):
    i = int(round(v * 4096))
    assert -32768 <= i < 32768, v
    return i & 0xFFFF


def fx32(v):
    return int(round(v * 4096)) & 0xFFFFFFFF


class DisplayList:
    """DS GX command stream: four packed command bytes, then their parameters in order."""
    BEGIN_VTXS, END_VTXS, COLOR, NORMAL, TEXCOORD, VTX_16 = 0x40, 0x41, 0x20, 0x21, 0x22, 0x23

    def __init__(self):
        self.ops = []

    def add(self, cmd, *params):
        self.ops.append((cmd, [p & 0xFFFFFFFF for p in params]))

    def color(self, r, g, b):
        self.add(self.COLOR, r | (g << 5) | (b << 10))

    def normal_up(self):
        self.add(self.NORMAL, 0x1FF << 10)   # (0, ~1, 0) in 1.9 fixed point

    def texcoord(self, s_texel, t_texel):
        s, t = int(round(s_texel * 16)), int(round(t_texel * 16))
        self.add(self.TEXCOORD, (s & 0xFFFF) | ((t & 0xFFFF) << 16))

    def vertex(self, x, y, z):
        self.add(self.VTX_16, fx16(x) | (fx16(y) << 16), fx16(z))

    def pack(self):
        ops = list(self.ops)
        while len(ops) % 4:
            ops.append((0, []))
        out = b""
        for i in range(0, len(ops), 4):
            grp = ops[i:i + 4]
            out += bytes(c for c, _ in grp)
            for _, p in grp:
                out += b"".join(struct.pack("<I", x) for x in p)
        return out


def quad_shape(quads):
    """A display list drawing textured quads. quads: list of 4 (x, y, z, s, t) corners, counter-clockwise seen from above."""
    dl = DisplayList()
    dl.color(31, 31, 31)
    dl.normal_up()
    dl.add(DisplayList.BEGIN_VTXS, 1)
    for q in quads:
        for x, y, z, s, t in q:
            dl.texcoord(s, t)
            dl.vertex(x, y, z)
    dl.add(DisplayList.END_VTXS)
    return dl.pack(), len(quads) * 4, len(quads)


def material_bytes(tex_w, tex_h, repeat=False, alpha=31):
    poly_attr = 0x00008081 | (alpha << 16)        # light 0, draw front faces, alpha; matches HeartGold's ground materials
    tex_param = 0x00030000 if repeat else 0
    return struct.pack("<HHIIIIIIHHHHII", 0, 0x2C, 0x7FFFE739, 0, poly_attr, 0x3F1FF8FF, tex_param, 0xFFFFFFFF,
                       0, 0x1FCE, tex_w, tex_h, 0x1000, 0x1000)


def write_model(model_name, materials, shapes, box=None):
    """materials: list of (material name, texture name, palette name, tex_w, tex_h, repeat)
    shapes: list of (material index, quads) with quads as for quad_shape. Returns the NSBMD bytes."""
    num_mat, num_shp = len(materials), len(shapes)
    # --- shapes
    dls, nvtx, npoly = [], 0, 0
    for _, quads in shapes:
        dl, nv, nq = quad_shape(quads)
        dls.append(dl)
        nvtx += nv
        npoly += nq
    shp_names = [name16(f"polygon{i}") for i in range(num_shp)]
    shp_dict_len = len(nsbtx.build_dict(shp_names, [b"\0" * 4] * num_shp, 4))
    shp_hdr_base = shp_dict_len
    shp_entries, shp_hdrs, dl_blob = [], b"", b""
    dl_base = shp_hdr_base + 16 * num_shp
    for i, dl in enumerate(dls):
        hdr_off = shp_hdr_base + 16 * i
        dl_off = dl_base + len(dl_blob)
        shp_entries.append(struct.pack("<I", hdr_off))
        shp_hdrs += struct.pack("<HHIII", 0, 16, 5, dl_off - hdr_off, len(dl))
        dl_blob += dl
    shp_section = nsbtx.build_dict(shp_names, shp_entries, 4) + shp_hdrs + dl_blob
    shp_section += b"\0" * (-len(shp_section) % 4)
    # --- materials: [ofs tex dict, ofs pltt dict][mat dict][tex->mat dict][pltt->mat dict][index lists][material data]
    mat_names = [name16(m[0]) for m in materials]
    tex_to_mat, pltt_to_mat = {}, {}
    for i, (_, tex, pltt, _, _, _) in enumerate(materials):
        tex_to_mat.setdefault(tex, []).append(i)
        pltt_to_mat.setdefault(pltt, []).append(i)
    tex_keys, pltt_keys = list(tex_to_mat), list(pltt_to_mat)
    mat_dict_len = len(nsbtx.build_dict(mat_names, [b"\0" * 4] * num_mat, 4))
    tex_dict_len = len(nsbtx.build_dict([name16(k) for k in tex_keys], [b"\0" * 4] * len(tex_keys), 4))
    pltt_dict_len = len(nsbtx.build_dict([name16(k) for k in pltt_keys], [b"\0" * 4] * len(pltt_keys), 4))
    ofs_tex_dict = 4 + mat_dict_len
    ofs_pltt_dict = ofs_tex_dict + tex_dict_len
    lists_off = ofs_pltt_dict + pltt_dict_len
    lists, tex_entries, pltt_entries = b"", [], []
    for k in tex_keys:
        tex_entries.append(struct.pack("<HBB", lists_off + len(lists), len(tex_to_mat[k]), 0))
        lists += bytes(tex_to_mat[k])
    for k in pltt_keys:
        pltt_entries.append(struct.pack("<HBB", lists_off + len(lists), len(pltt_to_mat[k]), 0))
        lists += bytes(pltt_to_mat[k])
    lists += b"\0" * (-(lists_off + len(lists)) % 4)
    mat_data_off = lists_off + len(lists)
    mat_entries = [struct.pack("<I", mat_data_off + 0x2C * i) for i in range(num_mat)]
    mat_section = struct.pack("<HH", ofs_tex_dict, ofs_pltt_dict)
    mat_section += nsbtx.build_dict(mat_names, mat_entries, 4)
    mat_section += nsbtx.build_dict([name16(k) for k in tex_keys], tex_entries, 4)
    mat_section += nsbtx.build_dict([name16(k) for k in pltt_keys], pltt_entries, 4)
    mat_section += lists
    assert len(mat_section) == mat_data_off
    for _, _, _, w, h, repeat in materials:
        mat_section += material_bytes(w, h, repeat)
    # --- node + render commands
    node_dict = nsbtx.build_dict([name16("polySurface0")], [struct.pack("<I", 0)], 4)
    node_dict = nsbtx.build_dict([name16("polySurface0")], [struct.pack("<I", len(node_dict))], 4)
    node_data = struct.pack("<HH", 0xF807, 0x1000)       # trans zero, rot zero, scale one, no matrix stack slot
    sbc = bytes([0x26, 0, 0, 0, 0, 0x02, 0, 1, 0x0B])
    for mat_idx, _ in shapes:
        pass
    for i, (mat_idx, _) in enumerate(shapes):
        sbc += bytes([0x04, mat_idx, 0x05, i])
    sbc += bytes([0x2B, 0x01])
    sbc += b"\0" * (-len(sbc) % 4)
    ofs_sbc = 0x40 + len(node_dict) + len(node_data)
    ofs_mat = ofs_sbc + len(sbc)
    ofs_shp = ofs_mat + len(mat_section)
    ofs_mtx = ofs_shp + len(shp_section)
    model_size = ofs_mtx
    if box is None:
        xs = [c[0] for _, q in shapes for quad in q for c in quad] or [0]
        ys = [c[1] for _, q in shapes for quad in q for c in quad] or [0]
        zs = [c[2] for _, q in shapes for quad in q for c in quad] or [0]
        box = (min(xs), min(ys), min(zs), max(xs) - min(xs), max(ys) - min(ys) + 1 / 64, max(zs) - min(zs))
    bs = 2.0   # box values are stored as fx16 times boxPosScale; chunk extents of +-4 fit with scale 2
    hdr = struct.pack("<5I", model_size, ofs_sbc, ofs_mat, ofs_shp, ofs_mtx)
    hdr += struct.pack("<BBBBBBBB", 0, 0, 0, 1, num_mat, num_shp, 1, 0)
    hdr += struct.pack("<II", fx32(POS_SCALE), fx32(1 / POS_SCALE))
    hdr += struct.pack("<HHHH", nvtx, npoly, 0, npoly)
    hdr += struct.pack("<6H", *(fx16(v / bs) for v in box))
    hdr += struct.pack("<II", fx32(bs), fx32(1 / bs))
    assert len(hdr) == 0x40
    model = hdr + node_dict + node_data + sbc + mat_section + shp_section
    assert len(model) == model_size
    mdl_dict = nsbtx.build_dict([name16(model_name)], [struct.pack("<I", 0)], 4)
    mdl_dict = nsbtx.build_dict([name16(model_name)], [struct.pack("<I", 8 + len(mdl_dict))], 4)
    mdl0 = b"MDL0" + struct.pack("<I", 8 + len(mdl_dict) + len(model)) + mdl_dict + model
    return b"BMD0" + struct.pack("<HHIHHI", 0xFEFF, 2, 0x14 + len(mdl0), 0x10, 1, 0x14) + mdl0


def parse(blob):
    """Read back the parts of an NSBMD this module cares about; used to check written files and real ones alike."""
    nb = struct.unpack_from("<H", blob, 14)[0]
    M = struct.unpack_from(f"<{nb}I", blob, 16)[0]
    names, entries, _ = nsbtx._dict(blob, M + 8)
    out = {"models": []}
    for name, e in zip(names, entries):
        mo = M + struct.unpack_from("<I", e, 0)[0]
        size, sbc, mat, shp, mtx = struct.unpack_from("<5I", blob, mo)
        nnode, nmat, nshp = struct.unpack_from("<BBB", blob, mo + 0x17)
        pos_scale = struct.unpack_from("<I", blob, mo + 0x1C)[0] / 4096
        mt = mo + mat
        tdo, pdo = struct.unpack_from("<HH", blob, mt)
        mnames, mentries, _ = nsbtx._dict(blob, mt + 4)
        tnames, tentries, _ = nsbtx._dict(blob, mt + tdo)
        pnames, pentries, _ = nsbtx._dict(blob, mt + pdo)
        mats = []
        for mn, me in zip(mnames, mentries):
            o = mt + struct.unpack_from("<I", me, 0)[0]
            f = struct.unpack_from("<HHIIIIIIHHHHII", blob, o)
            mats.append((mn.rstrip(b"\0").decode(), dict(polyAttr=f[4], texParam=f[6], flag=f[9], w=f[10], h=f[11])))
        tex_bind = {}
        for tn, te in zip(tnames, tentries):
            off, n, _ = struct.unpack_from("<HBB", te, 0)
            tex_bind[tn.rstrip(b"\0").decode()] = list(blob[mt + off: mt + off + n])
        sp = mo + shp
        snames, sentries, _ = nsbtx._dict(blob, sp)
        shapes = []
        for sn, se in zip(snames, sentries):
            o = sp + struct.unpack_from("<I", se, 0)[0]
            tag, sz, flag, dlo, dls = struct.unpack_from("<HHIII", blob, o)
            shapes.append((sn.rstrip(b"\0").decode(), flag, dls, blob[o + dlo: o + dlo + dls]))
        out["models"].append(dict(name=name.rstrip(b"\0").decode(), size=size, nodes=nnode, pos_scale=pos_scale,
                                  sbc=blob[mo + sbc: mo + mat], materials=mats, tex_bind=tex_bind, shapes=shapes))
    return out


if __name__ == "__main__":
    # Self-check: one 2x2-tile floor with one texture, written then read back; then the same reader on a real chunk.
    t = VTX_UNIT
    quads = [[(x * t, 0, z * t, 0, 0), (x * t, 0, (z + 1) * t, 0, 16), ((x + 1) * t, 0, (z + 1) * t, 16, 16), ((x + 1) * t, 0, z * t, 16, 0)]
             for x in range(2) for z in range(2)]
    blob = write_model("test_chunk", [("grass", "grass_tex", "grass_pal", 16, 16, True)], [(0, quads)])
    p = parse(blob)["models"][0]
    print("written:", len(blob), "bytes;", p["name"], "materials", [m[0] for m in p["materials"]], "tex bind", p["tex_bind"],
          "shapes", [(s[0], s[1], s[2]) for s in p["shapes"]], "sbc", p["sbc"].hex())
    if len(sys.argv) > 1:
        r = parse(open(sys.argv[1], "rb").read())["models"][0]
        print("real:", r["name"], "pos_scale", r["pos_scale"], "materials", len(r["materials"]), "shapes", len(r["shapes"]),
              "first material", r["materials"][8] if len(r["materials"]) > 8 else r["materials"][0], "sbc", r["sbc"].hex())
