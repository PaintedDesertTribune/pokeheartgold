"""Minimal NSBTX (BTX0) reader/writer for merging the embedded TEX0 blocks of several NSBMD models
into one texture set, as HeartGold expects for an area's building textures (a/0/7/0).

Layout follows NitroSystem's NNSG3dResTex / NNSG3dResDict structures. The dictionary radix tree is
built with the classic Patricia insertion so NNS_G3dGetResDictIdxByName resolves every name.
"""
import struct

FMT_BPP = {1: 8, 2: 2, 3: 4, 4: 8, 6: 8, 7: 16}  # bits per texel; 5 (4x4 compressed) handled separately


def _dict(blob, off):
    """Parse an NNSG3dResDict at off. Returns (names, entry_bytes_list, size_unit)."""
    rev, num, size_dict, _dummy, ofs_entry = struct.unpack_from("<BBHHH", blob, off)
    e = off + ofs_entry
    size_unit, ofs_name = struct.unpack_from("<HH", blob, e)
    entries = [blob[e + 4 + size_unit * i : e + 4 + size_unit * (i + 1)] for i in range(num)]
    names = [blob[e + ofs_name + 16 * i : e + ofs_name + 16 * (i + 1)] for i in range(num)]
    return names, entries, size_unit


def read_tex0(blob):
    """Extract textures and palettes from the TEX0 block of an NSBMD/NSBTX.
    Returns dict name -> (texImageParam, extraParam, data) and dict name -> palette bytes."""
    o = blob.find(b"TEX0")
    if o < 0:
        return {}, {}
    _key, size_tex, ofs_dict, _flag, _pad, ofs_tex = struct.unpack_from("<IHHHHI", blob, o + 8)
    _k4, size_4x4, _d4, _f4, _p4, ofs_4x4, ofs_4x4_idx = struct.unpack_from("<IHHHHII", blob, o + 24)
    _kp, size_pltt, pltt_flag, ofs_pdict, _pp, ofs_pltt = struct.unpack_from("<IHHHHI", blob, o + 44)
    tex_data = blob[o + ofs_tex : o + ofs_tex + (size_tex << 3)]
    pltt_data = blob[o + ofs_pltt : o + ofs_pltt + (size_pltt << 3)]

    textures = {}
    names, entries, _ = _dict(blob, o + ofs_dict)
    for name, ent in zip(names, entries):
        param, extra = struct.unpack_from("<II", ent, 0)
        addr = (param & 0xFFFF) << 3
        w = 8 << ((param >> 20) & 7)
        h = 8 << ((param >> 23) & 7)
        fmt = (param >> 26) & 7
        if fmt == 5:
            raise NotImplementedError("4x4 compressed textures are not handled")
        nbytes = w * h * FMT_BPP[fmt] // 8
        textures[name] = (param, extra, tex_data[addr : addr + nbytes], fmt)

    palettes = {}
    pnames, pentries, _ = _dict(blob, o + ofs_pdict)
    offsets = [struct.unpack_from("<HH", ent, 0)[0] << 3 for ent in pentries]
    order = sorted(range(len(pnames)), key=lambda i: offsets[i])
    for k, i in enumerate(order):
        start = offsets[i]
        end = offsets[order[k + 1]] if k + 1 < len(order) else len(pltt_data)
        palettes[pnames[i]] = pltt_data[start:end]
    return textures, palettes


def _bit(name16, b):
    return (struct.unpack_from("<I", name16, (b >> 5) * 4)[0] >> (b & 31)) & 1


def _highest_diff_bit(a, b):
    for bit in range(127, -1, -1):
        if _bit(a, bit) != _bit(b, bit):
            return bit
    raise ValueError("duplicate name")


def build_dict(names, entries, size_unit):
    """Serialize an NNSG3dResDict with a Patricia tree. names: list of 16-byte keys."""
    n = len(names)
    nodes = [[127, 0, 0, 0]]  # refBit, idxLeft, idxRight, idxEntry ; node 0 is the sentinel root
    for idx, key in enumerate(names):
        if idx == 0:
            nodes.append([0, 1, 1, 0])
            nodes[0][1] = 1
            continue
        # search for the closest existing key
        p, x = 0, nodes[0][1]
        while nodes[p][0] > nodes[x][0]:
            p = x
            x = nodes[x][1 + _bit(key, nodes[x][0])]
        found = names[nodes[x][3]]
        i = _highest_diff_bit(key, found)
        # find insertion point
        p, x = 0, nodes[0][1]
        while nodes[p][0] > nodes[x][0] and nodes[x][0] > i:
            p = x
            x = nodes[x][1 + _bit(key, nodes[x][0])]
        t = len(nodes)
        node = [i, 0, 0, idx]
        if _bit(key, i):
            node[2], node[1] = t, x
        else:
            node[1], node[2] = t, x
        nodes.append(node)
        if p == 0:
            nodes[0][1] = t
        else:
            nodes[p][1 + _bit(key, nodes[p][0])] = t
    # verify every name resolves like NNS_G3dGetResDictIdxByName
    if n >= 16:
        for idx, key in enumerate(names):
            p, x = 0, nodes[0][1]
            while nodes[p][0] > nodes[x][0]:
                p = x
                x = nodes[x][1 + _bit(key, nodes[x][0])]
            assert nodes[x][3] == idx, f"dictionary lookup failed for {names[idx]!r}"
    head_size = 8 + 4 * len(nodes)
    ofs_entry = head_size
    entry_blk = struct.pack("<HH", size_unit, 4 + size_unit * n) + b"".join(entries) + b"".join(names)
    total = head_size + len(entry_blk)
    out = struct.pack("<BBHHH", 0, n, total, 0, ofs_entry)
    out += b"".join(struct.pack("<BBBB", *nd) for nd in nodes)
    out += entry_blk
    return out


def write_nsbtx(textures, palettes):
    """textures: ordered dict name16 -> (param, extra, data, fmt); palettes: ordered dict name16 -> bytes.
    Returns the bytes of a BTX0 file."""
    def pad8(b):
        return b + b"\x00" * (-len(b) % 8)
    tex_blob = b""
    tex_entries = []
    for name, (param, extra, data, fmt) in textures.items():
        addr = len(tex_blob)
        param = (param & ~0xFFFF) | (addr >> 3)
        tex_entries.append(struct.pack("<II", param, extra))
        tex_blob += pad8(data)
    pltt_blob = b""
    pltt_entries = []
    use_pltt4 = any(fmt == 2 for (_p, _e, _d, fmt) in textures.values())
    for name, data in palettes.items():
        off = len(pltt_blob)
        pltt_entries.append(struct.pack("<HH", off >> 3, 0))
        pltt_blob += pad8(data)
    tdict = build_dict(list(textures.keys()), tex_entries, 8)
    pdict = build_dict(list(palettes.keys()), pltt_entries, 4)
    ofs_tdict = 0x3C
    ofs_pdict = ofs_tdict + len(tdict)
    ofs_tex = ofs_pdict + len(pdict)
    ofs_tex += -ofs_tex % 8
    ofs_4x4 = ofs_tex + len(tex_blob)
    ofs_pltt = ofs_4x4  # no 4x4 data, no pltt index data
    size = ofs_pltt + len(pltt_blob)
    tex0 = b"TEX0" + struct.pack("<I", size)
    tex0 += struct.pack("<IHHHHI", 0, len(tex_blob) >> 3, ofs_tdict, 0, 0, ofs_tex)
    tex0 += struct.pack("<IHHHHII", 0, 0, ofs_tdict, 0, 0, ofs_4x4, ofs_4x4)
    tex0 += struct.pack("<IHHHHI", 0, len(pltt_blob) >> 3, 0x8000 if use_pltt4 else 0, ofs_pdict, 0, ofs_pltt)
    assert len(tex0) == 0x3C
    tex0 += tdict + pdict
    tex0 += b"\x00" * (ofs_tex - len(tex0))
    tex0 += tex_blob + pltt_blob
    assert len(tex0) == size
    hdr = b"BTX0" + struct.pack("<HHIHHI", 0xFEFF, 1, 0x14 + size, 0x10, 1, 0x14)
    return hdr + tex0


def merge_models(model_blobs):
    """Merge the embedded textures and palettes of several NSBMD blobs into one NSBTX."""
    textures, palettes = {}, {}
    for blob in model_blobs:
        t, p = read_tex0(blob)
        for k, v in t.items():
            textures.setdefault(k, v)
        for k, v in p.items():
            palettes.setdefault(k, v)
    return write_nsbtx(textures, palettes), len(textures), len(palettes)
