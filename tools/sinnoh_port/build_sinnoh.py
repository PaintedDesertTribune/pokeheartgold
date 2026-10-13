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
import bdhc  # noqa: E402

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
    "anims": "files/a/1/0/6",     # building animations (NSBCA/NSBTA/NSBTP); Diamond's come from files/arc/bm_anime
}
MATSHP = {"field": "files/fielddata/build_model/bm_field_matshp.dat", "room": "files/fielddata/build_model/bm_room_matshp.dat"}
ENC_JSON = "files/fielddata/encountdata/gs_enc_data.json"
TRAINER_FILES = [ENC_JSON, "files/poketool/trainer/trainers.json", "files/msgdata/msg/msg_0728.json", "files/msgdata/msg/msg_0730.json",
                 "files/poketool/trmsg/trtbl.narc", "files/poketool/trmsg/trtblofs.narc", "files/a/0/5/8",
                 "files/a/1/1/2", "files/msgdata/msg/msg_0200.json", "files/fielddata/script/scr_seq/scr_seq_0145.s",
                 "files/fielddata/script/scr_seq/scr_seq_0003.s", "files/fielddata/script/scr_seq/scr_seq_0149.s"]
DP_NEW_GAME_BANK = 377   # Diamond's new-game script: the hide flags and vars its intro expects to be set
RESTORE = list(ARCHIVES.values()) + list(MATSHP.values()) + TRAINER_FILES

FIRST_MAP_ID = 540          # first free HeartGold map id
FIRST_MATRIX = 288          # first free matrix index
FIRST_SCR_SEQ = 965         # first free scr_seq index
FIRST_ZONE_EVENT = 491
FIRST_MSG = 829
FIRST_SINNOH_FLAG = 2912    # NUM_FLAGS of stock HeartGold; we grow NUM_FLAGS
NUM_FLAGS_NEW = 8192        # save audit 2026-10-11: 0xB60-0x115F Sinnoh flags, 0x1160-0x155F Sinnoh trainers,
                            # 0x1560-0x159F Sinnoh fly points, 0x15A0-0x1FFF reserved for Hoenn
NUM_VARS_NEW = 0x380        # vars 0x4170-0x426F Sinnoh, 0x4270-0x437F reserved for Hoenn
FIRST_HIDDEN_ITEM_IDX = 231  # free indices in HeartGold's hidden item table (stock flags 800+idx stop at idx 230)
SINNOH_HIDDEN_ITEM_FLAG_BASE = 0x1060   # flags for Sinnoh hidden items (idx 231+), top 256 of the Sinnoh flag block
FREE_VARS = list(range(0x4170, 0x4270))   # Sinnoh variables (save audit); the 40 unused stock vars stay free
PLACEHOLDER_SPRITE = "SPRITE_GSBOY1"
PLACEHOLDER_TRAINER = 1

# Diamond overworld graphics. Overlay 5 maps a sprite id to an mmodel member (ov05_021FA0AC) and to a flags word
# (ov05_021F9A9C, low nibble 1 = billboard NSBTX). Town signs (ids 91-96) are not sprites: Diamond draws them as
# small 3D props from data/mmodel/fldeff. We place those as buildings and turn the object event into a signpost
# BG event, which is how HeartGold does its own town signs.
DP_SPRITE_TABLES = "arm9/overlays/05/asm/ov05_021F0514.s"
# Diamond prop "sprite" -> (fldeff member, BG event type). 91-96 are the town sign boards, 183 the trainer-school book,
# 209 the Pokémon League door (Platinum's ov5 table; Diamond's fldeff members match).
# Diamond building models that engine code places at runtime (not in any land data), per map: imported into that
# map's area so the gymmick code can MapPropManager_LoadOne them; HeartGold ids land in include/constants/sinnoh.h
EXTRA_AREA_MODELS = {"MAP_CANALAVE_GYM": {"SINNOH_BM_CANALAVE_LIFT_Z": 0x126, "SINNOH_BM_CANALAVE_LIFT_X": 0x127,
                                          "SINNOH_BM_CANALAVE_LIFT_V": 0x128, "SINNOH_BM_CANALAVE_LIFT_TALL": 0x129,
                                          "SINNOH_BM_CANALAVE_FLOOR_1": 0x12C, "SINNOH_BM_CANALAVE_FLOOR_2": 0x12D,
                                          "SINNOH_BM_CANALAVE_FLOOR_3": 0x12E},
                     "MAP_VEILSTONE_GYM": {"SINNOH_BM_VEILSTONE_BAG_0": 0x11F, "SINNOH_BM_VEILSTONE_BAG_1": 0x120, "SINNOH_BM_VEILSTONE_BAG_2": 0x121,
                                           "SINNOH_BM_VEILSTONE_BAG_3": 0x122, "SINNOH_BM_VEILSTONE_BAG_4": 0x123, "SINNOH_BM_VEILSTONE_BAG_5": 0x124,
                                           "SINNOH_BM_VEILSTONE_BAG_6": 0x125},
                     "MAP_SUNYSHORE_GYM_ROOM_1": {f"SINNOH_BM_SUNYSHORE_GEAR_{i}": 0x1CA + i for i in range(7)},
                     "MAP_PASTORIA_GYM": {"SINNOH_BM_PASTORIA_WATER": 0xF2},
                     "MAP_HEARTHOME_GYM_FIRST_QUESTION_ROOM": {"SINNOH_BM_HEARTHOME_LIFT": 0x102},
                     "MAP_CANALAVE": {"SINNOH_BM_CANALAVE_SHIP": 0x22, "SINNOH_BM_CANALAVE_BRIDGE_A": 0x1F, "SINNOH_BM_CANALAVE_BRIDGE_B": 0x20},   # ship and drawbridge halves
                     "MAP_IRON_ISLAND_EXTERIOR": {"SINNOH_BM_ISLAND_SHIP": 0x1C1}}  # the islands' boat (same model in all three areas)
# Diamond weather ids -> HeartGold's (include/constants/weather.h in each tree); fog/Defog maps use HeartGold's mist (0)
WEATHER_MAP = {0: 0, 1: 0, 2: 1, 3: 2, 4: 3, 5: 5, 6: 5, 7: 6, 8: 0, 9: 7, 10: 7, 11: 8, 14: 0, 16: 11, 17: 3}
PASTORIA_BUTTON_MODELS = {0xEF: 2, 0xF0: 1, 0xF1: 0}   # Diamond button building model -> water level it sets
SIGN_MODELS = {91: (69, 1), 92: (70, 1), 93: (71, 1), 94: (72, 1), 95: (73, 1), 96: (74, 1), 183: (79, 0), 209: (110, 0)}
BERRY_PLOT_SPRITE = 100   # Diamond berry patches: an invisible object whose graphic is drawn by the berry system
FIRST_SINNOH_SPRITE = 1100   # HeartGold sprite ids above the follower-mon range
FIRST_SINNOH_MMODEL = 863    # the stock mmodel archive has members 0..862
MMODEL_DIR = "files/data/mmodel/mmodel"

# Trainers. Diamond trainers are appended to HeartGold's trainers.json; their dialogue goes to msg_0728 plus the
# prebuilt trtbl/trtblofs lookup tables; classes HeartGold lacks (Byron, Barry) are added with Diamond's battle
# picture. Indices 738-740 stay empty because std_trainer(740) is HeartGold's trainer-approach script id.
FIRST_SINNOH_TRAINER = 741
FIRST_SINNOH_TRCLASS = 129          # HeartGold's classes end at 128 (DAWN_PT)
TRCLASS_TEMPLATE = 14               # BLACK_BELT: its intro-animation cell data is reused with blank tiles
DP_TRCLASS_NAME_BANK = 560
PRIZE_DEFAULT = 8

MUSIC = {  # Diamond sequence name -> HeartGold placeholder
    "SEQ_CITY02_D": "SEQ_GS_C_ASAGI", "SEQ_CITY02_N": "SEQ_GS_C_ASAGI",
    "SEQ_FS": "SEQ_GS_FS", "SEQ_GYM": "SEQ_GS_GYM", "SEQ_PC_01": "SEQ_GS_POKESEN", "SEQ_PC_02": "SEQ_GS_POKESEN",
    "SEQ_D_03": "SEQ_GS_C_ASAGI",
    "SEQ_CITY01_D": "SEQ_GS_C_KOGANE", "SEQ_CITY01_N": "SEQ_GS_C_KOGANE",       # Jubilife -> Goldenrod for now
    "SEQ_ROAD_B_D": "SEQ_GS_R_1_30", "SEQ_ROAD_B_N": "SEQ_GS_R_1_30",           # Route 218 -> Route 30 for now
    "SEQ_BLD_TV": "SEQ_GS_C_KOGANE", "SEQ_BLD_BLD_GTC": "SEQ_GS_C_KOGANE",
}
# Diamond's Sinnoh overworld is one 30x30 matrix (matrix 0) with a map header per cell; HeartGold's Johto/Kanto works
# the same way, so every imported outdoor map goes into one shared "SINNOH" matrix with absolute coordinates. The
# header/zone switch when walking across a cell boundary is HeartGold's own (FieldMap_ChangeZone).
SHARED_MATRIX_NAME = "SINNOH"
# The Pokégear/Town Map page for Sinnoh is Diamond's 32x22-tile Town Map picture (tools/sinnoh_port/pokegear_map.py);
# matrix cells (30x30) project onto it linearly, which lands every town where Diamond drew it.
MAP_PROJ_X = (32, 30)
MAP_PROJ_Y = (22, 30)
DEFAULT_MUSIC = "SEQ_GS_C_ASAGI"
SE_RENAMES = {   # Diamond jingles (BGM-range ids played with PlaySE/PlayFanfare) -> HeartGold's
    "SEQ_FANFA1": "SEQ_ME_LVUP", "SEQ_FANFA2": "SEQ_ME_POKEGET", "SEQ_FANFA3": "SEQ_ME_HYOUKA2", "SEQ_FANFA4": "SEQ_ME_ITEM",
    "SEQ_FANFA5": "SEQ_ME_KEYITEM", "SEQ_FANFA6": "SEQ_ME_ITEM", "SEQ_BADGE": "SEQ_ME_BADGE", "SEQ_WAZA": "SEQ_ME_WAZA",
    "SEQ_ASA": "SEQ_ME_ASA", "SEQ_WASURE": "SEQ_ME_WASURE", "SEQ_GONIN": "SEQ_ME_HYOUKA2", "SEQ_TV_END": "SEQ_GS_RADIO_JINGLE",
    "SEQ_KINOMI": "SEQ_ME_ITEM", "SEQ_KOUKAN": "SEQ_GS_KOUKAN", "SEQ_REPORT": "SEQ_ME_ITEM", "SEQ_PRESENT": "SEQ_ME_ITEM",
    "SEQ_POCKETCH": "SEQ_ME_POKEGEAR_REGIST", "SEQ_ACCE": "SEQ_ME_ACCE",
}
HG_SE_IDS = set(re.findall(r"#define (SEQ_SE_\w+)", open("include/constants/sndseq.h").read()))   # names HeartGold knows
BGM_EVENT = {   # Diamond event/encounter themes played from scripts -> HeartGold stand-ins
    "SEQ_TSURETEKE": "SEQ_GS_E_RIVAL1", "SEQ_THE_BOY": "SEQ_GS_E_SUPPORT_M", "SEQ_THE_GIRL": "SEQ_GS_E_SUPPORT_F",
    "SEQ_THE_EVENT01": "SEQ_GS_E_TSURETEKE1", "SEQ_THE_EVENT02": "SEQ_GS_E_TSURETEKE2", "SEQ_THE_EVENT03": "SEQ_GS_E_TSURETEKE1",
    "SEQ_OPENING2": "SEQ_GS_E_TSURETEKE2", "SEQ_D_RYAYHY": "SEQ_GS_E_LUGIA",
}
# Standard scripts HeartGold lacks, appended to its misc std bank (scr_seq_0003); ids are 2000 + stock count + position
SINNOH_STD = [
    ("std_sinnoh_partner_theme",   # Diamond 2040: the partner's theme by player gender (Dawn/Lucas -> Lyra/Ethan)
     "\tStopBGM 0\n\tGetPlayerGender VAR_SPECIAL_RESULT\n\tCompare VAR_SPECIAL_RESULT, 0\n\tGoToIfEq _sinnoh_partner_f\n"
     "\tPlayBGM SEQ_GS_E_SUPPORT_M\n\tRestartCurrentScript\n\tEnd\n\n_sinnoh_partner_f:\n\tPlayBGM SEQ_GS_E_SUPPORT_F\n\tRestartCurrentScript\n\tEnd\n"),
    ("std_sinnoh_rival_theme",     # Diamond 2048: Barry's theme
     "\tStopBGM 0\n\tPlayBGM SEQ_GS_E_RIVAL1\n\tRestartCurrentScript\n\tEnd\n"),
    ("std_sinnoh_default_bgm",     # Diamond 2041/2043/2049: fade out and return to the map's music
     "\tFadeOutBGM 0, 30\n\tResetBGM\n\tRestartCurrentScript\n\tEnd\n"),
]
MAPSEC_RENAMES = {"VICTORY_ROAD": "VICTORY_ROAD_S"}   # HeartGold keeps Sinnoh's location names for met-location data, this one suffixed

# Hand tweaks per Diamond map. TILE_OVERRIDES: (DP land id, x, z) -> (type, collision).
# EXTRA_WARPS: list of warp dicts appended to the map's events.
TILE_OVERRIDES = {}
EXTRA_WARPS = {
    "MAP_CANALAVE": [
        {"x": 45, "z": 749, "header": "MAP_OLIVINE", "anchor": 8, "y": 0},   # arrival point from Olivine's harbor, in front of the sailor (Sinnoh matrix coords)
    ],
}
# Extra dialogue lines appended to a map's text bank (ids continue after Diamond's).
EXTRA_MESSAGES = {
    "MAP_CANALAVE": ["OLIVINE CITY"],   # msg_0829_SC02_00041: the harbor menu's added destination (SCRIPT_PATCHES)
}
# Hand-written HeartGold scripts replacing a translated one: map -> {script index (0-based): asm body}.
SCRIPT_OVERRIDES = {}
# Text patches applied to a map's translated script bank after translation: map -> [(regex, replacement, count)].
# Canalave's sailor keeps Diamond's menu (Iron Island, Fullmoon Island, Newmoon Island) and gains Olivine City.
OLIVINE_SAIL = ("_sail_olivine:\n\tCall _07F3\n\tCompareVarToValue 0x8004, 1\n\tCallIf 1, _0812\n\tCompareVarToValue 0x8004, 3\n\tCallIf 1, _082C\n"
                "\tCompareVarToValue 0x8004, 0\n\tCallIf 1, _0846\n\tSinnohShipCutscene 3, DIR_SOUTH, MAP_OLIVINE, 279, 277\n\tReleaseAll\n\tEnd\n\n")
SCRIPT_PATCHES = {
    "MAP_CANALAVE": [
        (r"\tMenuItemAdd (\S+), (\d+), 4\n", lambda m: f"\tMenuItemAdd msg_0829_SC02_00041, {m.group(2)}, 5\n\tMenuItemAdd {m.group(1)}, {int(m.group(2)) + 1}, 4\n", 1),
        (r"(\tCompareVarToValue 0x800C, 3\n\tGoToIf 1, _07E8\n)", lambda m: m.group(1) + "\tCompareVarToValue 0x800C, 5\n\tGoToIf 1, _sail_olivine\n", 1),
        (r"(?=_07E8:\n)", lambda m: OLIVINE_SAIL, 1),
    ],
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
# Diamond command argument layouts the source scan gets wrong (it counts a "ScriptGetVarPointer" in a comment).
LAYOUT_OVERRIDES = {"ScrCmd_GetPartyMonSpecies": "hh", "ScrCmd_Unk0250": "", "ScrCmd_Unk0238": "hh"}   # Unk0250: new-game save-field init, no args; Unk0238: (var in, var out)
HG_NPC_TRADE_COUNT = 13          # NPC_TRADE_MAX in stock HeartGold; Diamond's trades are appended
DP_TRADE_NAME_BANK = 326
DP_PARTNER_BARRY = 837      # TRAINER_PKMN_TRAINER_BARRY_CEDRIC_19: Barry's team for the Spear Pillar tag battle
DP_MENU_TEXT_BANK = 321     # list-window labels (PART 1, EXIT, ...): Diamond's menu code loads this bank itself
_shared_msg_cache = {}         # Diamond msg bank: 4 nicknames then 4 OT names


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
        self.sprite_flags, self.sprite_model = self._sprite_tables()
        self.trainers = {int(v): k for k, v in re.findall(r"#define (TRAINER_\w+)\s+(\d+)", open(f"{repo}/include/constants/trainers.h").read())}
        self.trclasses = {k: int(v) for k, v in re.findall(r"#define (TRAINER_CLASS_\w+)\s+(\d+)", open(f"{repo}/include/constants/trainer_classes.h").read())}
        self.trclass_gender = {k: int(v) for k, v in re.findall(r"/\*(TRAINER_CLASS_\w+)\*/ (\d+)", open(f"{repo}/arm9/src/trainer_data.c").read())}
        self.trdata = json.load(open(f"{repo}/files/poketool/trainer/trdata.json"))["trdata"]
        tt, _ = narc_read(f"{repo}/files/poketool/trmsg/trtbl.narc")
        self.trmsg_rows = [struct.unpack_from("<HH", tt[0], i) for i in range(0, len(tt[0]), 4)]
        self.trgra, _ = narc_read(f"{repo}/files/poketool/trgra/trfgra.narc")
        self.cmd_names = self._cmd_table()
        self.cmd_layout = self._cmd_layouts()
        self.cmd_layout.update(LAYOUT_OVERRIDES)   # where the source-scanning heuristic miscounts
        self.matrix0 = self._matrix(0)
        self.claims = {}   # shared-matrix filler cells (header MAP_EVERYWHERE) claimed by an imported neighbour map

    def header(self, mid):
        l = self.rows[mid]
        banks = [int(x) for x in re.findall(r"narc_(\d+)_bin", l)]
        music = re.search(r"(SEQ_\w+), (SEQ_\w+)", l).groups()
        tail = re.search(r"MAPSEC_(\w+),\s*(.*?)\s*\}", l)
        mapsec, rest = tail.group(1), [x.strip() for x in tail.group(2).split(",")]
        return dict(area=banks[0], mm=banks[1], matrix=banks[2], scripts=banks[3], lvl=banks[4], msg=banks[5], events=banks[-1], enc=(int(em.group(1)) if (em := re.search(r"d_enc_data_narc_(\d+)_bin", l)) else None),
                    music=music, mapsec=mapsec, weather=int(rest[0]), camera=int(rest[1]), maptype=int(rest[2]), battlebg=int(rest[3]),
                    bike=rest[4] == "TRUE", escape=rest[6] == "TRUE", fly=rest[7] == "TRUE")

    def file(self, sub, idx):
        return open(f"{self.repo}/files/fielddata/{sub}/narc_{idx:04d}.bin", "rb").read()

    def seq_name(self, seqno):
        """Name of a Diamond sound sequence id (include/constants/sndseq.h: SNDARC_BGM_BASE 1000, SNDARC_SE_BASE 1500)."""
        if not hasattr(self, "_seqs"):
            src = open(f"{self.repo}/include/constants/sndseq.h").read()
            bases = {k: int(v) for k, v in re.findall(r"#define (SNDARC_\w+_BASE)\s+(\d+)", src)}
            self._seqs = {bases[b] + int(n): name for name, b, n in re.findall(r"#define (SEQ_\w+)\s+\((SNDARC_\w+_BASE) \+ (\d+)\)", src)}
        return self._seqs.get(seqno)

    def build_anim_entry(self, bid):
        """Diamond's bm_anime_list entry for build model bid (20 bytes: has, flags, 0, 0, four s32 bm_anime ids) or None."""
        if not hasattr(self, "_anim_list"):
            self._anim_list = narc_read(f"{self.repo}/files/arc/bm_anime_list.narc")[0]
            self._anims = narc_read(f"{self.repo}/files/arc/bm_anime.narc")[0]
        return self._anim_list[bid] if bid < len(self._anim_list) else None

    def hidden_item(self, idx):
        """Diamond's hidden-item table (UNK_020F2DB4, 229 rows of {u16 item, u8 qty, u8 dowsing, u16 0, u16 index});
        std script 8000+idx looks its row up by index. Returns (item, qty, dowsing) or None."""
        if not hasattr(self, "_hidden"):
            rom = open(f"{self.repo}/build/diamond.us/pokediamond.us.nds", "rb").read()
            a9off, a9ram = struct.unpack_from("<I", rom, 0x20)[0], struct.unpack_from("<I", rom, 0x28)[0]
            off = a9off + (0x020F2DB4 - a9ram)
            self._hidden = {}
            for i in range(0xE5):
                item, qty, dows, _, index = struct.unpack_from("<HBBHH", rom, off + i * 8)
                self._hidden[index] = (item, qty, dows)
        return self._hidden.get(idx)

    def _sprite_tables(self):
        asm = open(f"{self.repo}/{DP_SPRITE_TABLES}").read()

        def table(label):
            m = re.search(r"^" + label + r":.*?\n(.*?)\n\s*\n", asm, re.S | re.M)
            bs = bytes(int(x, 16) for x in re.findall(r"0x([0-9A-Fa-f]{2})", m.group(1)))
            rows = {}
            for i in range(0, len(bs), 8):
                a, b_ = struct.unpack_from("<II", bs, i)
                if a == 0xFFFF:
                    break
                rows[a] = b_
            return rows
        return table("ov05_021F9A9C"), table("ov05_021FA0AC")

    def mmodel(self, idx):
        import glob
        return open(glob.glob(f"{self.repo}/files/data/mmodel/mmodel/narc_{idx:04d}.*")[0], "rb").read()

    def fldeff(self, idx):
        import glob
        return open(glob.glob(f"{self.repo}/files/data/mmodel/fldeff/narc_{idx:04d}.*")[0], "rb").read()

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
            cells = [(i % m["w"], i // m["w"], m["land"][i], m["alts"][i]) for i in range(m["w"] * m["h"])
                     if m["headers"][i] == mid or self.claims.get((i % m["w"], i // m["w"])) == mid]
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
        src = re.sub(r"//[^\n]*", "", re.sub(r"/\*.*?\*/", "", src, flags=re.S))   # a comment once added a phantom argument
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
        if not (0 < idx1 <= len(starts)):
            return None
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
    "ScrCmd_PlayFanfare": ("PlayFanfare", "E"),
    "ScrCmd_PlayFanfareWait": ("WaitSE", "E"),
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
    "ScrCmd_Unk00EC": ("CheckBattleWon", "p"),
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
    "ScrCmd_PlaySound": ("PlaySE", "E"),
    "ScrCmd_PlaySoundWait": ("WaitSE", "v"),
    "ScrCmd_SetWarpPosition": ("MoveWarp", "vvv"),
    "ScrCmd_SetTrainerFlag": ("SetTrainerFlag", "t"),
    "ScrCmd_FadeScreen": ("FadeScreen", "hhhh"),
    "ScrCmd_WaitFadeScreen": ("WaitFade", ""),
    "ScrCmd_Warp": ("Warp", "Ghvvh"),
    "ScrCmd_ShowMoneyBox": ("ShowMoneyBox", "vv"), "ScrCmd_HideMoneyBox": ("HideMoneyBox", ""), "ScrCmd_UpdateMoneyBox": ("UpdateMoneyBox", ""),
    "ScrCmd_HasEnoughMoneyImmediate": ("HasEnoughMoneyImmediate", "pW"), "ScrCmd_TakeMoneyImmediate": ("SubMoneyImmediate", "W"),
    "ScrCmd_GetPokemonNickname": ("BufferPartyMonNick", "bv"), "ScrCmd_CheckPartyForSpecies": ("PlayerHasSpecies", "pv"),
    "ScrCmd_GetLeadingPartyMonSlot": ("GetPartyLead", "p"), "ScrCmd_WaitButtonAB": ("WaitButton", ""),
    "ScrCmd_GiveMon": ("GiveMon", "vvv00p"), "ScrCmd_WildBattle": ("WildBattle", "vv"),
    "ScrCmd_LegendaryBattle": ("WildBattle", "vv"),   # Diamond's no-flee variant; HeartGold's plain wild battle for now
    "ScrCmd_GetPokemonName": ("BufferSpeciesName", "bv00"), "ScrCmd_ReleaseEvent": ("Release", "o"),
    "ScrCmd_GetPartyMonFriendship": ("MonGetFriendship", "pv"), "ScrCmd_PartyMonHasRibbon": ("MonHasRibbon", "pvv"),
    "ScrCmd_NPCTradeInit": ("LoadNPCTrade", "b"), "ScrCmd_NPCTradeGetOfferedSpecies": ("GetOfferedSpecies", "p"),
    "ScrCmd_NPCTradeGetRequestedSpecies": ("NPCTradeGetReqSpecies", "p"), "ScrCmd_NPCTradeExecute": ("NPCTradeExec", "v"),
    "ScrCmd_NPCTradeEnd": ("NPCTradeEnd", ""),
    "ScrCmd_GivePartyMonRibbon": ("GiveRibbon", "vv"), "ScrCmd_Unk00D5": ("BufferInt", "bv"),
    "ScrCmd_SetEventMovement": ("SetObjectMovementType", "oh"), "ScrCmd_RideBike": ("PlayerOnBikeSet", "b"),
    "ScrCmd_ShipAnimation": ("SinnohShipCutscene", "bbGhh"),   # src/sinnoh_ship_cutscene.c
    "ScrCmd_RestoreOverworld": ("RestoreOverworld", ""),
    "ScrCmd_TakeItem": ("TakeItem", "vvp"),
    "ScrCmd_GetFriendName": ("BufferFriendsName", "b"),
    "ScrCmd_NationalDex": ("NatDexFlagAction", "bp"),
    "ScrCmd_CheckGameCompleted": ("CheckGameClearFlag", "p"),
    "ScrCmd_Unk0035": ("CloseMsg", ""),
    "ScrCmd_Unk00EB": ("WhiteOut", ""),
    "ScrCmd_GetPartyMonSpecies": ("GetPartyMonSpecies", "vp"),   # the layout scanner once counted a comment as a third arg
    "ScrCmd_CountPartyMons": ("GetPartyCount", "p"),
    "ScrCmd_CountPartyMons_OmitEggs": ("PartyCountNotEgg", "p"),
    "ScrCmd_GetTotalEarnedBadges": ("CountBadges", "p"),
    "ScrCmd_HideEvent": ("HidePerson", "v"),
    "ScrCmd_ShowEvent": ("ShowPerson", "v"),
    "ScrCmd_Random": ("Random", "pv"),
    "ScrCmd_SetDynamicWarp": ("SetDynamicWarp", "vvvvv"),
    "ScrCmd_GetDynamicWarpFloorNumber": ("GetDynamicWarpFloorNo", "p"),
    "ScrCmd_ElevatorAnimation": ("ElevatorAnim", "vv"),
    "ScrCmd_PlayCryWait": ("WaitCry", ""),
    "ScrCmd_HealParty": ("HealParty", ""),
    "ScrCmd_GetSelectedPartySlot": ("GetPartySelection", "p"),
    "ScrCmd_ChoosePokemonMenu": ("PartySelectUI", ""),
    "ScrCmd_NormalMart": ("MartBuy", "v"),            # mart ids index HeartGold's tables; wrong stock until remapped
    "ScrCmd_SpecialMart": ("SpecialMartBuy", "v"),
    "ScrCmd_SetBgEventPosition": ("MoveBGEvent", "vvv"),
    "ScrCmd_ClearTrainerFlag": ("ClearTrainerFlag", "t"),
    "ScrCmd_CheckTrainerFlag": ("CheckTrainerFlag", "t"),
    "ScrCmd_Unk0040": ("MenuInit", "bbbbp"),
    "ScrCmd_Unk0043": ("MenuExec", ""),           # Diamond's scrolling list window: same menu object as HeartGold's MenuInit/MenuItemAdd/MenuExec

    "ScrCmd_InitCanalaveGym": ("SinnohCanalaveGymInit", ""),   # src/field/gymmick/sinnoh_canalave.c
    "ScrCmd_InitVeilstoneGym": ("SinnohVeilstoneGymInit", ""),   # src/field/gymmick/sinnoh_veilstone.c
    "ScrCmd_InitSunyshoreGym": ("SinnohSunyshoreGymInit", "b"),   # src/field/gymmick/sinnoh_sunyshore.c
    "ScrCmd_InitPastoriaGym": ("SinnohPastoriaGymInit", ""),     # src/field/gymmick/sinnoh_pastoria.c
    "ScrCmd_InitHearthomeGym": ("SinnohHearthomeGymInit", ""),   # src/field/gymmick/sinnoh_hearthome.c
    "ScrCmd_MoveHearthomeGymElevator": ("SinnohHearthomeGymElevator", ""),
    "ScrCmd_CheckPastoriaGymButton": ("SinnohPastoriaGymButton", ""),
    "ScrCmd_RotateSunyshoreGymGear": ("SinnohSunyshoreGymRotate", "b"),
    "ScrCmd_NamePokemonScreen": ("NicknameInput", "vp"),
    "ScrCmd_GiveEgg": ("GiveEgg", "vv"),
    "ScrCmd_SpearPillarSequence": ("SinnohSpearPillarSequence", "bp"),   # src/sinnoh_spear_pillar.c stand-in
    "ScrCmd_SetEventPosition": ("MovePersonFacing", "ovvvv"),   # (object, x, z, height, facing) in both games
    "ScrCmd_PartyMonHasMove": ("MonHasMove", "pvv"),
    "ScrCmd_SealsMart": ("SealMart", "v"),                  # HeartGold's seal shop lists, same index range
    "ScrCmd_Unk02A0": ("MultiBattle", "ttt0"),              # (partner, opponent 1, opponent 2): Spear Pillar tag battle with Barry
    "ScrCmd_Unk00ED": ("CheckBattleWon", "p"), "ScrCmd_Unk02BC": ("CheckBattleWon", "p"),
    "ScrCmd_Unk00EE": ("PartyCheckForDouble", "p"),
    "ScrCmd_Unk002D": ("NPCMsg", "m"),                      # message window variant
    "ScrCmd_GetRivalStarterName": ("BufferDPPtRivalStarterSpeciesName", "b"),
    "ScrCmd_GetGameVersion": ("GetGameVersion", "p"),       # HeartGold's version id: Diamond/Pearl branches take the "other version" path
    "ScrCmd_SetEventDirection": ("SetObjectFacing", "ov"),
    "ScrCmd_MessageUnown": ("NPCMsg", "m"),                 # Solaceon Ruins Unown text shown in the normal font
    "ScrCmd_PlayBgm": ("PlayBGM", "B"),
    "ScrCmd_Unk0057": ("PlayBGM", "B"),          # Diamond's second play-BGM (used by its std 2040/2048 theme scripts)
    "ScrCmd_FadeOutBgm": ("FadeOutBGM", "vv"),   # (target volume, frames) in both games
    "ScrCmd_FadeInBgm": ("FadeInBGM", "v"),
    "ScrCmd_PlayDefaultBgm": ("ResetBGM", ""),
    "ScrCmd_StopBgm": ("StopBGM", "v"),
    "ScrCmd_GiveMoney": ("GiveMoney", "v"),
    "ScrCmd_TakeMoney": ("TakeMoney", "v"),
    "ScrCmd_HasMoney": ("HasMoney", "vp"),
    "ScrCmd_CheckFlagVar": ("CheckFlagVar", "F"),
    "ScrCmd_SetFlagVar": ("SetFlagVar", "F"),
    "ScrCmd_ClearFlagVar": ("ClearFlagVar", "F"),
}
DP_STD = {2000: "std_signpost", 2019: "std_mart_intro",   # 2019 = "Welcome! What do you need?"
          9950: "std_in_person_evaluate_dex", 9952: "std_in_person_evaluate_dex",   # Rowan and Oak evaluate the Pokédex in person
          9500: "std_daycare_man", 9501: "std_daycare_lady",   # Solaceon Day Care: HeartGold's own Day Care scripts
          2040: "std_sinnoh_partner_theme", 2048: "std_sinnoh_rival_theme", 2041: "std_sinnoh_default_bgm", 2043: "std_sinnoh_default_bgm", 2049: "std_sinnoh_default_bgm", 2002: "std_nurse_joy", 2042: "std_play_rival_intro_music", 2044: "std_obtain_item_verbose",
          # Diamond's field-move objects (bank 375 holds its 10000-10015 field-move prompts): HeartGold has the same three
          10000: "std_field_cut", 10001: "std_field_rock_smash", 10002: "std_field_strength",
          # Pokémon Center 2F counter, left to right in Diamond (x 3, 7, 12) matched to HeartGold's counter row (x 2, 6, 11)
          9011: "std_trainer_card_explain", 9003: "std_union_room", 9001: "std_wireless_colosseum",
          10201: "std_mystery_gift_deliveryman",   # same deliveryman sprite in both games
          # Diamond's bank-205 helpers called from scripts: 2016 = give an item with the fanfare and bag check,
          # 2017 = "bag is full" message (identified by disassembly; the same 0x8004/0x8005 item/quantity convention)
          2016: "std_give_item_verbose", 2017: "std_bag_is_full"}
# Diamond std calls that do nothing worth keeping: 2037 is an empty script, 2009 hands out a Pokétch coupon (decision 16).
# Diamond level-script std calls dropped on purpose (HeartGold handles the job itself or the feature is dropped)
DP_LEVEL_STD_DROPPED = {9000: "Pokémon Center 2F partner walk (HeartGold's Center does its own)", 9012: "Pokémon Center 2F partner walk",
                        9013: "Pokémon Center 2F partner walk", 9014: "Pokémon Center 2F partner walk", 9015: "Pokémon Center 2F partner walk",
                        10200: "Poké Mart Pokétch-app check (Pokétch dropped, decision 16)",
                        8800: "Great Marsh entrance (Diamond's Safari-style game is not ported; the marsh is plain terrain)"}
DP_STD_NOOP = {2037: "Diamond std 2037 is empty", 2009: "Pokétch coupon (Pokétch dropped, decision 16)",
               2006: "GTS save prompt (Global Terminal dropped)", 2014: "Underground sphere gift (Underground not in HeartGold)",
               2046: "Secret base decoration gift (Underground not in HeartGold)", 2047: "Contest accessory gift (dress-up dropped, decision 16)",
               9016: "GTS counter line (Global Terminal dropped)",
               2012: "Underground decoration gift (Underground not in HeartGold)", 2013: "Underground trap gift (Underground not in HeartGold)",
               2015: "Contest accessory gift (dress-up dropped, decision 16)", 2036: "Contest accessory gift (dress-up dropped, decision 16)",
               2045: "Contest backdrop gift (dress-up dropped, decision 16)"}
# Diamond std scripts whose objects can stay mute without a note: 2027 is the cave vent hole's one-line message.
DP_STD_SILENT = {2027, 2037, 2025, 2035, 8803, 8804, 8805, 8806, 8807, 8808}   # 2025 GTS Geonet globe, 2035 Underground stairs guard   # 8803+: Great Marsh observatory binoculars (not ported)   # 2037 is an empty script (used on scenery objects)

# Diamond commands with no HeartGold counterpart worth faking: emitted as a comment, logged once per map.
DROP = {
    "ScrCmd_Unk0044": "Diamond coin-case window (Game Corner); HeartGold's Game Corner is Voltorb Flip",
    "ScrCmd_Unk0046": "Diamond coin-case window update", "ScrCmd_Unk0047": "Diamond coin-case window close",
    "ScrCmd_Unk005D": "Diamond music fade-out to silence; HeartGold scripts fade via FadeOutBGM where needed",
    "ScrCmd_Unk0058": "Diamond sound player volume tweak",
    "ScrCmd_ScopeMode": "Diamond's wide camera mode (Spear Pillar); HeartGold camera port pending",
    "ScrCmd_Unk0238": "unknown Diamond variable transform (sub_02042214)",
    "ScrCmd_Unk027E": "Diamond progress check (sub_0205F710 >= 5) with no HeartGold equivalent",
    "ScrCmd_Unk02CF": "Diamond list-window option tweak",
    "ScrCmd_ShowPokemonPic": "Diamond's in-field Pokémon portrait window has no HeartGold script command",
    "ScrCmd_KeepEvent": "Diamond's keep-object-across-load flag; HeartGold objects persist by map data",
    "ScrCmd_Unk0250": "Diamond new-game save-field init; HeartGold does its own",
    "ScrCmd_InitPokemonRecordSize": "Diamond new-game record init; HeartGold does its own",
    "ScrCmd_OpenTradeScreen": "the trade screen is part of HeartGold's NPCTradeExec",
    "ScrCmd_Unk025B": "Great Marsh observatory binoculars", "ScrCmd_Unk025C": "Great Marsh observatory binoculars", "ScrCmd_Unk025D": "Great Marsh observatory binoculars",
    "ScrCmd_Unk0161": "Diamond partner-trainer set; HeartGold's following system differs", "ScrCmd_Unk0162": "Diamond partner-trainer clear; HeartGold's following system differs",
    "ScrCmd_Unk0285": "Great Marsh area shuttle warp", "ScrCmd_Unk00EA": "plays a map's music by Diamond map id", "ScrCmd_Unk00DA": "buffers a message from Diamond's common text bank",
    "ScrCmd_Unk0270": "Diamond save-flag toggle of unknown purpose",
    "ScrCmd_ShowCoinBox": "HeartGold has no coin box window", "ScrCmd_HideCoinBox": "HeartGold has no coin box window", "ScrCmd_UpdateCoinBox": "HeartGold has no coin box window",
    "ScrCmd_StopFanfare": "no stop-fanfare command in HeartGold",
    "ScrCmd_LockCamera": "scripted camera moves need a HeartGold port (library cutscene)",
    "ScrCmd_ReleaseCamera": "scripted camera moves need a HeartGold port (library cutscene)",
    "ScrCmd_ShakeCamera": "screen shake needs a HeartGold port (library cutscene)",
    "ScrCmd_Unk01CD": "Diamond misc save-data pointer setup",
    "ScrCmd_Unk02B5": "Diamond special spawn point (map, x, y); HeartGold's SetSpawn takes a spawn id",
    "ScrCmd_UnlockGenderEntries": "Pokédex gender pages; HeartGold has no toggle",
    "ScrCmd_CheckPoketch": "Pokétch dropped (decision 16)", "ScrCmd_CheckPoketchApp": "Pokétch dropped (decision 16)",
    "ScrCmd_GivePoketch": "Pokétch dropped (decision 16)", "ScrCmd_UnlockPoketchApp": "Pokétch dropped (decision 16)",
    "ScrCmd_ActivateMysteryGift": "Mystery Gift is HeartGold's own", "ScrCmd_CompareMysteryGiftEasyChatInput": "Mystery Gift is HeartGold's own",
    "ScrCmd_DressupPokemon": "Contest dress-up dropped (decision 16)", "ScrCmd_ShowDressedPokemon": "Contest dress-up dropped (decision 16)",
    "ScrCmd_GetFashionName": "Contest dress-up dropped (decision 16)", "ScrCmd_GetFashionNameWithArticle": "Contest dress-up dropped (decision 16)",
    "ScrCmd_CheckPortraitSlot": "Jubilife TV portrait feature dropped", "ScrCmd_GiveWallpaper": "PC wallpaper gift; HeartGold command unknown",
    "ScrCmd_PrepareDoorAnimation": "scripted door animation; HeartGold animates doors itself", "ScrCmd_OpenDoorAnimation": "scripted door animation",
    "ScrCmd_WaitDoorAnimation": "scripted door animation", "ScrCmd_CloseDoorAnimation": "scripted door animation", "ScrCmd_FreeDoorAnimation": "scripted door animation", "ScrCmd_ShowCurrentFloorNumber": "elevator floor box (cosmetic)",
}
# Diamond commands whose only effect is a result variable HeartGold cannot compute: emit SetVar <var>, <value>.
CONST_RESULT = {
    "ScrCmd_GetHour": ("p", 12),   # Diamond's clock hour; HeartGold scripts see noon
    "ScrCmd_GetTimeOfDay": ("p", 1),   # Diamond's day period; HeartGold keeps its own clock, scripts see "day"
    "ScrCmd_CheckEventValidity": ("bp", 0), "ScrCmd_CheckPartyForBadEgg": ("p", 0), "ScrCmd_CountPCFreeSpace": ("p", 1),
    "ScrCmd_GetDayOfWeek": ("p", 0), "ScrCmd_CountAvailablePartyMons_IgnoreSlot": ("pv", 1),
}


def dp_encounters(dp, species, code, idx):
    """Diamond wild-encounter member -> HeartGold gs_enc_data.json entry. Diamond: u32 walk rate, 12 x (u32 level,
    u32 species), swarm/day/night/radar/forms/dual-slot species, then surf, rock smash, old/good/super rod as
    u32 rate + 5 x (u8 min, u8 max, u16 pad, u32 species). Day/night species replace land slots 2 and 3."""
    b = dp.file("encountdata/d_enc_data", idx)
    u = struct.unpack_from(f"<{len(b) // 4}I", b, 0)
    name = lambda n: species.get(n, "SPECIES_NONE")  # noqa: E731
    land = [(u[1 + 2 * i], u[2 + 2 * i]) for i in range(12)]
    o = 25
    swarm, day, night, radar = u[o:o + 2], u[o + 2:o + 4], u[o + 4:o + 6], u[o + 6:o + 10]
    o += 16
    dual = u[o:o + 10]
    o += 10
    mons = []
    for i, (lvl, sp) in enumerate(land):
        if i in (2, 3):
            mons.append({"level": lvl, "species": {"morn": name(day[i - 2]), "day": name(day[i - 2]), "nite": name(night[i - 2])}})
        else:
            mons.append({"level": lvl, "species": {"morn": name(sp), "day": name(sp), "nite": name(sp)}})

    def slots(o):
        rate = u[o]
        o += 1
        out = []
        for i in range(5):
            lv, sp = u[o + 2 * i], u[o + 2 * i + 1]
            out.append({"level": {"min": (lv >> 8) & 0xFF, "max": lv & 0xFF}, "species": name(sp)})
        return {"rate": rate, "mons": out if rate else []}, o + 10
    surf, o = slots(o)
    rock, o = slots(o)
    old, o = slots(o)
    good, o = slots(o)
    sup, o = slots(o)
    return {"map": code, "land": {"rate": u[0], "mons": mons}, "surf": surf, "rock_smash": rock,
            "fishing": {"old_rod": old, "good_rod": good, "super_rod": sup},
            "hoenn": [name(dual[0]), name(dual[1])], "sinnoh": [name(radar[0]), name(radar[1])], "landSwarm": name(swarm[0])}


class Sprites:
    """Maps Diamond sprite ids to HeartGold sprite constants; ports the Diamond NSBTX when HeartGold lacks it."""
    def __init__(self, dp, hg_sprites):
        self.dp, self.hg = dp, hg_sprites
        self.ported = {}   # dp sprite id -> (SPRITE_ name, MMODEL_ name, mmodel index, bytes)
        mm = {k: int(v) for k, v in re.findall(r"#define (MMODEL_\w+)\s+(\d+)", open("include/constants/mmodel.h").read())}
        rows = dict(re.findall(r"\.short (SPRITE_\w+), (MMODEL_\w+),", open("asm/overlay_01_sprite_data.s").read()))
        self.hg_file = {sp: f"{MMODEL_DIR}/mmodel_{mm[m]:08d}.NSBTX" for sp, m in rows.items() if m in mm}
        self.cache = {}
        self.todo = []

    def tex_name(self, dp_id):
        mid = self.dp.sprite_model.get(dp_id)
        if mid is None:
            return None
        tex, _ = nsbtx.read_tex0(self.dp.mmodel(mid))
        return next(iter(tex)).rstrip(b"\0").decode().split(".")[0] if tex else None

    def hg_name(self, dp_id):
        if dp_id in self.cache:
            return self.cache[dp_id]
        name = PLACEHOLDER_SPRITE
        tex = self.tex_name(dp_id)
        same = self.dp.sprites.get(dp_id) if self.dp.sprites.get(dp_id) in self.hg else (f"SPRITE_{tex.upper()}" if tex and f"SPRITE_{tex.upper()}" in self.hg else None)
        if same and self.dp.sprite_model.get(dp_id) is not None and os.path.exists(self.hg_file.get(same, "")):
            # same name, but HeartGold may have redrawn it (Professor Elm vs Rowan); keep Diamond's art when the bytes differ
            if open(self.hg_file[same], "rb").read() != self.dp.mmodel(self.dp.sprite_model[dp_id]):
                same = None
        if 101 <= dp_id <= 117:                                   # variable sprites: same mechanism and ids in both games
            name = f"SPRITE_VAR_{dp_id - 100}" if f"SPRITE_VAR_{dp_id - 100}" in self.hg else str(dp_id)
        elif same:
            name = same
        elif tex and (self.dp.sprite_flags.get(dp_id, 0) & 0xF) == 1:   # Diamond billboard NSBTX: port the file
            name = f"SPRITE_SINNOH_{tex.upper()}"
            self.ported[dp_id] = (name, f"MMODEL_SINNOH_{tex.upper()}", FIRST_SINNOH_MMODEL + len(self.ported),
                                  self.dp.mmodel(self.dp.sprite_model[dp_id]))
        else:
            self.todo.append(f"sprite {dp_id} ({self.dp.sprites.get(dp_id)}) has no HeartGold match and is not a billboard; placeholder")
        self.cache[dp_id] = name
        return name


# Diamond's decomp spells seven moves differently from HeartGold's (same ids).
MOVE_RENAMES = {"MOVE_VISE_GRIP": "MOVE_VICE_GRIP", "MOVE_SMOKESCREEN": "MOVE_SMOKE_SCREEN", "MOVE_SELF_DESTRUCT": "MOVE_SELFDESTRUCT",
                "MOVE_SOFT_BOILED": "MOVE_SOFTBOILED", "MOVE_HIGH_JUMP_KICK": "MOVE_HI_JUMP_KICK", "MOVE_FEINT_ATTACK": "MOVE_FAINT_ATTACK",
                "MOVE_SMELLING_SALTS": "MOVE_SMELLING_SALT"}


class Trainers:
    """Maps Diamond trainer ids to HeartGold trainer constants; the trainers are appended to trainers.json later."""
    def __init__(self, dp, hg_classes):
        self.dp, self.hg_classes = dp, hg_classes
        self.used = {}          # dp trainer id -> TRAINER_SINNOH_ name, in allocation order
        self.new_classes = {}   # dp class name -> (TRAINERCLASS_SINNOH_ name, id)

    def hg_class(self, dpcls):
        short = dpcls[len("TRAINER_CLASS_"):]
        if f"TRAINERCLASS_{short}" in self.hg_classes:
            return f"TRAINERCLASS_{short}"
        if dpcls not in self.new_classes:
            self.new_classes[dpcls] = (f"TRAINERCLASS_SINNOH_{short}", FIRST_SINNOH_TRCLASS + len(self.new_classes))
        return self.new_classes[dpcls][0]

    def hg_name(self, dp_id):
        if dp_id not in self.used:
            base = self.dp.trainers.get(dp_id, f"TRAINER_{dp_id}")
            self.used[dp_id] = f"TRAINER_SINNOH_{base[len('TRAINER_'):]}"
        return self.used[dp_id]

    def entries(self):
        """[(hg index, name, trainers.json entry, [(dp text index, msg type)])] in allocation order."""
        out = []
        for n, (dp_id, name) in enumerate(self.used.items()):
            t = self.dp.trdata[dp_id]
            party = []
            for p in t["party"]:
                q = {"difficulty": p["difficulty"], "genderOverride": "TRPOKE_GENDER_OVERRIDE_OFF",
                     "abilityOverride": "TRPOKE_ABILITY_OVERRIDE_OFF", "level": p["level"], "species": p["species"]}
                if "item" in p:
                    q["item"] = p["item"]
                if "moves" in p:
                    q["moves"] = [MOVE_RENAMES.get(mv, mv) for mv in p["moves"]]
                q["capsule"] = 0
                party.append(q)
            entry = {"type": t["type"], "class": self.hg_class(t["class"]), "name": t["name"], "items": t["items"],
                     "ai_flags": t.get("unkC", 0), "double": t["doubleBattle"], "party": party, "messages": []}
            msgs = [(i, m) for i, (tid, m) in enumerate(self.dp.trmsg_rows) if tid == dp_id]
            out.append((FIRST_SINNOH_TRAINER + n, name, entry, msgs))
        return out


class Translator:
    def __init__(self, dp, state, code, msg_prefix, nmsgs, sprites=None, trainers=None, maps=None, hgmap=None):
        self.dp, self.state, self.code, self.msg_prefix, self.nmsgs = dp, state, code, msg_prefix, nmsgs
        self.extra_msgs = []   # (Diamond bank, id) copied into this map's message bank after its own messages
        self.sprites, self.trainers = sprites, trainers
        self.maps, self.hgmap = maps or {}, hgmap   # Diamond map id -> HeartGold map name; this map's own name
        self.todo = []


    def shared_msg(self, bank, mid):
        """A message from one of Diamond's shared banks, appended to this map's bank (list-window labels live in bank 321)."""
        key = (bank, mid)
        if key not in self.extra_msgs:
            self.extra_msgs.append(key)
        return f"{self.msg_prefix}_{self.nmsgs + self.extra_msgs.index(key):05d}"

    def flag(self, dpflag):
        return self.state.flag(dpflag)

    def var(self, dpvar):
        return self.state.var(dpvar)

    def translate(self, bank, overrides=None, frame_scripts=()):
        """Translate a Diamond script bank to HeartGold assembly text. Returns (asm, nscripts)."""
        overrides = overrides or {}
        b = self.dp.file("script/scr_seq_release", bank)
        starts, p = [], 0
        while p + 2 <= len(b) and struct.unpack_from("<H", b, p)[0] != 0xFD13 and not (starts and p >= min(starts)):
            off = struct.unpack_from("<I", b, p)[0]   # some banks (Hearthome's gym leader room) have no terminator:
            p += 4                                    # the table ends where the first script begins
            if not (p <= p + off < len(b)):   # not a script bank after all (a few Diamond banks hold other data)
                self.todo.append(f"script bank {bank} has no valid header table; treated as empty")
                starts = []
                break
            starts.append(p + off)
        labels, extra_labels = {}, {}   # two script entries can share one start offset (Eterna Forest)
        for i, s in enumerate(starts):
            name = f"scr_seq_{self.code}_{i:03d}"
            if s in labels:
                extra_labels.setdefault(s, []).append(name)
            else:
                labels[s] = name
        movements = {}
        lines = {}
        cmds = {}   # address -> (Diamond command name, raw args, next address, layout)
        work = [(st, i) for i, st in enumerate(starts)]   # (address, index of the script this walk started from)
        seen = set()
        stubbed = set()
        for idx, st in enumerate(starts):
            if idx in overrides:
                lines[st] = overrides[idx]
                seen.add(st)
        while work:
            pc, origin = work.pop(0)
            if pc in seen or pc >= len(b):
                continue
            last_se = None
            menu_idx = 0   # row index for MenuItemAdd (Diamond's list-window add has no row argument)
            while pc < len(b) and pc not in seen:
                seen.add(pc)
                cmd_pc = pc
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
                mkinds = [k for k in tr[1] if k != "0"] if isinstance(tr, tuple) else ""
                for li, k in enumerate(lay):
                    if k == "b":
                        raw.append(b[q]); q += 1
                    elif k in "hvp":
                        raw.append(struct.unpack_from("<H", b, q)[0]); q += 2
                    elif k == "w":
                        v = struct.unpack_from("<i", b, q)[0]; q += 4
                        raw.append(v if li < len(mkinds) and mkinds[li] == "W" else q + v)   # 'W': a plain 32-bit value
                nxt = q
                cmds[cmd_pc] = (name, raw, nxt, lay)
                if name == "ScrCmd_PlaySoundWait":   # Diamond waits for whatever is playing; HeartGold's WaitSE wants the id
                    lines[pc] = f"\tWaitSE {last_se}" if last_se else "\t// Diamond PlaySoundWait with no sound effect before it"
                    pc = nxt
                    continue
                if name == "ScrCmd_PlaySound":
                    nm0 = self.dp.seq_name(raw[0]) if raw[0] < 0x4000 else None
                    last_se = self.var(raw[0]) if raw[0] >= 0x4000 else (nm0 if nm0 in HG_SE_IDS else SE_RENAMES.get(nm0, str(raw[0])))
                if name == "ScrCmd_Unk0040":
                    menu_idx = 0
                if name in ("ScrCmd_Unk029D", "ScrCmd_Unk0042"):   # list-window item: (shared label, value) -> MenuItemAdd label, row, value
                    msg = self.shared_msg(DP_MENU_TEXT_BANK, raw[0])   # labels come from Diamond's shared menu-text bank
                    val = self.var(raw[1]) if raw[1] >= 0x4000 else str(raw[1])
                    lines[pc] = f"\tMenuItemAdd {msg}, {menu_idx}, {val}"
                    menu_idx += 1
                    pc = nxt
                    continue
                if name in DROP:
                    lines[pc] = f"\t// Diamond {name} dropped: {DROP[name]}"
                    self.todo.append(f"dropped {name}: {DROP[name]}")
                    pc = nxt
                    continue
                if name in CONST_RESULT:
                    kinds, value = CONST_RESULT[name]
                    var = raw[kinds.index("p")]
                    lines[pc] = f"\tSetVar {self.var(var)}, {value}   // Diamond {name}: result fixed"
                    pc = nxt
                    continue
                if tr is None:
                    lines[pc] = f"\t// TODO Diamond {name} 0x{cmd:03x} args {raw}: no HeartGold mapping yet"
                    stubbed.add(name)
                else:
                    macro, kinds = tr
                    if len(kinds.replace("0", "")) != len(raw):
                        lines[pc] = f"\t// TODO Diamond {name} 0x{cmd:03x} args {raw}: mapping arity mismatch"
                        stubbed.add(name)
                        pc = nxt
                        continue
                    args = []
                    noop_std = None
                    rawit = iter(raw)
                    for k in kinds:
                        if k == "0":          # a HeartGold argument Diamond's command does not have
                            args.append("0")
                            continue
                        v = next(rawit)
                        if k == "W":
                            args.append(str(v))
                        elif k == "w":
                            lbl = labels.setdefault(v, f"_{v:04X}")
                            work.append((v, origin))
                            args.append(lbl)
                        elif k == "G":
                            if v in self.maps:
                                args.append(self.maps[v])
                            else:
                                args.append(self.hgmap)
                                self.todo.append(f"warp to Diamond map {self.dp.id2map.get(v, v)} not imported; points at this map")
                        elif k == "M":
                            lbl = f"mv_{self.code}_{v:04X}"
                            movements[v] = lbl
                            args.append(lbl)
                        elif k == "m":
                            args.append(f"{self.msg_prefix}_{v:05d}" if v < self.nmsgs else str(v))
                        elif k == "E":   # a Diamond sound-effect id -> HeartGold's id for the same-named effect
                            if v >= 0x4000:
                                args.append(self.var(v))
                            else:
                                nm = self.dp.seq_name(v)
                                if nm in HG_SE_IDS:
                                    args.append(nm)
                                elif nm in SE_RENAMES:
                                    args.append(SE_RENAMES[nm])
                                elif nm in BGM_EVENT or nm in MUSIC:
                                    args.append(BGM_EVENT.get(nm) or MUSIC[nm])
                                else:
                                    args.append(str(v))
                                    if nm:
                                        self.todo.append(f"sound effect {nm} ({v}) is not in HeartGold; raw id kept")
                        elif k == "B":   # a Diamond BGM id -> the HeartGold stand-in (map music or event theme)
                            if v >= 0x4000:
                                args.append(self.var(v))
                            else:
                                nm = self.dp.seq_name(v)
                                hg = BGM_EVENT.get(nm) or MUSIC.get(nm)
                                if hg is None:
                                    self.todo.append(f"music {nm or v} has no HeartGold stand-in; {DEFAULT_MUSIC}")
                                    hg = DEFAULT_MUSIC
                                args.append(hg)
                        elif k == "f":
                            args.append(self.flag(v))
                        elif k == "p":
                            args.append(self.var(v))
                        elif k == "v":
                            args.append(self.var(v) if v >= 0x4000 else str(v))
                        elif k == "o":
                            args.append("obj_player" if v == 0xFF else (self.var(v) if v >= 0x4000 else str(v)))
                        elif k == "s":
                            if v in DP_STD_NOOP:
                                args.append("0")
                                noop_std = DP_STD_NOOP[v]
                            elif v in DP_STD:
                                args.append(DP_STD[v])
                            else:
                                item = self.dp.std_item(205, v - 1999) if 2000 <= v < 2256 else None
                                args.append(f"{v} /* TODO Diamond std script */")
                                self.todo.append(f"std script {v}")
                        elif k == "t":
                            if v >= 0x4000:   # a trainer id held in a variable: only the Spear Pillar tag battle does this (partner Barry)
                                args.append(self.trainers.hg_name(DP_PARTNER_BARRY))
                                self.todo.append("tag battle partner taken as Barry's Spear Pillar team (Diamond picks it by starter)")
                            else:
                                args.append(self.trainers.hg_name(v) if v else "0")
                        elif k == "F":
                            args.append(self.var(v) if v >= 0x4000 else self.flag(v))
                        else:
                            args.append(str(v))
                    if macro == "TrainerBattle":
                        args = [args[0], args[1], "0", "0"]
                    if macro == "SetVar" and 0x4020 <= raw[0] <= 0x402F and raw[1] < 0x4000 and self.sprites:
                        args[1] = self.sprites.hg_name(raw[1])   # object-graphics variables hold sprite ids
                    if noop_std:
                        lines[pc] = f"\t// Diamond std call dropped: {noop_std}"
                        pc = nxt
                        if name in ("ScrCmd_End", "ScrCmd_Return", "ScrCmd_GoTo", "ScrCmd_RestartCurrentScript"):
                            break
                        continue
                    if macro == "LoadNPCTrade":
                        args[0] = str(raw[0] + HG_NPC_TRADE_COUNT)   # Diamond's four trades follow HeartGold's (files/a/1/1/2)
                    if macro == "SpecialMartBuy" and raw[0] < 0x4000:
                        args[0] = str(raw[0] + 30)   # Diamond's 19 special marts sit after HeartGold's 30 (src/scrcmd_mart.c)
                    # MartBuy: HeartGold's Poké Mart ignores the id and stocks by badge count, so Diamond's id is harmless
                    lines[pc] = f"\t{macro} {', '.join(args)}".rstrip()
                pc = nxt
                if name == "ScrCmd_End" and origin in frame_scripts:
                    # Frame-table scripts rerun every frame while their variable holds; Diamond's lock the player first
                    # and may End without releasing when the player is not where the cutscene expects (a Fly landing).
                    lines[cmd_pc] = "\tReleaseAll\n" + lines[cmd_pc]
                if name in ("ScrCmd_End", "ScrCmd_Return", "ScrCmd_GoTo", "ScrCmd_RestartCurrentScript"):
                    break
        # Frame-table scripts re-fire every frame while their variable holds its value. Diamond's typically start with
        # LockAll, test the player's position, and End when it does not match; a player who flew in would be relocked
        # every frame. Move that LockAll into the branches the tests jump to, so a non-matching position costs nothing.
        CHECKS = ("ScrCmd_Compare", "ScrCmd_Check", "ScrCmd_GetPlayerPosition", "ScrCmd_GoToIf", "ScrCmd_CallIf", "ScrCmd_Get")
        self.frame_triggers = {}   # script index -> [(axis, value)] when the head is "player x/z equals N" tests only
        for idx in frame_scripts:
            if not (0 <= idx < len(starts)) or starts[idx] not in cmds or cmds[starts[idx]][0] != "ScrCmd_LockAllEvents":
                continue
            st = starts[idx]
            pc2, targets, ok = cmds[st][2], [], False
            triggers, pure, last_cmp = [], True, None
            while pc2 in cmds:
                name2, raw2, nxt2, lay2 = cmds[pc2]
                if name2 == "ScrCmd_End":
                    ok = True
                    break
                if not name2.startswith(CHECKS):
                    break
                targets += [v for v, k in zip(raw2, lay2) if k == "w"]
                if name2 == "ScrCmd_GetPlayerPosition" and tuple(raw2) == (0x8004, 0x8005):
                    pass
                elif name2 == "ScrCmd_CompareVarToValue" and raw2[0] in (0x8004, 0x8005):
                    last_cmp = ("x" if raw2[0] == 0x8004 else "z", raw2[1])
                elif name2 == "ScrCmd_GoToIf" and raw2[0] == 1 and last_cmp:
                    triggers.append(last_cmp)
                    last_cmp = None
                else:
                    pure = False
                pc2 = nxt2
            if ok and targets and pure and triggers:
                # The whole head is "if the player stands on row/column N, run the cutscene": that is a coordinate event
                # in HeartGold, which only fires when the player steps there instead of every frame.
                self.frame_triggers[idx] = triggers
            if ok and targets:
                lines[st] = "\t// LockAll moved into the branches below: this frame script re-fires until its variable changes"
                for t in targets:
                    if t in lines and not lines[t].startswith("\tLockAll"):
                        lines[t] = "\tLockAll\n" + lines[t]
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
            mv_text.append(f"\t.balign 4, 0\n{lbl}:\n" + "\n".join(body) + "\n\tEndMovement\n")   # movement data must be aligned, as stock scripts do
        out = []
        for s in sorted(set(starts)):
            pass
        for addr in sorted(lines):
            if addr in labels:
                out.append(f"\n{labels[addr]}:")
                out.extend(f"{n}:" for n in extra_labels.get(addr, []))
            out.append(lines[addr])
        return "\n".join(out) + "\n\n" + "\n".join(mv_text), len(starts), stubbed


# ----------------------------------------------------------------------------- state (flags, vars, ids)
class State:
    def __init__(self):
        self.flags = {}
        self.vars = {}
        self.hidden_items = []  # (item, qty, dowsing, idx, code)

    def flag(self, dpflag):
        if dpflag >= 0x4000:          # temp flags, same in both games
            return str(dpflag)
        if dpflag not in self.flags:
            self.flags[dpflag] = FIRST_SINNOH_FLAG + len(self.flags)
        return f"FLAG_SINNOH_{dpflag}"

    def var(self, dpvar):
        if dpvar < 0x4000:
            return str(dpvar)
        if 0x4000 <= dpvar <= 0x400F or 0x4020 <= dpvar <= 0x402F or dpvar >= 0x8000:  # temp, object-graphics and special vars, same in both games
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
    # Safety net: per-map generated files (event_*.h, scr_seq_*.s, map_matrix_*.bin, NNN_*.json, msg_*.json) must never land on
    # a path that exists in stock HeartGold; a colliding map code would silently replace HeartGold's own data.
    stock_paths = set(subprocess.run(["git", "ls-tree", "-r", "--name-only", "master", "--", "files"], capture_output=True, text=True).stdout.split())
    import builtins
    _open = builtins.open

    def guarded_open(path, mode="r", *a, **k):
        sp = str(path)
        if "w" in str(mode) and sp in stock_paths and re.match(r"(event_|scr_seq_\d{4}_|map_matrix_\d{4}_|msg_\d{4}_|\d{3}_)", os.path.basename(sp)):
            raise RuntimeError(f"refusing to overwrite stock file {sp}: a generated name collides with HeartGold's")
        return _open(path, mode, *a, **k)
    builtins.open = guarded_open
    state = State()
    hg_sprites = set(re.findall(r"#define (SPRITE_\w+)", open("include/constants/sprites.h").read()))
    sprites = Sprites(dp, hg_sprites)
    trainers = Trainers(dp, set(re.findall(r"#define (TRAINERCLASS_\w+)", open("include/constants/trainer_class.h").read())))
    flat_bdhc = narcs.member("land", 1)[len(narcs.member("land", 1)) - struct.unpack_from("<I", narcs.member("land", 1), 12)[0]:]

    # id allocation
    maps = []  # dicts
    for i, name in enumerate(manifest):
        mid = dp.maps[name]
        code = "S" + dp.codes[name]   # HeartGold reuses many of Diamond's map codes (T01, D17R0110...); the prefix keeps every generated name apart
        maps.append(dict(name=name, dpid=mid, code=code, hgid=FIRST_MAP_ID + i, hgname=f"MAP_SINNOH_{name[4:]}",
                         scr=FIRST_SCR_SEQ + 2 * i, hdr=FIRST_SCR_SEQ + 2 * i + 1, evt=FIRST_ZONE_EVENT + i, msg=FIRST_MSG + i,
                         matrix=FIRST_MATRIX + i, dphdr=dp.header(mid)))
    dp2hg = {m["dpid"]: m["hgname"] for m in maps}

    # Diamond's town signs are 3D props hung on object events; collect them per map up front so the area's
    # building list and texture set, and the land chunks, can carry them as buildings.
    def read_objects(h):
        eb = dp.file("eventdata/zone_event_release", h["events"])
        p = 4 + struct.unpack_from("<I", eb, 0)[0] * 0x14
        return [struct.unpack_from("<14Hi", eb, p + 4 + i * 0x20) for i in range(struct.unpack_from("<I", eb, p)[0])]
    area_signs = {}
    # Diamond draws sea and mountain filler cells that belong to no map (header MAP_EVERYWHERE). Give each filler cell within
    # two cells of an imported map to that map, so coasts are water instead of black and the cell uses the neighbour's area.
    m0 = dp.matrix0
    owned = {}
    for m in maps:
        if m["dphdr"]["matrix"] == 0:
            for i in range(m0["w"] * m0["h"]):
                if m0["headers"][i] == m["dpid"]:
                    owned[(i % m0["w"], i // m0["w"])] = m["dpid"]
    frontier = set(owned)
    for _layer in range(2):
        new = {}
        for (cx, cy) in frontier:
            for dx, dy in ((1, 0), (-1, 0), (0, 1), (0, -1)):
                nx, ny = cx + dx, cy + dy
                if not (0 <= nx < m0["w"] and 0 <= ny < m0["h"]):
                    continue
                j = ny * m0["w"] + nx
                if (nx, ny) in owned or (nx, ny) in dp.claims or (nx, ny) in new:
                    continue
                if m0["headers"][j] in (0, 1) and m0["land"][j] != 0xFFFF:
                    new[(nx, ny)] = owned.get((cx, cy), dp.claims.get((cx, cy)))
        dp.claims.update(new)
        frontier = set(new)
    print(f"claimed {len(dp.claims)} filler cells of the shared matrix for their neighbouring maps")
    all_shared = set()   # every imported cell of the shared Sinnoh matrix, to fence off its unimported neighbours
    for m in maps:
        if m["dphdr"]["matrix"] == 0:
            cs, og, _ = dp.map_cells(m["dpid"], m["dphdr"])
            all_shared.update((x + og[0], y + og[1]) for x, y, _, _ in cs)
    for m in maps:
        _, origin, _ = dp.map_cells(m["dpid"], m["dphdr"])
        ox, oy = (0, 0) if m["dphdr"]["matrix"] == 0 else (origin[0] * 32, origin[1] * 32)
        m["signs"] = [(o[1], o[12] - ox, o[13] - oy) for o in read_objects(m["dphdr"]) if o[1] in SIGN_MODELS]
        area_signs.setdefault(m["dphdr"]["area"], set()).update(("fldeff", SIGN_MODELS[sp][0]) for sp, _, _ in m["signs"])

    land_cache, area_cache, tex_cache = {}, {}, {}
    shared_cells = {}                           # (matrix x, y) -> (hg land id, altitude, hg map id)
    enc_json = json.load(open(ENC_JSON))
    enc_defs = []
    hg_species = {int(v): k for k, v in re.findall(r"#define (SPECIES_\w+)\s+(\d+)", open("include/constants/species.h").read())}
    shared_matrix_idx = FIRST_MATRIX + len(maps)
    model_cache = {"field": {}, "room": {}}
    generated_scripts, generated_headers, generated_events, generated_msgs, generated_matrices = [], [], [], [], []
    extra_model_defs = {}   # C name -> HeartGold build-model id (EXTRA_AREA_MODELS)
    header_entries, map_defines = [], []
    todo = []

    def model_blob(bid):
        return dp.models[bid] if isinstance(bid, int) else dp.fldeff(bid[1])

    anim_cache = {}   # Diamond bm_anime member -> HeartGold a/1/0/6 member

    def anim_entry(bid):
        """HeartGold's 24-byte build-anim entry for a Diamond building: its animations appended to a/1/0/6."""
        stub = b"\xff\xff" + b"\x00" * 6 + b"\xff" * 16
        if not isinstance(bid, int):
            return stub
        e = dp.build_anim_entry(bid)
        if e is None or e[0] == 0:
            return stub
        ids = list(struct.unpack_from("<4i", e, 4))
        hg = []
        for a in ids:
            if a < 0 or a >= len(dp._anims):
                hg.append(-1)
                continue
            if a not in anim_cache:
                anim_cache[a] = narcs.append("anims", dp._anims[a])
            hg.append(anim_cache[a])
        count = sum(1 for a in hg if a >= 0)
        if count == 0:   # Diamond marks many models "animated" with no animation ids and flags 0xFF
            return stub
        return bytes([1, e[1], e[2], 0]) + bytes([0, 0, 1, count]) + struct.pack("<4i", *hg)

    def import_models(ids, kind):
        key_models, key_anim = ("field_models", "field_anim") if kind == "field" else ("room_models", "room_anim")
        out = []
        for bid in ids:
            if bid not in model_cache[kind]:
                model_cache[kind][bid] = narcs.append(key_models, model_blob(bid))
                narcs.append(key_anim, anim_entry(bid))
                narcs.matshp_add[kind] += 1
            out.append(model_cache[kind][bid])
        return out

    # Every model a Diamond area needs: its own build list plus every building placed in any imported map that
    # uses the area. Collected up front because several maps share one area and the list is written once.
    area_models = {}
    area_kind = {}
    for m in maps:
        h = m["dphdr"]
        if h["area"] not in area_models:
            a = dp.file("areadata/area_data", h["area"])
            dp_build, _ = struct.unpack_from("<HH", a, 0)
            ab = dp.file("areadata/area_build_model/area_build", dp_build)
            area_models[h["area"]] = list(dict.fromkeys(struct.unpack_from(f"<{len(ab)//2}H", ab, 0)))   # Diamond lists can repeat an id; HeartGold asserts on that
        cells, _, _ = dp.map_cells(m["dpid"], h)
        for _, _, land_id, _ in cells:
            c = dp.file("land_data/land_data_release", land_id)
            perm, bld = struct.unpack_from("<2I", c, 0)
            for i in range(bld // 0x30):
                bid = struct.unpack_from("<I", c, 0x10 + perm + i * 0x30)[0]
                if bid not in area_models[h["area"]]:
                    area_models[h["area"]].append(bid)
        for bid in EXTRA_AREA_MODELS.get(m["name"], {}).values():
            if bid not in area_models[h["area"]]:
                area_models[h["area"]].append(bid)

    for m in maps:
        h = m["dphdr"]
        outdoor = h["maptype"] in (1, 2, 3)  # Diamond map_type: 1 town/city, 2 route, 3 cave? interiors are 4/6/7/8
        kind = "field" if outdoor else "room"
        if h["area"] in area_kind:          # maps sharing an area must use the archive the area was imported into
            kind = area_kind[h["area"]]
            outdoor = kind == "field"
        else:
            area_kind[h["area"]] = kind
        # --- area
        if h["area"] not in area_cache:
            a = dp.file("areadata/area_data", h["area"])
            dp_build, dp_tex = struct.unpack_from("<HH", a, 0)
            dp_ids = list(area_models[h["area"]])
            dp_ids += [k for k in sorted(area_signs.get(h["area"], ())) if k not in dp_ids]
            hg_ids = import_models(dp_ids, kind)
            for mname, extra in EXTRA_AREA_MODELS.items():
                if any(mm["name"] == mname and mm["dphdr"]["area"] == h["area"] for mm in maps):
                    for cname, bid in extra.items():
                        extra_model_defs[cname] = hg_ids[dp_ids.index(bid)]
            if dp_tex not in tex_cache:
                tex_cache[dp_tex] = narcs.append("tex", dp.file("areadata/area_map_tex/map_tex_set", dp_tex))
            list_idx = narcs.append("buildlist", struct.pack("<H", len(hg_ids)) + b"".join(struct.pack("<H", i) for i in hg_ids))
            merged, _, _ = nsbtx.merge_models([model_blob(b) for b in dp_ids])
            assert narcs.append("buildtex", merged) == list_idx
            area_cache[h["area"]] = narcs.append("area", struct.pack("<HHHBB", list_idx, tex_cache[dp_tex], 0xFFFF, 1 if outdoor else 0, 1 if outdoor else 0))
        m["hgarea"] = area_cache[h["area"]]
        # --- land data + matrix
        cells, origin, (w, hgt) = dp.map_cells(m["dpid"], h)
        m["origin"] = origin
        shared = h["matrix"] == 0
        if shared:
            cells = [(x + origin[0], y + origin[1], l, a) for x, y, l, a in cells]
            m["cells"] = [(x, y) for x, y, _, _ in cells]
        grid = {}
        for x, y, land_id, alt in cells:
            if land_id not in land_cache:
                c = dp.file("land_data/land_data_release", land_id)
                perm, bld, mdl, bdhc_len = struct.unpack_from("<4I", c, 0)
                body = bytearray(c[0x10:0x10 + perm + bld + mdl])
                for (lid, tx, tz), (tt, tc) in TILE_OVERRIDES.items():
                    if lid == land_id:
                        body[(tz * 32 + tx) * 2] = tt
                        body[(tz * 32 + tx) * 2 + 1] = tc
                for i in range(bld // 0x30):
                    off = perm + i * 0x30
                    old = struct.unpack_from("<I", body, off)[0]
                    struct.pack_into("<I", body, off, model_cache[kind][old])
                extra = b""
                for spr, sx, sz in m["signs"]:
                    if (sx // 32, sz // 32) != (x, y):
                        continue
                    tx, tz = sx % 32, sz % 32
                    body[(tz * 32 + tx) * 2 + 1] = 0x80          # the sign's tile blocks movement, like the object did
                    extra += struct.pack("<Iiii", model_cache[kind][("fldeff", SIGN_MODELS[spr][0])],
                                         ((tx - 16) * 16 + 8) << 12, 0, ((tz - 16) * 16 + 8) << 12)
                    extra += struct.pack("<3I", 0, 0, 0) + struct.pack("<3I", 0x1000, 0x1000, 0x1000) + bytes(8)
                if shared:   # wall off edges that face cells not imported yet (no land there)
                    for (dx, dy), tiles in (((0, -1), [(tx, 0) for tx in range(32)]), ((0, 1), [(tx, 31) for tx in range(32)]),
                                            ((-1, 0), [(0, tz) for tz in range(32)]), ((1, 0), [(31, tz) for tz in range(32)])):
                        if (x + dx, y + dy) not in all_shared:
                            for tx, tz in tiles:
                                body[(tz * 32 + tx) * 2 + 1] = 0x80
                body[perm + bld:perm + bld] = extra
                bld += len(extra)
                try:   # Diamond's height map, rewritten in HeartGold's layout
                    hg_bdhc = bdhc.convert(c[0x10 + perm + (bld - len(extra)) + mdl:0x10 + perm + (bld - len(extra)) + mdl + bdhc_len])
                except Exception as e:  # noqa: BLE001
                    todo.append(f"{m['name']}: land {land_id} height map not converted ({e}); flat ground")
                    hg_bdhc = flat_bdhc
                body += hg_bdhc
                land_cache[land_id] = narcs.append("land", struct.pack("<4IHH", perm, bld, mdl, len(hg_bdhc), 0x1234, 0) + bytes(body))
            grid[(x, y)] = (land_cache[land_id], alt)
        if shared:
            for (x, y), (lid, alt) in grid.items():
                shared_cells[(x, y)] = (lid, alt, m["hgid"])
            m["matrix_ref"] = f"NARC_map_matrix_map_matrix_{shared_matrix_idx:04d}_{SHARED_MATRIX_NAME}_bin"
        else:
            mname = m["code"].encode()[:15]
            mx = struct.pack("<BBBBB", w, hgt, 0, 1, len(mname)) + mname
            mx += bytes(grid.get((x, y), (0, 0))[1] for y in range(hgt) for x in range(w))
            mx += b"".join(struct.pack("<H", grid.get((x, y), (0xFFFF, 0))[0]) for y in range(hgt) for x in range(w))
            mpath = f"files/fielddata/mapmatrix/map_matrix/map_matrix_{m['matrix']:04d}_{m['code']}.bin"
            open(mpath, "wb").write(mx)
            generated_matrices.append(os.path.basename(mpath))
            m["matrix_ref"] = f"NARC_map_matrix_map_matrix_{m['matrix']:04d}_{m['code']}_bin"
        # --- text
        bank_name = f"msg_{m['msg']:04d}_{m['code']}"
        js, nmsgs = gmm_to_json(dp, h["msg"], bank_name)
        for extra in EXTRA_MESSAGES.get(m["name"], []):
            parts = [x for x in re.split(r"(?<=[\n\r])", extra) if x]
            js["messages"].append({"id": f"{bank_name}_{nmsgs:05d}", "en_US": parts if len(parts) > 1 else parts[0]})
            nmsgs += 1
        generated_msgs.append(bank_name)
        # --- scripts (the message bank is written after translation: list-window labels get appended to it)
        tr = Translator(dp, state, m["code"], bank_name, nmsgs, sprites, trainers, dp2hg, m["hgname"])
        frame_idx = set()   # scripts run from the level script's frame table (var == value, every frame)
        lb0 = dp.file("script/scr_seq_release", h["lvl"])
        p0 = 0
        while lb0[p0] != 0:
            if lb0[p0] == 1:
                q0 = p0 + 5 + struct.unpack_from("<I", lb0, p0 + 1)[0]
                while struct.unpack_from("<H", lb0, q0)[0] != 0:
                    frame_idx.add(struct.unpack_from("<H", lb0, q0 + 4)[0] - 1)
                    q0 += 6
            p0 += 5
        asm, nscripts, stubbed = tr.translate(h["scripts"], SCRIPT_OVERRIDES.get(m["name"]), frame_idx)
        for pat, fn, count in SCRIPT_PATCHES.get(m["name"], []):
            asm, nsub = re.subn(pat, fn, asm, count=count)
            assert nsub > 0, f"{m['name']}: script patch {pat!r} matched nothing"
        for k, (sbank, smid) in enumerate(tr.extra_msgs):
            if sbank not in _shared_msg_cache:
                _shared_msg_cache[sbank] = gmm_to_json(dp, sbank, "shared")[0]["messages"]
            src_msgs = _shared_msg_cache[sbank]
            text = src_msgs[smid]["en_US"] if smid < len(src_msgs) else "?"
            js["messages"].append({"id": f"{bank_name}_{nmsgs + k:05d}", "en_US": text})
        json.dump(js, open(f"files/msgdata/msg/{bank_name}.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
        todo += [f"{m['name']}: {t}" for t in tr.todo] + [f"{m['name']}: unmapped command {s}" for s in sorted(stubbed)]
        scr_name = f"scr_seq_{m['scr']:04d}_{m['code']}"
        hdr_name = f"scr_seq_{m['hdr']:04d}_{m['code']}_hdr"
        includes = f'#include "constants/scrcmd.h"\n#include "constants/sinnoh.h"\n#include "fielddata/script/scr_seq/event_{m["code"]}.h"\n#include "msgdata/msg/{bank_name}.h"\n#include "macros/script.inc"\n#include "macros/movement.inc"\n\n'
        # item balls: Diamond's std 7000+ scripts are 'SetVar 0x8008 item; SetVar 0x8009 qty' and HeartGold's
        # std_itemball_variadic reads the same two vars, so each ball gets a tiny script in the map's own bank
        eb = dp.file("eventdata/zone_event_release", h["events"])
        q = 4 + struct.unpack_from("<I", eb, 0)[0] * 0x14
        no_pre = struct.unpack_from("<I", eb, q)[0]; q += 4
        itemball_ref, item_scripts = {}, []
        for i in range(no_pre):
            sid = struct.unpack_from("<H", eb, q + i * 0x20 + 10)[0]
            if 7000 <= sid < 8000:
                r = dp.std_item(370, sid - 6999)
                if r is None:
                    todo.append(f"{m['name']}: item ball std {sid} has no readable contents; variadic placeholder")
                    continue
                n = nscripts + len(item_scripts)
                item_scripts.append(f"scr_seq_{m['code']}_{n:03d}:\n\tSetVar VAR_SPECIAL_x8008, {r[0]}\n\tSetVar VAR_SPECIAL_x8009, {r[1]}\n\tCallStd std_itemball_variadic\n\tEnd\n")
                itemball_ref[i] = f"_EV_scr_seq_{m['code']}_{n:03d} + 1"
        nscripts_bank = nscripts    # scripts Diamond's events may legally reference
        nscripts += len(item_scripts)
        asm += "\n" + "\n".join(item_scripts)
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
                if sid in DP_LEVEL_STD_DROPPED:   # known, deliberately dropped (reason recorded once in TODO.txt)
                    return None
                todo.append(f"{m['name']}: level script uses Diamond std script {sid}; dropped")
                return None
            if sid - 1 >= nscripts_bank:
                todo.append(f"{m['name']}: level script uses script {sid} but the bank has {nscripts_bank} scripts; dropped")
                return None
            return f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1"
        for t, sid in entries:
            ref = script_ref(sid)
            if ref is not None:
                hdr_lines.append(f"\t{tname[t]} {ref}")
        if table is not None:
            hdr_lines.append(f"\tInitScriptEntry_OnFrameTable scr_seq_{m['code']}_map_scripts")
        hdr_lines.append("\tInitScriptEntryEnd\n")
        frame_coord_requests = []   # (script ref, var, value, [(axis, tile)]) replacing frame-table rows
        if table is not None:
            hdr_lines.append(f"scr_seq_{m['code']}_map_scripts:")
            q = table
            while struct.unpack_from("<H", lb, q)[0] != 0:
                var, val, sid = struct.unpack_from("<HHH", lb, q)
                ref = script_ref(sid)
                if ref is not None and (sid - 1) in tr.frame_triggers:
                    frame_coord_requests.append((ref, state.var(var), val, tr.frame_triggers[sid - 1]))
                elif ref is not None:
                    hdr_lines.append(f"\tInitScriptGoToIfEqual {state.var(var)}, {val}, {ref}")
                q += 6
            hdr_lines.append("\tInitScriptFrameTableEnd\n")
        hdr_lines.append("\tInitScriptEnd")
        open(f"files/fielddata/script/scr_seq/{hdr_name}.s", "w").write("\n".join(hdr_lines) + "\n")
        generated_scripts += [scr_name, hdr_name]
        # --- events
        ox, oy = (0, 0) if shared else (origin[0] * 32, origin[1] * 32)
        p = 0
        nb = struct.unpack_from("<I", eb, p)[0]; p += 4
        def ev_script(sid):
            if sid - 1 >= nscripts_bank:   # Diamond's Oreburgh has a sign pointing past its bank
                todo.append(f"{m['name']}: event uses script {sid} but the bank has {nscripts_bank} scripts; no script for now")
                return "0"
            return f"_EV_scr_seq_{m['code']}_{sid-1:03d} + 1"
        bgs = []
        for i in range(nb):
            sid, typ, x, z, y, d = struct.unpack_from("<HHIIII", eb, p + i * 0x14)
            if 8000 <= sid < 8800:   # Diamond's 8800+ are Great Marsh std scripts, not hidden items
                r = dp.hidden_item(sid - 8000)
                if r is None:
                    todo.append(f"{m['name']}: hidden item {sid} has no row in Diamond's table; Potion placeholder")
                    r = (17, 1, 0)
                idx = FIRST_HIDDEN_ITEM_IDX + len(state.hidden_items)
                state.hidden_items.append((r[0], r[1], r[2], idx, m["code"]))
                sid_s = str(8000 + idx)
            elif sid >= 2000:   # a Diamond std script on a BG event
                sid_s = DP_STD.get(sid, "0")
                if sid not in DP_STD:
                    todo.append(f"{m['name']}: BG event {i} uses Diamond std script {sid}; no script for now")
            else:
                sid_s = ev_script(sid)
            bgs.append({"scriptId": sid_s, "type": typ, "x": x - ox, "z": z - oy, "y": y, "dir": d})
        p += nb * 0x14
        no = struct.unpack_from("<I", eb, p)[0]; p += 4
        objs, obj_names = [], []
        for i in range(no):
            o = struct.unpack_from("<14Hi", eb, p + i * 0x20)
            sid = o[5]
            if sid >= 7000 and sid < 8000:
                sid_s = itemball_ref.get(i, "std_itemball_variadic")
            elif 3000 <= sid < 7000:   # Diamond's NPC-trainer std ids: 3000/5000 + trainer - 1, same scheme as HeartGold
                macro = "std_trainer" if sid < 5000 else "std_trainer_2"
                sid_s = f"{macro}({trainers.hg_name(sid - (3000 if sid < 5000 else 5000) + 1)})"
            elif sid == 0xFFFF or o[1] == BERRY_PLOT_SPRITE:   # Diamond's "no script"; berry plots are dropped below
                sid_s = "0"
            elif sid in DP_STD_SILENT:
                sid_s = "0"
            elif sid >= 2000:
                sid_s = DP_STD.get(sid, "0")
                if sid not in DP_STD:
                    todo.append(f"{m['name']}: object {i} uses Diamond std script {sid}; no script for now")
            elif sid == 0:
                sid_s = "0"
            else:
                sid_s = ev_script(sid)
            if o[1] in SIGN_MODELS:   # 3D prop: a BG event on its tile (the model is placed as a building in the land data)
                bgs.append({"scriptId": sid_s, "type": SIGN_MODELS[o[1]][1], "x": o[12] - ox, "z": o[13] - oy, "y": 0, "dir": 4})
                continue
            if o[1] == BERRY_PLOT_SPRITE:
                todo.append(f"{m['name']}: berry plot object {o[0]} skipped; Diamond's soft-soil berry system is not in HeartGold")
                continue
            spr_s = sprites.hg_name(o[1])
            oname = f"obj_{m['code']}_{o[0]}"
            obj_names.append((oname, o[0]))
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
            if sid >= 2000:
                csid = DP_STD.get(sid, "0")
                if sid not in DP_STD:
                    todo.append(f"{m['name']}: coord event {i} uses Diamond std script {sid}; no script for now")
            else:
                csid = ev_script(sid)
            coords.append({"scriptId": csid, "x": x - ox, "z": z - oy, "w": cw, "h": ch, "y": y,
                           "val": val, "var": state.var(var)})
        if frame_coord_requests:
            if shared:
                xs = [c[0] for c in m["cells"]]
                ys = [c[1] for c in m["cells"]]
                x0, x1, y0, y1 = min(xs) * 32, (max(xs) + 1) * 32, min(ys) * 32, (max(ys) + 1) * 32
            else:
                x0, x1, y0, y1 = 0, w * 32, 0, hgt * 32
            for ref, cvar, cval, trig in frame_coord_requests:
                for axis, tile in trig:
                    if axis == "z":
                        coords.append({"scriptId": ref, "x": x0 - ox, "z": tile - oy, "w": x1 - x0, "h": 1, "y": 0, "val": cval, "var": cvar})
                    else:
                        coords.append({"scriptId": ref, "x": tile - ox, "z": y0 - oy, "w": 1, "h": y1 - y0, "y": 0, "val": cval, "var": cvar})
        ev = {"header": f"fielddata/script/scr_seq/event_{m['code']}.h", "bgs": bgs, "objects": objs, "warps": warps, "coords": coords}
        evname = f"{m['evt']:03d}_{m['code']}"
        json.dump(ev, open(f"files/fielddata/eventdata/zone_event/{evname}.json", "w"), indent=2)
        generated_events.append(evname)
        evh = [f"#ifndef SCR_SEQ_{m['code']}_H_", f"#define SCR_SEQ_{m['code']}_H_", "", '#include "constants/sinnoh.h"', ""]
        evh += [f"#define _EV_scr_seq_{m['code']}_{i:03d} {i}" for i in range(nscripts)] + [""]
        evh += [f"#define {n} {i}" for n, i in obj_names] + ["", "#endif"]
        open(f"files/fielddata/script/scr_seq/event_{m['code']}.h", "w").write("\n".join(evh) + "\n")
        generated_headers.append(f"event_{m['code']}.h")
        # --- map header entry
        music = [MUSIC.get(h["music"][0], DEFAULT_MUSIC), MUSIC.get(h["music"][1], DEFAULT_MUSIC)]
        encref = "ENCDATA_NA"
        if h["enc"] is not None:
            encref = f"ENCDATA_SINNOH_{m['code']}"
            enc_defs.append(f"#define {encref} ENCDATA(_{len(enc_json['encounters']):08d})")
            enc_json["encounters"].append(dp_encounters(dp, hg_species, m["code"], h["enc"]))
        if outdoor:
            extra = ".cameraType = 0,\n                        .followMode = MAP_FOLLOWMODE_ALLOW,\n                        .battleBg = BATTLE_BG_CITY,\n                        .mapType = MAP_TYPE_CITY_TOWN,"
        else:
            extra = ".cameraType = 4,\n                        .followMode = MAP_FOLLOWMODE_HEIGHT_RESTRICT,\n                        .battleBg = BATTLE_BG_BUILDING_1,\n                        .mapType = MAP_TYPE_INTERIOR,"
        header_entries.append(f"""    [{m['hgname']}] = {{
                        .wildEncounterBank = {encref},
                        .areaDataBank = {m['hgarea']},
                        .moveModelBank = 15,
                        .worldMapX = __WMX_{m['code']}__,
                        .worldMapY = __WMY_{m['code']}__,
                        .matrixId = {m['matrix_ref']},
                        .scriptsBank = {scr_name}_bin,
                        .scriptHeaderBank = {hdr_name}_bin,
                        .msgBank = {bank_name},
                        .dayMusicId = {music[0]},
                        .nightMusicId = {music[1]},
                        .eventsBank = NARC_zone_event_{evname}_bin,
                        .mapsec = MAPSEC_{MAPSEC_RENAMES.get(h['mapsec'], h['mapsec'])},
                        .areaIcon = {1 if outdoor else 9},
                        .momCallIntroParam = 6,
                        .regionNo = MAP_REGION_SINNOH,
                        .weather = {WEATHER_MAP.get(h["weather"], 0)},
                        {extra}
                        .bikeAllowed = {'TRUE' if h['bike'] else 'FALSE'},
                        .runningAllowed_Unused = TRUE,
                        .escapeRopeAllowed = {'TRUE' if h['escape'] else 'FALSE'},
                        .flyAllowed = {'TRUE' if shared and h['fly'] else 'FALSE'},
                        .outgoingCalls = FALSE,
                        .incomingCalls = FALSE,
                        .radioSignal = FALSE,
                        }},""")
        map_defines.append(f"#define {m['hgname']:<49} {m['hgid']} // Diamond {m['name']} ({m['code']})")

    narcs.save()

    # --- generated constants: flags, vars, map ids, hidden items

    # --- Pokégear / Town Map: project each outdoor map's cells onto Diamond's Town Map picture
    def proj(cx, cy):
        return cx * MAP_PROJ_X[0] // MAP_PROJ_X[1], cy * MAP_PROJ_Y[0] // MAP_PROJ_Y[1]
    rects, by_sec = {}, {}
    for m in maps:
        if "cells" in m:
            xs = [c[0] for c in m["cells"]]
            ys = [c[1] for c in m["cells"]]
            x0, y0 = proj(min(xs), min(ys))
            x1, y1 = proj(max(xs) + 1, max(ys) + 1)
            rects[m["code"]] = (x0, y0, max(1, x1 - x0), max(1, y1 - y0))
            by_sec.setdefault(m["dphdr"]["mapsec"], rects[m["code"]])
    for m in maps:
        r = rects.get(m["code"]) or by_sec.get(m["dphdr"]["mapsec"]) or (0, 0, 1, 1)
        header_entries = [e.replace(f"__WMX_{m['code']}__", str(r[0])).replace(f"__WMY_{m['code']}__", str(r[1])) for e in header_entries]
    pg = ["// Generated by tools/sinnoh_port/build_sinnoh.py: Sinnoh entries for the Pokégear map / Town Map / Fly.",
          "// Rectangles are matrix cells projected onto Diamond's Town Map picture (see pokegear_map.py).", ""]
    locs = [m for m in maps if m["code"] in rects]
    towns = [m for m in locs if m["dphdr"]["maptype"] == 1]
    pg.append(f"#define SINNOH_POKEGEAR_LOCATIONS {len(locs)}")
    pg.append(f"#define SINNOH_POKEGEAR_FLYPOINTS {len(towns)}")
    pg.append("static const PokegearMapLocationSpec sSinnohLocationSpecs[] = {")
    for m in locs:
        x, y, w, hh = rects[m["code"]]
        pg.append(f"    {{ .mapId = {m['hgname']}, .x = {x}, .y = {y}, .width = {min(w, 15)}, .height = {min(hh, 15)}, .objXoffset = 0, .objYoffset = 0, .flavorText = 0, .tilemapUnk174BlockID = 0 }},")
    pg.append("};")
    pg.append("static const MapFlypointParam sSinnohFlypointParams[] = {")
    for i, m in enumerate(towns):
        x, y, w, hh = rects[m["code"]]
        pg.append(f"    {{ {m['hgname']}, {m['hgname']}, 0, {i}, {x}, {y}, 0, 0, {min(w, 15)}, {min(hh, 15)}, 0, 0, 0, 0 }},")
    pg.append("};")
    pg.append("// Fly lands at the centre of this matrix cell of each town")
    pg.append("static const u8 sSinnohFlyLanding[][2] = {")
    for m in towns:
        xs = [c[0] for c in m["cells"]]; ys = [c[1] for c in m["cells"]]
        pg.append(f"    {{ {sorted(xs)[len(xs) // 2]}, {sorted(ys)[len(ys) // 2]} }},   // {m['hgname']}")
    pg.append("};")
    open("src/data/sinnoh_pokegear.h", "w").write("\n".join(pg) + "\n")

    # --- spawn table (asm/unk_0203BA5C.s): one row per town = Fly landing, blackout respawn inside its Pokémon
    # Center, and a fly-point flag (38+ -> SINNOH_FLYPOINT_FLAG_BASE in sys_flags.c)
    hg_by_name = {m["hgname"]: m for m in maps}
    spawn_rows = []
    for i, m in enumerate(towns):
        pc = hg_by_name.get(m["hgname"] + "_POKECENTER_1F")
        ev = json.load(open(f"files/fielddata/eventdata/zone_event/{m['evt']:03d}_{m['code']}.json"))
        land = next(((w["x"], w["z"] + 1) for w in ev["warps"] if pc and w["header"] == pc["hgname"]), None)
        if land is None:
            house = hg_by_name.get(m["hgname"] + "_PLAYER_HOUSE_1F")
            land = next(((w["x"], w["z"] + 1) for w in ev["warps"] if house and w["header"] == house["hgname"]), None)
        if land is None:
            xs = [c[0] for c in m["cells"]]; ys = [c[1] for c in m["cells"]]
            land = (sorted(xs)[len(xs) // 2] * 32 + 16, sorted(ys)[len(ys) // 2] * 32 + 16)
        # The blackout spawn must be an interior: its coordinates are packed into one byte each. A town
        # without a Pokémon Center (Twinleaf) respawns in the player's house, else in its first interior.
        if not pc:
            pc = hg_by_name.get(m["hgname"] + "_PLAYER_HOUSE_1F") or next((x for x in maps if x["hgname"].startswith(m["hgname"] + "_") and x is not m), None)
        if pc:
            pev = json.load(open(f"files/fielddata/eventdata/zone_event/{pc['evt']:03d}_{pc['code']}.json"))
            door = next(((w["x"], w["z"] - 1) for w in pev["warps"] if w["header"] == m["hgname"]), (8, 13))
            inside = (pc["hgname"], door[0], door[1])
        else:
            inside = (m["hgname"], min(land[0], 255), min(land[1], 255))
            todo.append(f"{m['name']}: no interior for the blackout spawn; coordinates clipped")
        spawn_rows.append(f"\tspawn {38 + i}, 1, 1, {inside[0]}, {inside[1]}, {inside[2]}, {m['hgname']}, {land[0]}, {land[1]}, {m['hgname']}, {land[0]}, {land[1]}")
    ensure_markers("asm/unk_0203BA5C.s", "\n\t.text\n\n\tthumb_func_start SpawnIdToTableIndex", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("asm/unk_0203BA5C.s", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "\n".join(spawn_rows) + ("\n" if spawn_rows else ""))
    num_spawns = 30 + len(spawn_rows)

    # Diamond's new-game flags/vars go into HeartGold's std_init (scr_seq_0149, run once at New Game)
    tr = Translator(dp, state, "INIT", "msg_INIT", 0, sprites, trainers, {}, "MAP_X")
    init_asm, _, _ = tr.translate(DP_NEW_GAME_BANK)
    init_lines = [l for l in init_asm.splitlines() if re.match(r"\t(SetFlag|ClearFlag|SetVar) ", l)]
    assert len(init_lines) > 50, "Diamond's new-game script translated short; check DP_NEW_GAME_BANK"
    std149 = "files/fielddata/script/scr_seq/scr_seq_0149.s"
    s149 = open(std149).read()
    i0 = s149.index("scr_seq_0149_000:")
    iend = s149.index("\tEnd\n", i0)
    s149 = s149[:iend] + "\t// SINNOH_PORT_BEGIN: Diamond's new-game state\n" + "\n".join(init_lines) + "\n\t// SINNOH_PORT_END\n" + s149[iend:]
    if '#include "constants/sinnoh.h"' not in s149:
        s149 = s149.replace('#include "macros/script.inc"', '#include "constants/sinnoh.h"\n#include "macros/script.inc"', 1)
    open(std149, "w").write(s149)
    sin = ["#ifndef POKEHEARTGOLD_CONSTANTS_SINNOH_H", "#define POKEHEARTGOLD_CONSTANTS_SINNOH_H", "", "// Generated by tools/sinnoh_port/build_sinnoh.py. Do not edit.", ""]
    sin += [f"#define FLAG_SINNOH_{k} {v}" for k, v in sorted(state.flags.items())] + [""]
    sin += [f"#define VAR_SINNOH_{k:04X} 0x{v:04X}" for k, v in sorted(state.vars.items())]
    sin += ["", f"#define SINNOH_MATRIX_ID NARC_map_matrix_map_matrix_{shared_matrix_idx:04d}_{SHARED_MATRIX_NAME}_bin",
            f"#define SINNOH_CELL_TO_MAP_X(cx) ((cx) * {MAP_PROJ_X[0]} / {MAP_PROJ_X[1]})",
            f"#define SINNOH_CELL_TO_MAP_Y(cy) ((cy) * {MAP_PROJ_Y[0]} / {MAP_PROJ_Y[1]})",
            f"#define SPAWN_MAPS_COUNT {num_spawns}            // HeartGold's 30 spawn rows plus one per Sinnoh town",
            "#define SINNOH_FLYPOINT_FLAG_BASE 0x1560   // fly-point flags 38+ (64 slots, above the Sinnoh trainer block)",
            f"#define SINNOH_HIDDEN_ITEM_FIRST_IDX {FIRST_HIDDEN_ITEM_IDX}   // hidden-item indices from here on are Sinnoh's",
            f"#define SINNOH_HIDDEN_ITEM_FLAG_BASE 0x{SINNOH_HIDDEN_ITEM_FLAG_BASE:04X}   // their flags (stock 800+idx would hit story flags)", ""]
    sin += [f"#define {cname} {hgid}   // Diamond build model, placed at runtime by gymmick code" for cname, hgid in sorted(extra_model_defs.items())] + [""]
    buttons = []
    for pm in maps:
        if pm["name"] != "MAP_PASTORIA_GYM":
            continue
        pcells, _, _ = dp.map_cells(pm["dpid"], pm["dphdr"])
        for cx, cy, land_id, _ in pcells:
            c = dp.file("land_data/land_data_release", land_id)
            perm, bld = struct.unpack_from("<2I", c, 0)
            for i in range(bld // 0x30):
                bid = struct.unpack_from("<I", c, 0x10 + perm + i * 0x30)[0]
                if bid in PASTORIA_BUTTON_MODELS:
                    bx, _, bz = struct.unpack_from("<iii", c, 0x10 + perm + i * 0x30 + 4)
                    buttons.append((cx * 32 + int(bx / 4096 / 16 + 16), cy * 32 + int(bz / 4096 / 16 + 16), PASTORIA_BUTTON_MODELS[bid]))
    sin += ["#define SINNOH_PASTORIA_BUTTONS " + " ".join(f"{{ {x}, {z}, {lvl} }}," for x, z, lvl in buttons) + "   // button tile x, z, water level (from the gym's land data)", ""]
    std3 = "files/fielddata/script/scr_seq/scr_seq_0003.s"
    std3_src = open(std3).read()
    std3_count = std3_src.count("\tScrDef ")
    sin += [f"#define {name} {2000 + std3_count + i}   // appended to HeartGold's misc std bank" for i, (name, _) in enumerate(SINNOH_STD)] + ["", "#endif"]
    std3_src = std3_src.replace("\tScrDefEnd\n", "".join(f"\tScrDef {name}_body\n" for name, _ in SINNOH_STD) + "\tScrDefEnd\n", 1)
    std3_src = std3_src.rstrip("\n") + "\n\n" + "".join(f"{name}_body:\n{body}\n" for name, body in SINNOH_STD) + "\t.balign 4, 0\n"
    open(std3, "w").write(std3_src)
    open("include/constants/sinnoh.h", "w").write("\n".join(sin) + "\n")

    if shared_cells:
        dm = dp.matrix0
        w, hgt = dm["w"], dm["h"]
        name = SHARED_MATRIX_NAME.encode()
        mx = struct.pack("<BBBBB", w, hgt, 1, 1, len(name)) + name
        mx += b"".join(struct.pack("<H", shared_cells.get((x, y), (0, 0, 0))[2]) for y in range(hgt) for x in range(w))
        mx += bytes(shared_cells.get((x, y), (0, 0, 0))[1] for y in range(hgt) for x in range(w))
        mx += b"".join(struct.pack("<H", shared_cells.get((x, y), (0xFFFF, 0, 0))[0]) for y in range(hgt) for x in range(w))
        mpath = f"files/fielddata/mapmatrix/map_matrix/map_matrix_{shared_matrix_idx:04d}_{SHARED_MATRIX_NAME}.bin"
        open(mpath, "wb").write(mx)
        generated_matrices.append(os.path.basename(mpath))

    json.dump(enc_json, open(ENC_JSON, "w", encoding="utf-8"), indent=4, ensure_ascii=False)
    ensure_markers("include/encounter_tables_narc.h", "#endif // POKEHEARTGOLD_ENCOUNTER_TABLES_NARC_H", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/encounter_tables_narc.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(d + "\n" for d in enc_defs))

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

    # Diamond sprites HeartGold lacks: the NSBTX goes into the overworld model archive, the sprite gets a constant
    # and a class-0 row (plain billboard person, what Diamond's flag word 0x451 means) in overlay 1's sprite table.
    import glob
    for f in glob.glob(f"{MMODEL_DIR}/mmodel_*.NSBTX"):
        if int(re.search(r"mmodel_(\d+)", f).group(1)) >= FIRST_SINNOH_MMODEL:
            os.remove(f)
    ported = sorted(sprites.ported.values(), key=lambda t: t[2])
    for _, _, idx, blob in ported:
        open(f"{MMODEL_DIR}/mmodel_{idx:08d}.NSBTX", "wb").write(blob)
    meson_block(f"{MMODEL_DIR}/meson.build", r"mmodel_nsbtx = copy_gen\.process\(files\(", [f"mmodel_{idx:08d}.NSBTX" for _, _, idx, _ in ported])
    ensure_markers("include/constants/mmodel.h", "#endif // POKEHEARTGOLD_CONSTANTS_MMODEL_H", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/constants/mmodel.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(f"#define {mm} {idx}\n" for _, mm, idx, _ in ported))
    ensure_markers("include/constants/sprites.h", "#endif // POKEHEARTGOLD_CONSTANTS_SPRITES_H", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/constants/sprites.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(f"#define {sp} {FIRST_SINNOH_SPRITE + n}\n" for n, (sp, _, _, _) in enumerate(ported)))
    ensure_markers("asm/overlay_01_sprite_data.s", "\t.short 0xFFFF, 0x0000, 0x000 | (63 << 10)", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("asm/overlay_01_sprite_data.s", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(f"\t.short {sp}, {mm}, 0x000 | (0 << 10)\n" for sp, mm, _, _ in ported))
    todo += [f"sprites: {t}" for t in sprites.todo]

    # --- trainers: append to trainers.json (restored from master), dialogue to msg_0728 + trtbl/trtblofs
    tj = json.load(open("files/poketool/trainer/trainers.json"))
    while len(tj["trainers"]) < FIRST_SINNOH_TRAINER:
        tj["trainers"].append({"type": "TRTYPE_MON", "class": "TRAINERCLASS_PKMN_TRAINER_ETHAN", "name": "{TRNAME} -",
                               "items": [], "ai_flags": 0, "double": 0, "party": [], "messages": []})
    trmsg_names = {int(v): k for k, v in re.findall(r"#define (TRMSG_\w+)\s+(\d+)", open("include/constants/trainers.h").read())}
    dp_trtext, _ = gmm_to_json(dp, 558, "msg_0728")
    m728 = json.load(open("files/msgdata/msg/msg_0728.json"))
    tt, tt_fnt = narc_read("files/poketool/trmsg/trtbl.narc")
    to, to_fnt = narc_read("files/poketool/trmsg/trtblofs.narc")
    rows = [struct.unpack_from("<HH", tt[0], i) for i in range(0, len(tt[0]), 4)]
    assert len(rows) == len(m728["messages"]), "trainer text table and msg_0728 out of sync"
    tr_entries = trainers.entries()
    tr_defines = ["#define FIRST_SINNOH_TRAINER %d" % FIRST_SINNOH_TRAINER]
    for idx, name, entry, msgs in tr_entries:
        for ti, mt in msgs:
            text = dp_trtext["messages"][ti]["en_US"]
            flat = "".join(text) if isinstance(text, list) else text
            entry["messages"].append({"type": trmsg_names.get(mt, str(mt)), "message": flat.replace("\n", "\\n").replace("\r", "\\r").replace("\f", "\\f")})
            rows.append((idx, mt))
            m728["messages"].append({"id": f"msg_0728_{len(m728['messages']):05d}", "en_US": text})
        tj["trainers"].append(entry)
        tr_defines.append(f"#define {name} {idx}")
    json.dump(tj, open("files/poketool/trainer/trainers.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
    json.dump(m728, open("files/msgdata/msg/msg_0728.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
    tbl = b"".join(struct.pack("<HH", a, b_) for a, b_ in rows)
    first = {}
    for i, (a, _) in enumerate(rows):
        first.setdefault(a, i * 4)
    ntr = max(len(to[0]) // 2, (tr_entries[-1][0] + 1) if tr_entries else 0)
    ofs = []
    for t in range(ntr):
        nxt = [first[a] for a in first if a >= t]
        ofs.append(min(nxt) if nxt else len(tbl))
    narc_write("files/poketool/trmsg/trtbl.narc", [tbl], tt_fnt)
    narc_write("files/poketool/trmsg/trtblofs.narc", [b"".join(struct.pack("<H", o) for o in ofs)], to_fnt)
    ensure_markers("include/constants/trainers.h", "#define LAST_TRAINER_INDEX", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/constants/trainers.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "\n".join(tr_defines) + "\n")

    # --- trainer classes HeartGold lacks: constant, gender, class name, battle picture (Diamond's static art, blank
    # intro animation), prize money, gym-leader victory music
    newcls = sorted(trainers.new_classes.items(), key=lambda kv: kv[1][1])
    ensure_markers("include/constants/trainer_class.h", "// Only used to display attributes of phone contacts", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("include/constants/trainer_class.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(f"#define {hg} {cid}\n" for dpc, (hg, cid) in newcls))
    gend = "    TRAINER_FEMALE, // TRAINERCLASS_PKMN_TRAINER_DAWN_PT\n"
    gend += "".join(f"    {'TRAINER_FEMALE' if dp.trclass_gender.get(dpc, 0) == 1 else 'TRAINER_MALE'}, // {hg}\n" for dpc, (hg, cid) in newcls)
    ensure_markers("src/trainer_data.c", "};\n\nTrainerGender TrainerClass_GetGenderOrTrainerCount", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("src/trainer_data.c", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", gend)
    m730 = json.load(open("files/msgdata/msg/msg_0730.json"))
    dp_clsnames, _ = gmm_to_json(dp, DP_TRCLASS_NAME_BANK, "msg_0730")
    pics, pic_fnt = narc_read("files/a/0/5/8")
    tmpl = pics[TRCLASS_TEMPLATE * 5:TRCLASS_TEMPLATE * 5 + 5]
    for dpc, (hg, cid) in newcls:
        assert cid == len(m730["messages"]) and cid * 5 == len(pics), (cid, len(m730["messages"]), len(pics))
        m730["messages"].append({"id": f"msg_0730_{cid:05d}", "en_US": dp_clsnames["messages"][dp.trclasses[dpc]]["en_US"]})
        dpcls = dp.trclasses[dpc]
        anim = bytearray(tmpl[0]); anim[0x30:] = bytes(len(anim) - 0x30)
        pal = bytearray(tmpl[1]); pal[0x28:0x48] = dp.trgra[dpcls * 2 + 1][0x28:0x48]
        pics += [bytes(anim), bytes(pal), tmpl[2], tmpl[3], dp.trgra[dpcls * 2]]
    json.dump(m730, open("files/msgdata/msg/msg_0730.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
    narc_write("files/a/0/5/8", pics, pic_fnt)
    ensure_markers("asm/overlay_12_battle_command.s", "\t.short TRAINERCLASS_BIRD_KEEPER, 8\n", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", before=False)
    replace_block("asm/overlay_12_battle_command.s", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END",
                  "".join(f"\t.short {hg}, {30 if 'LEADER' in hg else 16 if 'BARRY' in hg else PRIZE_DEFAULT}\n" for dpc, (hg, cid) in newcls))
    bc = open("src/battle/battle_command.c").read()
    bc = re.sub(r"sPrizeMoneyTbl\[0x[0-9A-Fa-f]+\]", f"sPrizeMoneyTbl[0x{0x81 + len(newcls):X}]", bc)
    open("src/battle/battle_command.c", "w").write(bc)
    ensure_markers("src/battle/battle_controller_player.c", "        case TRAINERCLASS_LEADER_BLUE:\n            PlayBGM(SEQ_GS_WIN3);", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END")
    replace_block("src/battle/battle_controller_player.c", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(f"        case {hg}:\n" for dpc, (hg, cid) in newcls if "LEADER" in hg))
    # Battle intro and music: NPCTrainerGetBattleIntroAndMusicParam (asm/unk_020517A4.s) scans a table of
    # trainer class | (param << 10); the param picks a transition and a VS theme. Reuse HeartGold's params.
    e4_seen = []
    def music_param(hg):
        if "ELITE_FOUR" in hg:            # Will, Koga, Bruno, Karen have params 16-19; hand them out in order
            if hg not in e4_seen:
                e4_seen.append(hg)
            return 16 + e4_seen.index(hg) % 4
        for key, prm in (("CHAMPION", 20), ("GALACTIC_BOSS", 34), ("COMMANDER", 30), ("GALACTIC", 29), ("BARRY", 21), ("LEADER", 0)):
            if key in hg:
                return prm
        return None
    music_rows = []
    for dpc, (hg, cid) in newcls:
        prm = music_param(hg)
        if prm is not None:
            music_rows.append(f"\t.short {hg} | ({prm} << 10)\n")
    replace_block("asm/unk_020517A4.s", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", "".join(music_rows))
    sh = open("include/constants/sinnoh.h").read()
    sh = sh.replace("#endif", f"#define TRCLASS_MUSIC_ROWS {32 + len(music_rows)}   // asm/unk_020517A4.s class-to-battle-music rows\n#endif", 1)
    open("include/constants/sinnoh.h", "w").write(sh)
    plain = [hg for _, (hg, _) in newcls if music_param(hg) is None]
    if plain:
        todo.append("trainer classes: " + ", ".join(plain) + " use the default encounter jingle and battle music; every class's intro animation is blank")
    todo += [f"level scripts calling Diamond std {k} are dropped: {v}" for k, v in sorted(DP_LEVEL_STD_DROPPED.items())]
    # --- Diamond's four in-game trades: records are HeartGold's NPCTrade minus its trailing word; names go into msg_0200
    # (17 nicknames then 17 OT names once appended) and NpcTradeNum gains four entries before NPC_TRADE_MAX.
    dp_trades, _ = narc_read(f"{dp.repo}/files/fielddata/pokemon_trade/fld_trade.narc")
    hg_trades, hg_trade_fnt = narc_read("files/a/1/1/2")
    assert len(hg_trades) == HG_NPC_TRADE_COUNT, len(hg_trades)
    narc_write("files/a/1/1/2", hg_trades + [t + bytes(4) for t in dp_trades], hg_trade_fnt)
    names, _ = gmm_to_json(dp, DP_TRADE_NAME_BANK, "msg_0326")
    m200 = json.load(open("files/msgdata/msg/msg_0200.json"))
    assert len(m200["messages"]) == 2 * HG_NPC_TRADE_COUNT, len(m200["messages"])
    nicks = [{"en_US": names["messages"][i]["en_US"]} for i in range(len(dp_trades))]
    ots = [{"en_US": names["messages"][len(dp_trades) + i]["en_US"]} for i in range(len(dp_trades))]
    msgs = m200["messages"][:HG_NPC_TRADE_COUNT] + nicks + m200["messages"][HG_NPC_TRADE_COUNT:] + ots
    for i, msg in enumerate(msgs):
        msg["id"] = f"msg_0200_{i:05d}"
    m200["messages"] = msgs
    json.dump(m200, open("files/msgdata/msg/msg_0200.json", "w", encoding="utf-8"), indent=2, ensure_ascii=False)
    ensure_markers("include/constants/npc_trade.h", "    NPC_TRADE_MAX,", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END", before=True)
    replace_block("include/constants/npc_trade.h", "// SINNOH_PORT_BEGIN", "// SINNOH_PORT_END",
                  "".join(f"    NPC_TRADE_SINNOH_{i},   // Diamond trade {i}: {nicks[i]['en_US']} from {ots[i]['en_US']}\n" for i in range(len(dp_trades))))
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
    replace_block(hi, "    // SINNOH_PORT_BEGIN", "    // SINNOH_PORT_END", "".join(f"    {{ {item}, {qty}, {dows}, 0, {idx} }}, // Diamond {code}\n" for item, qty, dows, idx, code in state.hidden_items))
    # std script 8000+idx indexes HeartGold's generic hidden-item bank (scr_seq_0145, 257 aliases of one script);
    # Sinnoh indices run past it, so the bank's offset table gets one alias per extra index
    assert FIRST_SINNOH_FLAG + len(state.flags) <= SINNOH_HIDDEN_ITEM_FLAG_BASE, "Sinnoh flags ran into the hidden-item flag block"
    assert len(state.hidden_items) <= 256, "more Sinnoh hidden items than the 0x1060-0x115F flag block holds"
    b145 = "files/fielddata/script/scr_seq/scr_seq_0145.s"
    s = open(b145).read()
    stock_defs = s.count("\tScrDef ")
    need = FIRST_HIDDEN_ITEM_IDX + len(state.hidden_items) - stock_defs
    if need > 0:
        s = s.replace("\tScrDefEnd\n", "\tScrDef scr_seq_0145_000\n" * need + "\tScrDefEnd\n", 1)
        open(b145, "w").write(s)

    # NUM_FLAGS growth
    fl = open("include/constants/flags.h").read()
    fl2 = re.sub(r"#define NUM_FLAGS \d+", f"#define NUM_FLAGS {NUM_FLAGS_NEW}", fl)
    if fl2 != fl:
        open("include/constants/flags.h", "w").write(fl2)
    va = open("include/constants/vars.h").read()
    va2 = re.sub(r"#define NUM_VARS \(0x[0-9A-Fa-f]+\)", f"#define NUM_VARS (0x{NUM_VARS_NEW:X})", va)
    if va2 != va:
        open("include/constants/vars.h", "w").write(va2)

    print(f"imported {len(maps)} maps; flags used {len(state.flags)}, vars used {len(state.vars)}/{len(FREE_VARS)}, hidden items {len(state.hidden_items)}")
    with open(os.path.join(HERE, "TODO.txt"), "w") as f:
        f.write("\n".join(sorted(set(todo))) + "\n")
    print(f"{len(set(todo))} follow-ups written to tools/sinnoh_port/TODO.txt")


if __name__ == "__main__":
    main()
