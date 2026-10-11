#!/usr/bin/env python3
"""Import Sinnoh maps from the pokediamond repo into this repo, from scratch, every run.

    python3 tools/sinnoh_port/build_sinnoh.py ../pokediamond

Reads tools/sinnoh_port/maps.txt (one Diamond MAP_ constant per line) and regenerates everything
the maps need. Prebuilt archives are restored from git (branch master) before appending, so the
result is deterministic. Generated text blocks in hand-maintained files sit between
"// SINNOH_PORT_BEGIN" / "// SINNOH_PORT_END" markers (or "# ..." in meson files).

Per map it produces:
  * land data chunks (BDHC replaced by HeartGold's flat one), a matrix, area entry, building list,
    building texture set (merged NSBTX), map texture set, building models (field or room archives)
  * zone events JSON (NPCs with sprite names mapped, warps, hidden items, coord triggers)
  * text bank JSON from the Diamond .gmm
  * scripts: translated where the command is known, a stub otherwise; the level script verbatim
  * map header entry, MAP_ constant, meson registrations
"""
import json
import os
import re
import struct
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import nsbtx  # noqa: E402

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, "..", ".."))
os.chdir(ROOT)

ARCHIVES = {
    "land": "files/a/0/6/5",
    "field_models": "files/a/0/4/0",
    "field_anim": "files/a/1/0/7",
    "room_models": "files/a/1/4/8",
    "room_anim": "files/a/1/0/8",
    "tex": "files/a/0/4/4",
    "buildlist": "files/a/0/4/3",
    "buildtex": "files/a/0/7/0",
    "area": "files/a/0/4/2",
}
MATSHP = {"field": "files/fielddata/build_model/bm_field_matshp.dat", "room": "files/fielddata/build_model/bm_room_matshp.dat"}
RESTORE = list(ARCHIVES.values()) + list(MATSHP.values())

FIRST_MAP_ID = 540          # first free HeartGold map id
FIRST_MATRIX = 288          # first free matrix index
FIRST_SCR_SEQ = 965         # first free scr_seq index
FIRST_ZONE_EVENT = 491
FIRST_MSG = 829
FIRST_SINNOH_FLAG = 2912    # NUM_FLAGS of stock HeartGold; we grow NUM_FLAGS
NUM_FLAGS_NEW = 4096
FIRST_HIDDEN_ITEM_IDX = 231  # free indices in HeartGold's hidden item table
FREE_VARS = [0x4105, 0x4109, 0x4111, 0x4112, 0x4128, 0x413C, 0x413D, 0x413E, 0x413F, 0x4140, 0x4141, 0x4152, 0x4153, 0x4154,
             0x4155, 0x4156, 0x4157, 0x4158, 0x4159, 0x415A, 0x415B, 0x415C, 0x415D, 0x415E, 0x415F, 0x4160, 0x4161, 0x4162,
             0x4163, 0x4164, 0x4165, 0x4166, 0x4167, 0x4168, 0x4169, 0x416A, 0x416B, 0x416C, 0x416D, 0x416E]
PLACEHOLDER_SPRITE = "SPRITE_GSBOY1"
PLACEHOLDER_TRAINER = 1

MUSIC = {  # Diamond sequence name -> HeartGold placeholder
    "SEQ_CITY02_D": "SEQ_GS_C_ASAGI", "SEQ_CITY02_N": "SEQ_GS_C_ASAGI",
    "SEQ_FS": "SEQ_GS_FS", "SEQ_GYM": "SEQ_GS_GYM", "SEQ_PC_01": "SEQ_GS_POKESEN", "SEQ_PC_02": "SEQ_GS_POKESEN",
    "SEQ_D_03": "SEQ_GS_C_ASAGI",
}
DEFAULT_MUSIC = "SEQ_GS_C_ASAGI"

# Hand tweaks per Diamond map. TILE_OVERRIDES: (DP land id, x, z) -> (type, collision).
# EXTRA_WARPS: list of warp dicts appended to the map's events.
TILE_OVERRIDES = {}
EXTRA_WARPS = {
    "MAP_CANALAVE": [
        {"x": 13, "z": 45, "header": "MAP_OLIVINE", "anchor": 8, "y": 0},   # arrival point from Olivine's harbor, in front of the sailor
    ],
}
# Extra dialogue lines appended to a map's text bank (ids continue after Diamond's).
EXTRA_MESSAGES = {
    "MAP_CANALAVE": [
        "Sailor: This ship sails to Olivine City\nin the Johto region.\rShall we set sail?",
        "Sailor: Come back whenever you’re ready\nto sail.",
    ],
}
# Hand-written HeartGold scripts replacing a translated one: map -> {script index (0-based): asm body}.
SCRIPT_OVERRIDES = {
    "MAP_CANALAVE": {
        19: """\tPlaySE SEQ_SE_DP_SELECT
\tLockAll
\tFacePlayer
\tNPCMsg msg_0829_C02_00041
\tYesNo VAR_SPECIAL_RESULT
\tCompare VAR_SPECIAL_RESULT, 1
\tGoToIfEq _sail_no
\tCloseMsg
\tFadeScreen 6, 1, 0, RGB_BLACK
\tWaitFade
\tPlaySE SEQ_SE_DP_SHIP01
\tWait 90, VAR_TEMP_x4000
\tPlaySE SEQ_SE_DP_SHIP02
\tWait 60, VAR_TEMP_x4000
\tWarp MAP_OLIVINE, 0, 279, 277, DIR_SOUTH
\tFadeScreen 6, 1, 1, RGB_BLACK
\tWaitFade
\tReleaseAll
\tEnd

_sail_no:
\tNPCMsg msg_0829_C02_00042
\tWaitButton
\tCloseMsg
\tReleaseAll
\tEnd""",
    },
}


# ----------------------------------------------------------------------------- helpers
def narc_read(path):
    b = open(path, "rb").read()
    assert b[:4] == b"NARC", path
    p = 0x10
    fat_size = struct.unpack_from("<I", b, p + 4)[0]
    n = struct.unpack_from("<H", b, p + 8)[0]
    fat = [struct.unpack_from("<II", b, p + 12 + 8 * i) for i in range(n)]
    p += fat_size
    fnt_size = struct.unpack_from("<I", b, p + 4)[0]
    fnt = b[p:p + fnt_size]
    p += fnt_size
    img = p + 8
    return [b[img + s:img + e] for s, e in fat], fnt


def narc_write(path, members, fnt):
    fat = bytearray()
    img = bytearray()
    for m in members:
        s = len(img)
        img += m
        e = len(img)
        fat += struct.pack("<II", s, e)
        img += b"\xff" * (-len(img) % 4)
    fatb = b"BTAF" + struct.pack("<IHH", 12 + len(fat), len(members), 0) + fat
    gmif = b"GMIF" + struct.pack("<I", 8 + len(img)) + img
    total = 16 + len(fatb) + len(fnt) + len(gmif)
    open(path, "wb").write(b"NARC" + struct.pack("<HHIHH", 0xFFFE, 0x0100, total, 16, 3) + fatb + fnt + gmif)


def replace_block(path, begin, end, body):
    s = open(path, encoding="utf-8").read()
    i, j = s.find(begin), s.find(end)
    assert i >= 0 and j > i, f"markers missing in {path}"
    s = s[:i + len(begin)] + "\n" + body + s[j:]
    open(path, "w", encoding="utf-8").write(s)


def ensure_markers(path, anchor, begin, end, before=True):
    s = open(path, encoding="utf-8").read()
    if begin in s:
        return
    assert s.count(anchor) == 1, (path, anchor)
    blk = f"{begin}\n{end}\n"
    s = s.replace(anchor, blk + anchor if before else anchor + "\n" + blk, 1)
    open(path, "w", encoding="utf-8").write(s)


class Narcs:
    """All appendable archives, loaded once, written at the end."""
    def __init__(self):
        self.data = {k: list(narc_read(p)) for k, p in ARCHIVES.items()}
        self.matshp = {k: open(p, "rb").read() for k, p in MATSHP.items()}
        self.matshp_add = {"field": 0, "room": 0}

    def append(self, key, member):
        self.data[key][0].append(member)
        return len(self.data[key][0]) - 1

    def count(self, key):
        return len(self.data[key][0])

    def member(self, key, i):
        return self.data[key][0][i]

    def save(self):
        for k, p in ARCHIVES.items():
            narc_write(p, *self.data[k])
        for k, p in MATSHP.items():
            ms = self.matshp[k]
            n, e = struct.unpack_from("<HH", ms, 0)
            add = self.matshp_add[k]
            table = ms[4:4 + 4 * n] + struct.pack("<HH", 0, 0xFFFF) * add
            open(p, "wb").write(struct.pack("<HH", n + add, e) + table + ms[4 + 4 * n:])


# ----------------------------------------------------------------------------- Diamond side
class Diamond:
    def __init__(self, repo):
        self.repo = repo
        mh = open(f"{repo}/include/constants/maps.h").read()
        self.maps = {k: int(v) for k, v in re.findall(r"#define (MAP_\w+)\s+(\d+)", mh)}
        self.codes = {k: c[4:] for k, c in re.findall(r"#define (MAP_\w+)\s+\d+\s*// (MAP_\w+)", mh)}
        self.id2map = {v: k for k, v in self.maps.items()}
        hdr = open(f"{repo}/arm9/src/map_header.c").read().splitlines()
        self.rows = [l for l in hdr if l.strip().startswith("{ NARC_area_data")]
        self.sprites = {int(v): k for k, v in re.findall(r"#define (SPRITE_\w+)\s+(\d+)", open(f"{repo}/include/constants/sprites.h").read())}
        self.models, _ = narc_read(f"{repo}/files/fielddata/build_model/build_model.narc")
        self.cmd_names = self._cmd_table()
        self.cmd_layout = self._cmd_layouts()
        self.matrix0 = self._matrix(0)

    def header(self, mid):
        l = self.rows[mid]
        banks = [int(x) for x in re.findall(r"narc_(\d+)_bin", l)]
        music = re.search(r"(SEQ_\w+), (SEQ_\w+)", l).groups()
        tail = re.search(r"MAPSEC_(\w+),\s*(.*?)\s*\}", l)
        mapsec, rest = tail.group(1), [x.strip() for x in tail.group(2).split(",")]
        return dict(area=banks[0], mm=banks[1], matrix=banks[2], scripts=banks[3], lvl=banks[4], msg=banks[5], events=banks[-1],
                    music=music, mapsec=mapsec, weather=int(rest[0]), camera=int(rest[1]), maptype=int(rest[2]), battlebg=int(rest[3]),
                    bike=rest[4] == "TRUE", escape=rest[6] == "TRUE", fly=rest[7] == "TRUE")

    def file(self, sub, idx):
        return open(f"{self.repo}/files/fielddata/{sub}/narc_{idx:04d}.bin", "rb").read()

    def _matrix(self, idx):
        b = self.file("mapmatrix/map_matrix", idx)
        w, h, hh, ha, nl = b[:5]
        name = b[5:5 + nl]
        p = 5 + nl
        hdrs = struct.unpack_from(f"<{w*h}H", b, p) if hh else None
        p += w * h * 2 if hh else 0
        alts = b[p:p + w * h] if ha else bytes(w * h)
        p += w * h if ha else 0
        land = struct.unpack_from(f"<{w*h}H", b, p)
        return dict(w=w, h=h, name=name, headers=hdrs, alts=alts, land=land)

    def map_cells(self, mid, hdr):
        """Return (cells as list of (x, y, land_id, alt)), (origin x, origin y), (w, h) for this map."""
        if hdr["matrix"] == 0:
            m = self.matrix0
            cells = [(i % m["w"], i // m["w"], m["land"][i], m["alts"][i]) for i in range(m["w"] * m["h"]) if m["headers"][i] == mid]
            xs = [c[0] for c in cells]
            ys = [c[1] for c in cells]
            x0, y0 = min(xs), min(ys)
            return [(x - x0, y - y0, l, a) for x, y, l, a in cells], (x0, y0), (max(xs) - x0 + 1, max(ys) - y0 + 1)
        m = self._matrix(hdr["matrix"])
        cells = [(i % m["w"], i // m["w"], m["land"][i], m["alts"][i]) for i in range(m["w"] * m["h"])]
        return cells, (0, 0), (m["w"], m["h"])

    def _cmd_table(self):
        tbl = open(f"{self.repo}/arm9/asm/unk_02038C78.s").read()
        m = re.search(r"gScriptCmdTable:.*?\n(.*?)(?:\n\s*\n|\Z)", tbl, re.S)
        return re.findall(r"\.word\s+(\S+)", m.group(1))

    def _cmd_layouts(self):
        import glob
        src = ""
        for f in glob.glob(f"{self.repo}/arm9/src/scrcmd*.c"):
            src += open(f, errors="replace").read()
        lay = {}
        for mm in re.finditer(r"BOOL\s+(ScrCmd_\w+)\s*\([^)]*\)[^{]*\{", src):
            i, d = mm.end(), 1
            while d and i < len(src):
                d += (src[i] == "{") - (src[i] == "}")
                i += 1
            body = src[mm.end():i]
            lay[mm.group(1)] = "".join({"ScriptReadByte": "b", "ScriptReadHalfword": "h", "ScriptReadWord": "w", "ScriptGetVar": "v",
                                        "ScriptGetVarPointer": "p"}[r.group(0)]
                                       for r in re.finditer(r"ScriptReadByte|ScriptReadHalfword|ScriptReadWord|ScriptGetVarPointer|ScriptGetVar", body))
        return lay

    def std_item(self, bank, idx1):
        """For Diamond std banks whose scripts are 'SetVar 0x8008 item; SetVar 0x8009 qty', return (item, qty)."""
        b = self.file("script/scr_seq_release", bank)
        starts, p = [], 0
        while struct.unpack_from("<H", b, p)[0] != 0xFD13:
            off = struct.unpack_from("<I", b, p)[0]
            p += 4
            starts.append(p + off)
        s = starts[idx1 - 1]
        if struct.unpack_from("<H", b, s)[0] == 0x28 and struct.unpack_from("<H", b, s + 6)[0] == 0x28:
            return struct.unpack_from("<H", b, s + 4)[0], struct.unpack_from("<H", b, s + 10)[0]
        return None


# ----------------------------------------------------------------------------- script translation
# Diamond handler name -> (HeartGold macro, argument kinds). Kinds: b byte, h halfword, v var-or-value,
# p var, w jump target, m message index (byte), M movement target (word), s std script id, f flag, F flag(var),
# o object id, t trainer id, I std-item-script id (RunScriptWait)
TRANSLATE = {
    "ScrCmd_End": ("End", ""),
    "ScrCmd_Return": ("Return", ""),
    "ScrCmd_GoTo": ("GoTo", "w"),
    "ScrCmd_Call": ("Call", "w"),
    "ScrCmd_GoToIf": ("GoToIf", "bw"),
    "ScrCmd_CallIf": ("CallIf", "bw"),
    "ScrCmd_CompareVarToValue": ("CompareVarToValue", "ph"),
    "ScrCmd_CompareVarToVar": ("CompareVarToVar", "pp"),
    "ScrCmd_SetVar": ("SetVar", "ph"),
    "ScrCmd_CopyVar": ("CopyVar", "pp"),
    "ScrCmd_AddVar": ("AddVar", "ph"),
    "ScrCmd_SubVar": ("SubVar", "ph"),
    "ScrCmd_SetFlag": ("SetFlag", "f"),
    "ScrCmd_ClearFlag": ("ClearFlag", "f"),
    "ScrCmd_CheckFlag": ("CheckFlag", "f"),
    "ScrCmd_LockAllEvents": ("LockAll", ""),
    "ScrCmd_ReleaseAllEvents": ("ReleaseAll", ""),
    "ScrCmd_FacePlayer": ("FacePlayer", ""),
    "ScrCmd_Unk002C": ("NPCMsg", "m"),
    "ScrCmd_WaitButton": ("WaitButton", ""),
    "ScrCmd_CloseMessageBox": ("CloseMsg", ""),
    "ScrCmd_CreateMessageBox": ("DirectionSignpost", "mbhp"),
    "ScrCmd_Unk0037": ("SetSignpostMap", "bh"),
    "ScrCmd_Unk0038": ("SetSignpostAction", "b"),
    "ScrCmd_Unk0039": ("WaitSignpostAction", ""),
    "ScrCmd_Unk003A": ("TrainerTips", "mp"),
    "ScrCmd_Unk003B": ("WaitSignpost", "p"),
    "ScrCmd_Unk0042": ("ScrCmd_066", "bb"),
    "ScrCmd_PlayFanfare": ("PlayFanfare", "v"),
    "ScrCmd_PlayFanfareWait": ("WaitSE", "v"),
    "ScrCmd_PlayCry": ("PlayCry", "vv"),
    "ScrCmd_Unk005E": ("ApplyMovement", "oM"),
    "ScrCmd_WaitForMovement": ("WaitMovement", ""),
    "ScrCmd_AddEvent": ("ShowPerson", "o"),
    "ScrCmd_RemoveEvent": ("HidePerson", "o"),
    "ScrCmd_HasItem": ("HasItem", "vvp"),
    "ScrCmd_HasSpaceForItem": ("HasSpaceForItem", "vvp"),
    "ScrCmd_GiveItem": ("GiveItem", "vvp"),
    "ScrCmd_GetPlayerName": ("BufferPlayersName", "b"),
    "ScrCmd_GetRivalName": ("BufferRivalsName", "b"),
    "ScrCmd_GetPlayerGender": ("GetPlayerGender", "p"),
    "ScrCmd_SetEventDefaultPosition": ("MovePerson", "ovv"),
    "ScrCmd_SetEventDefaultMovement": ("SetObjectMovementType", "ov"),
    "ScrCmd_SetEventDefaultDirection": ("SetObjectFacing", "ov"),
    "ScrCmd_RunScriptWait": ("CallStd", "s"),
    "ScrCmd_Unk00E5": ("TrainerBattle", "tt"),
    "ScrCmd_YesNoMenu": ("YesNo", "p"),
    "ScrCmd_RestartCurrentScript": ("RestartCurrentScript", ""),
    "ScrCmd_Wait": ("Wait", "hp"),
    "ScrCmd_LockEvent": ("Lock", "o"),
    "ScrCmd_UnlockEvent": ("Release", "o"),
    "ScrCmd_GetPlayerPosition": ("GetPlayerCoords", "pp"),
    "ScrCmd_GetPlayerDirection": ("GetPlayerFacing", "p"),
    "ScrCmd_GetStarter": ("GetStarterChoice", "p"),
    "ScrCmd_HasBadge": ("CheckBadge", "vp"),
    "ScrCmd_GiveBadge": ("GiveBadge", "v"),
    "ScrCmd_AddSpecialGameStat": ("AddSpecialGameStat", "v"),
    "ScrCmd_GetItemName": ("BufferItemName", "bv"),
    "ScrCmd_GetTMHMMoveName": ("BufferTMHMMoveName", "bv"),
    "ScrCmd_PlaySound": ("PlaySE", "v"),
    "ScrCmd_PlaySoundWait": ("WaitSE", "v"),
    "ScrCmd_SetWarpPosition": ("MoveWarp", "vvv"),
    "ScrCmd_SetTrainerFlag": ("SetTrainerFlag", "t"),
    "ScrCmd_ClearTrainerFlag": ("ClearTrainerFlag", "t"),
    "ScrCmd_CheckTrainerFlag": ("CheckTrainerFlag", "t"),
    "ScrCmd_Unk0040": ("MenuInit", "bbbbp"),
    "ScrCmd_PlayBgm": ("PlayBGM", "v"),
    "ScrCmd_StopBgm": ("StopBGM", "v"),
    "ScrCmd_GiveMoney": ("GiveMoney", "v"),
    "ScrCmd_TakeMoney": ("TakeMoney", "v"),
    "ScrCmd_HasMoney": ("HasMoney", "vp"),
    "ScrCmd_CheckFlagVar": ("CheckFlagVar", "F"),
    "ScrCmd_SetFlagVar": ("SetFlagVar", "F"),
    "ScrCmd_ClearFlagVar": ("ClearFlagVar", "F"),
}
DP_STD = {2000: "std_signpost", 2042: "std_play_rival_intro_music"}


class Translator:
    def __init__(self, dp, state, code, msg_prefix, nmsgs):
        self.dp, self.state, self.code, self.msg_prefix, self.nmsgs = dp, state, code, msg_prefix, nmsgs
        self.todo = []

    def flag(self, dpflag):
        return self.state.flag(dpflag)

    def var(self, dpvar):
        return self.state.var(dpvar)

    def translate(self, bank, overrides=None):
        """Translate a Diamond script bank to HeartGold assembly text. Returns (asm, nscripts)."""
        overrides = overrides or {}
        b = self.dp.file("script/scr_seq_release", bank)
        starts, p = [], 0
        while struct.unpack_from("<H", b, p)[0] != 0xFD13:
            off = struct.unpack_from("<I", b, p)[0]
            p += 4
            starts.append(p + off)
        labels = {s: f"scr_seq_{self.code}_{i:03d}" for i, s in enumerate(starts)}
        movements = {}
        lines = {}
        work = list(starts)
        seen = set()
        stubbed = set()
        for idx, st in enumerate(starts):
            if idx in overrides:
                lines[st] = overrides[idx]
                seen.add(st)
        while work:
            pc = work.pop(0)
            if pc in seen or pc >= len(b):
                continue
            while pc < len(b) and pc not in seen:
                seen.add(pc)
                cmd = struct.unpack_from("<H", b, pc)[0]
                name = self.dp.cmd_names[cmd] if cmd < len(self.dp.cmd_names) else f"cmd_{cmd:04x}"
                lay = self.dp.cmd_layout.get(name)
                tr = TRANSLATE.get(name)
                if lay is None:
                    lines[pc] = f"\t// TODO unknown Diamond command {name} (0x{cmd:03x}); script truncated here\n\tEnd"
                    stubbed.add(name)
                    break
                # read raw args
                q = pc + 2
                raw = []
                for k in lay:
                    if k == "b":
                        raw.append(b[q]); q += 1
                    elif k in "hvp":
                        raw.append(struct.unpack_from("<H", b, q)[0]); q += 2
                    elif k == "w":
                        v = struct.unpack_from("<i", b, q)[0]; q += 4
                        raw.append(q + v)
                nxt = q
                if tr is None:
                    lines[pc] = f"\t// TODO Diamond {name} 0x{cmd:03x} args {raw}: no HeartGold mapping yet"
                    stubbed.add(name)
                else:
                    macro, kinds = tr
                    if len(kinds) != len(raw):
                        lines[pc] = f"\t// TODO Diamond {name} 0x{cmd:03x} args {raw}: mapping arity mismatch"
                        stubbed.add(name)
                        pc = nxt
                        continue
                    args = []
                    for k, v in zip(kinds, raw):
                        if k == "w":
                            lbl = labels.setdefault(v, f"_{v:04X}")
                            work.append(v)
                            args.append(lbl)
                        elif k == "M":
                            lbl = f"mv_{self.code}_{v:04X}"
                            movements[v] = lbl
                            args.append(lbl)
                        elif k == "m":
                            args.append(f"{self.msg_prefix}_{v:05d}" if v < self.nmsgs else str(v))
                        elif k == "f":
                            args.append(self.flag(v))
                        elif k == "p":
                            args.append(self.var(v))
                        elif k == "v":
                            args.append(self.var(v) if v >= 0x4000 else str(v))
                        elif k == "o":
                            args.append("obj_player" if v == 0xFF else (self.var(v) if v >= 0x4000 else str(v)))
                        elif k == "s":
                            if v in DP_STD:
                                args.append(DP_STD[v])
                            else:
                                item = self.dp.std_item(205, v - 1999) if 2000 <= v < 2256 else None
                                args.append(f"{v} /* TODO Diamond std script */")
                                self.todo.append(f"std script {v}")
                        elif k == "t":
                            args.append(str(PLACEHOLDER_TRAINER) if v else "0")
                            if v:
                                self.todo.append(f"trainer {v}")
                        elif k == "F":
                            args.append(self.var(v) if v >= 0x4000 else self.flag(v))
                        else:
                            args.append(str(v))
                    if macro == "TrainerBattle":
                        args = [args[0], args[1], "0", "0"]
                    lines[pc] = f"\t{macro} {', '.join(args)}".rstrip()
                pc = nxt
                if name in ("ScrCmd_End", "ScrCmd_Return", "ScrCmd_GoTo", "ScrCmd_RestartCurrentScript"):
                    break
        # movement data: (u16 cmd, u16 count)* terminated by 0x00FE
        mv_text = []
        for off, lbl in sorted(movements.items()):
            q = off
            body = []
            while q + 4 <= len(b):
                c, n = struct.unpack_from("<HH", b, q)
                q += 4
                if c == 0xFE:
                    break
                body.append(f"\t.short {c}, {n}")
            mv_text.append(f"{lbl}:\n" + "\n".join(body) + "\n\tEndMovement\n")
        out = []
        for s in sorted(set(starts)):
            pass
        for addr in sorted(lines):
            if addr in labels:
                out.append(f"\n{labels[addr]}:")
            out.append(lines[addr])
        return "\n".join(out) + "\n\n" + "\n".join(mv_text), len(starts), stubbed


# ----------------------------------------------------------------------------- state (flags, vars, ids)
class State:
    def __init__(self):
        self.flags = {}
        self.vars = {}
        self.hidden_items = []  # (item, qty, idx)

    def flag(self, dpflag):
        if dpflag >= 0x4000:          # temp flags, same in both games
            return str(dpflag)
        if dpflag not in self.flags:
            self.flags[dpflag] = FIRST_SINNOH_FLAG + len(self.flags)
        return f"FLAG_SINNOH_{dpflag}"

    def var(self, dpvar):
        if dpvar < 0x4000:
            return str(dpvar)
        if 0x4000 <= dpvar <= 0x400F or dpvar >= 0x8000:  # temp and special vars, same in both games
            return f"0x{dpvar:04X}"
        if dpvar not in self.vars:
            assert len(self.vars) < len(FREE_VARS), "out of free HeartGold variables"
            self.vars[dpvar] = FREE_VARS[len(self.vars)]
        return f"VAR_SINNOH_{dpvar:04X}"


# ----------------------------------------------------------------------------- text
def gmm_to_json(dp, bank, bank_name):
    s = open(f"{dp.repo}/files/msgdata/msg/narc_{bank:04d}.gmm", encoding="utf-8").read()
    rows = re.findall(r'<row id="[^"]+" index="(\d+)">(.*?)</row>', s, re.S)
    msgs = []
    for idx, body in rows:
        en = re.search(r'<language name="English">(.*?)</language>', body, re.S)
        t = en.group(1) if en else ""
        t = t.replace("&amp;", "&").replace("&lt;", "<").replace("&gt;", ">").replace("&quot;", '"')
        t = re.sub(r"\{SIZE \d+\}", "", t)
        t = re.sub(r"\{STRVAR_(\d) (\d+), (\d+)\}", r"{STRVAR_\1 \2, \3, 0}", t)
        t = t.replace("\\r", "\r").replace("\\n", "\n")
        parts = re.split(r"(?<=[\n\r])", t)
        parts = [p for p in parts if p]
        msgs.append({"id": f"{bank_name}_{int(idx):05d}", "en_US": parts if len(parts) > 1 else (parts[0] if parts else "")})
    return {"key": 0x2000 + bank, "messages": msgs}, len(msgs)


# ----------------------------------------------------------------------------- main build
def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    dp = Diamond(sys.argv[1].rstrip("/"))
    manifest = [l.strip() for l in open(os.path.join(HERE, "maps.txt")) if l.strip() and not l.startswith("#")]
    subprocess.run(["git", "checkout", "master", "--"] + RESTORE, check=True)
    narcs = Narcs()
    state = State()
    hg_sprites = set(re.findall(r"#define (SPRITE_\w+)", open("include/constants/sprites.h").read()))
    flat_bdhc = narcs.member("land", 1)[len(narcs.member("land", 1)) - struct.unpack_from("<I", narcs.member("land", 1), 12)[0]:]

    # id allocation
    maps = []  # dicts
    for i, name in enumerate(manifest):
        mid = dp.maps[name]
        code = dp.codes[name]
        maps.append(dict(name=name, dpid=mid, code=code, hgid=FIRST_MAP_ID + i, hgname=f"MAP_SINNOH_{name[4:]}",
                         scr=FIRST_SCR_SEQ + 2 * i, hdr=FIRST_SCR_SEQ + 2 * i + 1, evt=FIRST_ZONE_EVENT + i, msg=FIRST_MSG + i,
                         matrix=FIRST_MATRIX + i, dphdr=dp.header(mid)))
    dp2hg = {m["dpid"]: m["hgname"] for m in maps}

    land_cache, area_cache, tex_cache = {}, {}, {}
    model_cache = {"field": {}, "room": {}}
    generated_scripts, generated_headers, generated_events, generated_msgs, generated_matrices = [], [], [], [], []
    header_entries, map_defines = [], []
    todo = []

    def import_models(ids, kind):
        key_models, key_anim = ("field_models", "field_anim") if kind == "field" else ("room_models", "room_anim")
        out = []
        for bid in ids:
            if bid not in model_cache[kind]:
                model_cache[kind][bid] = narcs.append(key_models, dp.models[bid])
                narcs.append(key_anim, b"\xff\xff" + b"\x00" * 6 + b"\xff" * 16)
                narcs.matshp_add[kind] += 1
            out.append(model_cache[kind][bid])
        return out

    for m in maps:
        h = m["dphdr"]
        outdoor = h["maptype"] in (1, 2, 3)  # Diamond map_type: 1 town/city, 2 route, 3 cave? interiors are 4/6/7/8
        kind = "field" if outdoor else "room"
        # --- area
        if h["area"] not in area_cache:
            a = dp.file("areadata/area_data", h["area"])
            dp_build, dp_tex = struct.unpack_from("<HH", a, 0)
            ab = dp.file("areadata/area_build_model/area_build", dp_build)
            dp_ids = list(struct.unpack_from(f"<{len(ab)//2}H", ab, 0))
            cells, _, _ = dp.map_cells(m["dpid"], h)
            for _, _, land_id, _ in cells:
                c = dp.file("land_data/land_data_release", land_id)
                perm, bld = struct.unpack_from("<2I", c, 0)
                for i in range(bld // 0x30):
                    bid = struct.unpack_from("<I", c, 0x10 + perm + i * 0x30)[0]
                    if bid not in dp_ids:
                        dp_ids.append(bid)
            hg_ids = import_models(dp_ids, kind)
            if dp_tex not in tex_cache:
                tex_cache[dp_tex] = narcs.append("tex", dp.file("areadata/area_map_tex/map_tex_set", dp_tex))
            list_idx = narcs.append("buildlist", struct.pack("<H", len(hg_ids)) + b"".join(struct.pack("<H", i) for i in hg_ids))
            merged, _, _ = nsbtx.merge_models([dp.models[b] for b in dp_ids])
            assert narcs.append("buildtex", merged) == list_idx
            area_cache[h["area"]] = narcs.append("area", struct.pack("<HHHBB", list_idx, tex_cache[dp_tex], 0xFFFF, 1 if outdoor else 0, 1 if outdoor else 0))
        m["hgarea"] = area_cache[h["area"]]
        # --- land data + matrix
        cells, origin, (w, hgt) = dp.map_cells(m["dpid"], h)
        m["origin"] = origin
        grid = {}
        for x, y, land_id, alt in cells:
            if land_id not in land_cache:
                c = dp.file("land_data/land_data_release", land_id)
                perm, bld, mdl, bdhc = struct.unpack_from("<4I", c, 0)
                body = bytearray(c[0x10:0x10 + perm + bld + mdl])
                for (lid, tx, tz), (tt, tc) in TILE_OVERRIDES.items():
                    if lid == land_id:
                        body[(tz * 32 + tx) * 2] = tt
                        body[(tz * 32 + tx) * 2 + 1] = tc
                for i in range(bld // 0x30):
                    off = perm + i * 0x30
                    old = struct.unpack_from("<I", body, off)[0]
                    struct.pack_into("<I", body, off, model_cache[kind][old])
                body += flat_bdhc
                land_cache[land_id] = narcs.append("land", struct.pack("<4IHH", perm, bld, mdl, len(flat_bdhc), 0x1234, 0) + bytes(body))
            grid[(x, y)] = (land_cache[land_id], alt)
        mname = m["code"].encode()[:15]
        mx = struct.pack("<BBBBB", w, hgt, 0, 1, len(mname)) + mname
        mx += bytes(grid.get((x, y), (0, 0))[1] for y in range(hgt) for x in range(w))
        mx += b"".join(struct.pack("<H", grid.get((x, y), (0xFFFF, 0))[0]) for y in range(hgt) for x in range(w))
        mpath = f"files/fielddata/mapmatrix/map_matrix/map_matrix_{m['matrix']:04d}_{m['code']}.bin"
        open(mpath, "wb").write(mx)
        generated_matrices.append(os.path.basename(mpath))
        # --- text
        bank_name = f"msg_{m['msg']:04d}_{m['code']}"
        js, nmsgs = gmm_to_json(dp, h["msg"], bank_name)
        for extra in EXTRA_MESSAGES.get(m["name"], []):
            parts = [x for x in re.split(r"(?<=[\n\r])", extra) if x]
            js["messages"].append({"id": f"{bank_name}_{nmsgs:05d}", "en_US": parts if len(parts) > 1 else parts[0]})
            nmsgs += 1
        json.dump(js, open(f"files/msgdata/msg/{bank_name}.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
        generated_msgs.append(bank_name)
        # --- scripts
        tr = Translator(dp, state, m["code"], bank_name, nmsgs)
        asm, nscripts, stubbed = tr.translate(h["scripts"], SCRIPT_OVERRIDES.get(m["name"]))
        todo += [f"{m['name']}: {t}" for t in tr.todo] + [f"{m['name']}: unmapped command {s}" for s in sorted(stubbed)]
        scr_name = f"scr_seq_{m['scr']:04d}_{m['code']}"
        hdr_name = f"scr_seq_{m['hdr']:04d}_{m['code']}_hdr"
        includes = f'#include "constants/scrcmd.h"\n#include "constants/sinnoh.h"\n#include "fielddata/script/scr_seq/event_{m["code"]}.h"\n#include "msgdata/msg/{bank_name}.h"\n#include "macros/script.inc"\n#include "macros/movement.inc"\n\n'
        defs = "".join(f"\tScrDef scr_seq_{m['code']}_{i:03d}\n" for i in range(nscripts)) + "\tScrDefEnd\n"
        open(f"files/fielddata/script/scr_seq/{scr_name}.s", "w").write(includes + defs + asm + "\n\t.balign 4, 0\n")
        # level script, same format in both games
        lb = dp.file("script/scr_seq_release", h["lvl"])
        p, entries, table = 0, [], None
        while lb[p] != 0:
            t = lb[p]
            if t == 1:
                off = struct.unpack_from("<I", lb, p + 1)[0]
                table = p + 5 + off
            else:
                entries.append((t, struct.unpack_from("<H", lb, p + 1)[0]))
            p += 5
        hdr_lines = ['#include "constants/scrcmd.h"', '#include "constants/sinnoh.h"', f'#include "fielddata/script/scr_seq/event_{m["code"]}.h"',
                     '#include "constants/init_script_types.h"', '#include "macros/script.inc"', "", ""]
        tname = {2: "InitScriptEntry_OnTransition", 3: "InitScriptEntry_OnResume", 4: "InitScriptEntry_OnLoad"}
        def script_ref(sid):
            if sid >= 2000:
                if sid in DP_STD:
                    return DP_STD[sid]
                todo.append(f"{m['name']}: level script uses Diamond std script {sid}; dropped")
                return None
            return f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1"
        for t, sid in entries:
            ref = script_ref(sid)
            if ref is not None:
                hdr_lines.append(f"\t{tname[t]} {ref}")
        if table is not None:
            hdr_lines.append(f"\tInitScriptEntry_OnFrameTable scr_seq_{m['code']}_map_scripts")
        hdr_lines.append("\tInitScriptEntryEnd\n")
        if table is not None:
            hdr_lines.append(f"scr_seq_{m['code']}_map_scripts:")
            q = table
            while struct.unpack_from("<H", lb, q)[0] != 0:
                var, val, sid = struct.unpack_from("<HHH", lb, q)
                ref = script_ref(sid)
                if ref is not None:
                    hdr_lines.append(f"\tInitScriptGoToIfEqual {state.var(var)}, {val}, {ref}")
                q += 6
            hdr_lines.append("\tInitScriptFrameTableEnd\n")
        hdr_lines.append("\tInitScriptEnd")
        open(f"files/fielddata/script/scr_seq/{hdr_name}.s", "w").write("\n".join(hdr_lines) + "\n")
        generated_scripts += [scr_name, hdr_name]
        # --- events
        eb = dp.file("eventdata/zone_event_release", h["events"])
        ox, oy = origin[0] * 32, origin[1] * 32
        p = 0
        nb = struct.unpack_from("<I", eb, p)[0]; p += 4
        bgs = []
        for i in range(nb):
            sid, typ, x, z, y, d = struct.unpack_from("<HHIIII", eb, p + i * 0x14)
            if sid >= 8000:
                r = dp.std_item(370, sid - 7999)
                idx = FIRST_HIDDEN_ITEM_IDX + len(state.hidden_items)
                state.hidden_items.append((r[0] if r else 1, r[1] if r else 1, idx, m["code"]))
                sid_s = str(8000 + idx)
            else:
                sid_s = f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1"
            bgs.append({"scriptId": sid_s, "type": typ, "x": x - ox, "z": z - oy, "y": y, "dir": d})
        p += nb * 0x14
        no = struct.unpack_from("<I", eb, p)[0]; p += 4
        objs, obj_names = [], []
        for i in range(no):
            o = struct.unpack_from("<14Hi", eb, p + i * 0x20)
            spr = dp.sprites.get(o[1])
            spr_s = spr if spr in hg_sprites else PLACEHOLDER_SPRITE
            if spr_s == PLACEHOLDER_SPRITE:
                todo.append(f"{m['name']}: sprite {o[1]} ({spr}) has no HeartGold match")
            sid = o[5]
            if sid >= 7000 and sid < 8000:
                sid_s = "std_itemball_variadic"
                todo.append(f"{m['name']}: item ball std {sid} contents unknown, variadic placeholder")
            elif 3000 <= sid < 7000:
                sid_s = str(3000 + PLACEHOLDER_TRAINER)   # HeartGold's NPC-trainer std range, placeholder trainer
                todo.append(f"{m['name']}: object {i} is Diamond trainer std {sid}; placeholder trainer")
            elif sid >= 2000:
                sid_s = "0"
                todo.append(f"{m['name']}: object {i} uses Diamond std script {sid}; no script for now")
            elif sid == 0:
                sid_s = "0"
            else:
                sid_s = f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1"
            oname = f"obj_{m['code']}_{i}"
            obj_names.append(oname)
            objs.append({"id": oname, "spriteId": spr_s, "movement": o[2], "type": o[3],
                         "eventFlag": state.flag(o[4]) if o[4] else "0", "scriptId": sid_s, "facingDirection": o[6],
                         "param0": o[7], "param1": o[8], "param2": o[9], "xRange": o[10], "yRange": o[11],
                         "x": o[12] - ox, "z": o[13] - oy, "y": o[14] if o[14] != 65536 else 0})
        p += no * 0x20
        nw = struct.unpack_from("<I", eb, p)[0]; p += 4
        warps = []
        for i in range(nw):
            x, z, hdrid, anchor, y = struct.unpack_from("<HHHHI", eb, p + i * 12)
            tgt = dp2hg.get(hdrid)
            if tgt is None:
                todo.append(f"{m['name']}: warp {i} to Diamond map {dp.id2map.get(hdrid, hdrid)} not imported; points at itself")
                tgt, anchor = m["hgname"], 0
            warps.append({"x": x - ox, "z": z - oy, "header": tgt, "anchor": anchor, "y": y})
        warps += EXTRA_WARPS.get(m["name"], [])
        p += nw * 12
        nc = struct.unpack_from("<I", eb, p)[0]; p += 4
        coords = []
        for i in range(nc):
            sid, x, z, cw, ch, y, val, var = struct.unpack_from("<8H", eb, p + i * 16)
            coords.append({"scriptId": f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1", "x": x - ox, "z": z - oy, "w": cw, "h": ch, "y": y,
                           "val": val, "var": state.var(var)})
        ev = {"header": f"fielddata/script/scr_seq/event_{m['code']}.h", "bgs": bgs, "objects": objs, "warps": warps, "coords": coords}
        evname = f"{m['evt']:03d}_{m['code']}"
        json.dump(ev, open(f"files/fielddata/eventdata/zone_event/{evname}.json", "w"), indent=2)
        generated_events.append(evname)
        evh = [f"#ifndef SCR_SEQ_{m['code']}_H_", f"#define SCR_SEQ_{m['code']}_H_", "", '#include "constants/sinnoh.h"', ""]
        evh += [f"#define _EV_scr_seq_{m['code']}_{i:03d} {i}" for i in range(nscripts)] + [""]
        evh += [f"#define {n} {i}" for i, n in enumerate(obj_names)] + ["", "#endif"]
        open(f"files/fielddata/script/scr_seq/event_{m['code']}.h", "w").write("\n".join(evh) + "\n")
        generated_headers.append(f"event_{m['code']}.h")
        # --- map header entry
        music = [MUSIC.get(h["music"][0], DEFAULT_MUSIC), MUSIC.get(h["music"][1], DEFAULT_MUSIC)]
        if outdoor:
            extra = ".cameraType = 0,\n                        .followMode = MAP_FOLLOWMODE_ALLOW,\n                        .battleBg = BATTLE_BG_CITY,\n                        .mapType = MAP_TYPE_CITY_TOWN,"
        else:
            extra = ".cameraType = 4,\n                        .followMode = MAP_FOLLOWMODE_HEIGHT_RESTRICT,\n                        .battleBg = BATTLE_BG_BUILDING_1,\n                        .mapType = MAP_TYPE_INTERIOR,"
        header_entries.append(f"""    [{m['hgname']}] = {{
                        .wildEncounterBank = ENCDATA_NA,
                        .areaDataBank = {m['hgarea']},
                        .moveModelBank = 15,
                        .worldMapX = 0,
                        .worldMapY = 0,
                        .matrixId = NARC_map_matrix_map_matrix_{m['matrix']:04d}_{m['code']}_bin,
                        .scriptsBank = {scr_name}_bin,
                        .scriptHeaderBank = {hdr_name}_bin,
                        .msgBank = {bank_name},
                        .dayMusicId = {music[0]},
                        .nightMusicId = {music[1]},
                        .eventsBank = NARC_zone_event_{evname}_bin,
                        .mapsec = MAPSEC_{h['mapsec']},
                        .areaIcon = {1 if outdoor else 9},
                        .momCallIntroParam = 6,
                        .regionNo = MAP_REGION_SINNOH,
                        .weather = 0,
                        {extra}
                        .bikeAllowed = {'TRUE' if h['bike'] else 'FALSE'},
                        .runningAllowed_Unused = TRUE,
                        .escapeRopeAllowed = {'TRUE' if h['escape'] else 'FALSE'},
                        .flyAllowed = FALSE,
                        .outgoingCalls = FALSE,
                        .incomingCalls = FALSE,
                        .radioSignal = FALSE,
                        }},""")
        map_defines.append(f"#define {m['hgname']:<49} {m['hgid']} // Diamond {m['name']} ({m['code']})")

    narcs.save()

    # --- generated constants: flags, vars, map ids, hidden items
    sin = ["#ifndef POKEHEARTGOLD_CONSTANTS_SINNOH_H", "#define POKEHEARTGOLD_CONSTANTS_SINNOH_H", "", "// Generated by tools/sinnoh_port/build_sinnoh.py. Do not edit.", ""]
    sin += [f"#define FLAG_SINNOH_{k} {v}" for k, v in sorted(state.flags.items())] + [""]
    sin += [f"#define VAR_SINNOH_{k:04X} 0x{v:04X}" for k, v in sorted(state.vars.items())] + ["", "#endif"]
    open("include/constants/sinnoh.h", "w").write("\n".join(sin) + "\n")

    ensure_markers("include/constants/maps.h", "#define MAP_ID_MAX", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/constants/maps.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "\n".join(map_defines) + "\n")
    s = open("include/constants/maps.h").read()
    s = re.sub(r"#define MAP_ID_MAX\s+\d+", f"#define MAP_ID_MAX                                        {FIRST_MAP_ID + len(maps)}", s)
    open("include/constants/maps.h", "w").write(s)

    mh = "src/data/map_headers.h"
    s = open(mh).read()
    if "// SINNOH_PORT_BEGIN" not in s:
        i = s.rstrip().rfind("};")
        s = s[:i] + "// SINNOH_PORT_BEGIN\n// SINNOH_PORT_END\n" + s[i:]
        open(mh, "w").write(s)
    replace_block(mh, "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "\n".join(header_entries) + "\n")

    # meson lists
    def meson_block(path, list_regex, items):
        s = open(path).read()
        if "# SINNOH_PORT_BEGIN" not in s:
            m_ = re.search(list_regex, s, re.S)
            assert m_, (path, list_regex)
            close = s.index("\n)", m_.start())
            s = s[:close] + "\n    # SINNOH_PORT_BEGIN\n    # SINNOH_PORT_END" + s[close:]
            open(path, "w").write(s)
        replace_block(path, "    # SINNOH_PORT_BEGIN", "    # SINNOH_PORT_END", "".join(f"    '{x}',\n" for x in items))

    meson_block("files/fielddata/mapmatrix/map_matrix/meson.build", r"map_matrix_bin = copy_gen\.process\(files\(", generated_matrices)
    meson_block("files/fielddata/eventdata/zone_event/meson.build", r"zone_event_json = files\(", [f"{e}.json" for e in generated_events])
    s = open("files/fielddata/script/scr_seq/meson.build").read()
    if "# SINNOH_PORT_HDR_BEGIN" not in s:
        i = s.index("scr_seq_event_headers = files(")
        close = s.index("\n)", i)
        s = s[:close] + "\n    # SINNOH_PORT_HDR_BEGIN\n    # SINNOH_PORT_HDR_END" + s[close:]
        i = s.index("scr_seq_asm = files(")
        close = s.index("\n)", i)
        s = s[:close] + "\n    # SINNOH_PORT_BEGIN\n    # SINNOH_PORT_END" + s[close:]
        open("files/fielddata/script/scr_seq/meson.build", "w").write(s)
    replace_block("files/fielddata/script/scr_seq/meson.build", "    # SINNOH_PORT_HDR_BEGIN", "    # SINNOH_PORT_HDR_END", "".join(f"    '{x}',\n" for x in generated_headers))
    replace_block("files/fielddata/script/scr_seq/meson.build", "    # SINNOH_PORT_BEGIN", "    # SINNOH_PORT_END", "".join(f"    '{x}.s',\n" for x in generated_scripts))
    # text banks list (plain lines, deduped)
    stock = subprocess.run(["git", "show", "master:files/msgdata/NARC_msg.txt"], capture_output=True, text=True, check=True).stdout
    lines = [l for l in stock.splitlines() if l.strip()]
    lines += [f"NARC_msg_{b}_bin" for b in generated_msgs]
    open("files/msgdata/NARC_msg.txt", "w").write("\n".join(lines) + "\n")

    # hidden items table rows and std constants
    hi = "src/data/fieldmap/hidden_items.h"
    s = open(hi).read()
    if "// SINNOH_PORT_BEGIN" not in s:
        i = s.rstrip().rfind("};")
        s = s[:i] + "    // SINNOH_PORT_BEGIN\n    // SINNOH_PORT_END\n" + s[i:]
        open(hi, "w").write(s)
    replace_block(hi, "    // SINNOH_PORT_BEGIN", "    // SINNOH_PORT_END", "".join(f"    {{ {item}, {qty}, 0, 0, {idx} }}, // Diamond {code}\n" for item, qty, idx, code in state.hidden_items))

    # NUM_FLAGS growth
    fl = open("include/constants/flags.h").read()
    fl2 = re.sub(r"#define NUM_FLAGS \d+", f"#define NUM_FLAGS {NUM_FLAGS_NEW}", fl)
    if fl2 != fl:
        open("include/constants/flags.h", "w").write(fl2)

    print(f"imported {len(maps)} maps; flags used {len(state.flags)}, vars used {len(state.vars)}/{len(FREE_VARS)}, hidden items {len(state.hidden_items)}")
    with open(os.path.join(HERE, "TODO.txt"), "w") as f:
        f.write("\n".join(sorted(set(todo))) + "\n")
    print(f"{len(set(todo))} follow-ups written to tools/sinnoh_port/TODO.txt")


if __name__ == "__main__":
    main()
