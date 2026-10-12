#ifdef _IN_FIELDMAP_C

#include "constants/items.h"

static const struct HiddenItemData sHiddenItemParam[] = {
    { ITEM_POTION,       1, 0, 0, 0   },
    { ITEM_NUGGET,       1, 0, 0, 1   },
    { ITEM_NUGGET,       1, 0, 0, 225 },
    { ITEM_POTION,       1, 0, 0, 2   },
    { ITEM_POKE_BALL,    1, 0, 0, 14  },
    { ITEM_MAX_ETHER,    1, 0, 0, 15  },
    { ITEM_MAX_REVIVE,   1, 0, 0, 16  },
    { ITEM_HYPER_POTION, 1, 0, 0, 17  },
    { ITEM_ELIXIR,       1, 0, 0, 18  },
    { ITEM_HYPER_POTION, 1, 0, 0, 3   },
    { ITEM_POKE_BALL,    1, 0, 0, 108 },
    { ITEM_GREAT_BALL,   1, 0, 0, 146 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 147 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 148 },
    { ITEM_RARE_CANDY,   1, 0, 0, 149 },
    { ITEM_NUGGET,       1, 0, 0, 150 },
    { ITEM_GREAT_BALL,   1, 0, 0, 151 },
    { ITEM_PARLYZ_HEAL,  1, 0, 0, 152 },
    { ITEM_BIG_PEARL,    1, 0, 0, 154 },
    { ITEM_X_SPEED,      1, 0, 0, 153 },
    { ITEM_REVIVE,       1, 0, 0, 155 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 156 },
    { ITEM_CALCIUM,      1, 0, 0, 157 },
    { ITEM_HEART_SCALE,  1, 0, 0, 4   },
    { ITEM_GREAT_BALL,   1, 0, 0, 5   },
    { ITEM_SUPER_POTION, 1, 0, 0, 97  },
    { ITEM_FULL_HEAL,    1, 0, 0, 6   },
    { ITEM_GREAT_BALL,   1, 0, 0, 27  },
    { ITEM_SUPER_POTION, 1, 0, 0, 28  },
    { ITEM_FULL_HEAL,    1, 0, 0, 29  },
    { ITEM_ANTIDOTE,     1, 0, 0, 30  },
    { ITEM_SUPER_POTION, 1, 0, 0, 31  },
    { ITEM_FULL_HEAL,    1, 0, 0, 32  },
    { ITEM_ETHER,        1, 0, 0, 33  },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 211 },
    { ITEM_REPEL,        1, 0, 0, 212 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 213 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 214 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 215 },
    { ITEM_RARE_CANDY,   1, 0, 0, 7   },
    { ITEM_SUPER_POTION, 1, 0, 0, 8   },
    { ITEM_SUPER_POTION, 1, 0, 0, 9   },
    { ITEM_PARLYZ_HEAL,  1, 0, 0, 52  },
    { ITEM_SUPER_POTION, 1, 0, 0, 53  },
    { ITEM_ANTIDOTE,     1, 0, 0, 67  },
    { ITEM_MAX_POTION,   1, 0, 0, 68  },
    { ITEM_REVIVE,       1, 0, 0, 69  },
    { ITEM_NUGGET,       1, 0, 0, 10  },
    { ITEM_AWAKENING,    1, 0, 0, 11  },
    { ITEM_FULL_HEAL,    1, 0, 0, 34  },
    { ITEM_FULL_HEAL,    1, 0, 0, 35  },
    { ITEM_PP_UP,        1, 0, 0, 159 },
    { ITEM_PROTEIN,      1, 0, 0, 160 },
    { ITEM_HYPER_POTION, 1, 0, 0, 12  },
    { ITEM_ETHER,        1, 0, 0, 13  },
    { ITEM_RARE_CANDY,   1, 0, 0, 132 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 133 },
    { ITEM_ETHER,        1, 0, 0, 19  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 20  },
    { ITEM_ANTIDOTE,     1, 0, 0, 65  },
    { ITEM_REVIVE,       1, 0, 0, 21  },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 125 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 126 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 127 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 128 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 129 },
    { ITEM_MAX_POTION,   1, 0, 0, 62  },
    { ITEM_FULL_RESTORE, 1, 0, 0, 63  },
    { ITEM_CARBOS,       1, 0, 0, 64  },
    { ITEM_HP_UP,        1, 0, 0, 22  },
    { ITEM_NUGGET,       1, 0, 0, 98  },
    { ITEM_PP_UP,        1, 0, 0, 135 },
    { ITEM_X_ATTACK,     1, 0, 0, 136 },
    { ITEM_RARE_CANDY,   1, 0, 0, 23  },
    { ITEM_FULL_HEAL,    1, 0, 0, 137 },
    { ITEM_HYPER_POTION, 1, 0, 0, 66  },
    { ITEM_PROTEIN,      1, 0, 0, 86  },
    { ITEM_PEARL,        1, 0, 0, 158 },
    { ITEM_RARE_CANDY,   1, 0, 0, 161 },
    { ITEM_HYPER_POTION, 1, 0, 0, 24  },
    { ITEM_MAX_ETHER,    1, 0, 0, 99  },
    { ITEM_STARDUST,     1, 0, 0, 170 },
    { ITEM_STARDUST,     1, 0, 0, 171 },
    { ITEM_STARDUST,     1, 0, 0, 172 },
    { ITEM_STARDUST,     1, 0, 0, 173 },
    { ITEM_RARE_CANDY,   1, 0, 0, 73  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 74  },
    { ITEM_SUPER_REPEL,  1, 0, 0, 191 },
    { ITEM_PEARL,        1, 0, 0, 192 },
    { ITEM_REVIVE,       1, 0, 0, 193 },
    { ITEM_FULL_RESTORE, 1, 0, 0, 75  },
    { ITEM_REVIVE,       1, 0, 0, 25  },
    { ITEM_STARDUST,     1, 0, 0, 26  },
    { ITEM_BIG_PEARL,    1, 0, 0, 209 },
    { ITEM_STARDUST,     1, 0, 0, 39  },
    { ITEM_PEARL,        1, 0, 0, 40  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 226 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 41  },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 130 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 131 },
    { ITEM_MAX_POTION,   1, 0, 0, 42  },
    { ITEM_HYPER_POTION, 1, 0, 0, 43  },
    { ITEM_REVIVE,       1, 0, 0, 44  },
    { ITEM_MAX_REPEL,    1, 0, 0, 45  },
    { ITEM_ETHER,        1, 0, 0, 46  },
    { ITEM_RARE_CANDY,   1, 0, 0, 140 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 141 },
    { ITEM_NUGGET,       1, 0, 0, 142 },
    { ITEM_FULL_RESTORE, 1, 0, 0, 47  },
    { ITEM_HP_UP,        1, 0, 0, 48  },
    { ITEM_HYPER_POTION, 1, 0, 0, 143 },
    { ITEM_FULL_HEAL,    1, 0, 0, 144 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 49  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 50  },
    { ITEM_REVIVE,       1, 0, 0, 51  },
    { ITEM_FULL_HEAL,    1, 0, 0, 54  },
    { ITEM_X_SP__DEF,    1, 0, 0, 55  },
    { ITEM_FULL_RESTORE, 1, 0, 0, 36  },
    { ITEM_RARE_CANDY,   1, 0, 0, 37  },
    { ITEM_MAX_POTION,   1, 0, 0, 102 },
    { ITEM_ELIXIR,       1, 0, 0, 100 },
    { ITEM_MAX_POTION,   1, 0, 0, 70  },
    { ITEM_ICE_HEAL,     1, 0, 0, 72  },
    { ITEM_REVIVE,       1, 0, 0, 228 },
    { ITEM_CARBOS,       1, 0, 0, 71  },
    { ITEM_REVIVE,       1, 0, 0, 81  },
    { ITEM_MAX_POTION,   1, 0, 0, 82  },
    { ITEM_MAX_ELIXIR,   1, 0, 0, 83  },
    { ITEM_PP_UP,        1, 0, 0, 101 },
    { ITEM_REVIVE,       1, 0, 0, 181 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 182 },
    { ITEM_NUGGET,       1, 0, 0, 183 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 184 },
    { ITEM_MAX_POTION,   1, 0, 0, 79  },
    { ITEM_FULL_HEAL,    1, 0, 0, 80  },
    { ITEM_MAX_REVIVE,   1, 0, 0, 185 },
    { ITEM_PP_UP,        1, 0, 0, 186 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 189 },
    { ITEM_HYPER_POTION, 1, 0, 0, 187 },
    { ITEM_ZINC,         1, 0, 0, 188 },
    { ITEM_RARE_CANDY,   1, 0, 0, 190 },
    { ITEM_IRON,         1, 0, 0, 84  },
    { ITEM_FULL_HEAL,    1, 0, 0, 103 },
    { ITEM_HEART_SCALE,  1, 0, 0, 168 },
    { ITEM_PEARL,        1, 0, 0, 162 },
    { ITEM_PEARL,        1, 0, 0, 163 },
    { ITEM_BIG_PEARL,    1, 0, 0, 164 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 56  },
    { ITEM_CALCIUM,      1, 0, 0, 224 },
    { ITEM_FULL_RESTORE, 1, 0, 0, 57  },
    { ITEM_X_SPECIAL,    1, 0, 0, 58  },
    { ITEM_REVIVE,       1, 0, 0, 104 },
    { ITEM_X_ACCURACY,   1, 0, 0, 59  },
    { ITEM_X_DEFENSE,    1, 0, 0, 60  },
    { ITEM_MAX_POTION,   1, 0, 0, 61  },
    { ITEM_HP_UP,        1, 0, 0, 169 },
    { ITEM_CARBOS,       1, 0, 0, 197 },
    { ITEM_ETHER,        1, 0, 0, 105 },
    { ITEM_NUGGET,       1, 0, 0, 106 },
    { ITEM_REVIVE,       1, 0, 0, 107 },
    { ITEM_PP_UP,        1, 0, 0, 122 },
    { ITEM_MAX_ETHER,    1, 0, 0, 109 },
    { ITEM_MAX_ELIXIR,   1, 0, 0, 110 },
    { ITEM_NUGGET,       1, 0, 0, 134 },
    { ITEM_CALCIUM,      1, 0, 0, 111 },
    { ITEM_ELIXIR,       1, 0, 0, 112 },
    { ITEM_MAX_ETHER,    1, 0, 0, 85  },
    { ITEM_FULL_RESTORE, 1, 0, 0, 87  },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 216 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 217 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 218 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 219 },
    { ITEM_TINYMUSHROOM, 1, 0, 0, 220 },
    { ITEM_PP_UP,        1, 0, 0, 198 },
    { ITEM_GUARD_SPEC_,  1, 0, 0, 199 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 227 },
    { ITEM_STAR_PIECE,   1, 0, 0, 145 },
    { ITEM_STAR_PIECE,   1, 0, 0, 138 },
    { ITEM_HYPER_POTION, 1, 0, 0, 139 },
    { ITEM_REVIVE,       1, 0, 0, 195 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 196 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 113 },
    { ITEM_BIG_MUSHROOM, 1, 0, 0, 194 },
    { ITEM_NUGGET,       1, 0, 0, 200 },
    { ITEM_STARDUST,     1, 0, 0, 174 },
    { ITEM_STARDUST,     1, 0, 0, 175 },
    { ITEM_STARDUST,     1, 0, 0, 176 },
    { ITEM_STARDUST,     1, 0, 0, 177 },
    { ITEM_RARE_CANDY,   1, 0, 0, 114 },
    { ITEM_IRON,         1, 0, 0, 166 },
    { ITEM_STAR_PIECE,   1, 0, 0, 167 },
    { ITEM_ESCAPE_ROPE,  1, 0, 0, 88  },
    { ITEM_ICE_HEAL,     1, 0, 0, 89  },
    { ITEM_PEARL,        1, 0, 0, 90  },
    { ITEM_PEARL,        1, 0, 0, 91  },
    { ITEM_MAX_REVIVE,   1, 0, 0, 92  },
    { ITEM_RARE_CANDY,   1, 0, 0, 210 },
    { ITEM_ZINC,         1, 0, 0, 223 },
    { ITEM_BIG_PEARL,    1, 0, 0, 180 },
    { ITEM_PEARL,        1, 0, 0, 178 },
    { ITEM_PEARL,        1, 0, 0, 179 },
    { ITEM_REVIVE,       1, 0, 0, 207 },
    { ITEM_MAX_ELIXIR,   1, 0, 0, 208 },
    { ITEM_RARE_CANDY,   1, 0, 0, 115 },
    { ITEM_FULL_RESTORE, 1, 0, 0, 116 },
    { ITEM_DIRE_HIT,     1, 0, 0, 76  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 77  },
    { ITEM_REVIVE,       1, 0, 0, 201 },
    { ITEM_RARE_CANDY,   1, 0, 0, 165 },
    { ITEM_MAX_ETHER,    1, 0, 0, 204 },
    { ITEM_HYPER_POTION, 1, 0, 0, 205 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 202 },
    { ITEM_HYPER_POTION, 1, 0, 0, 203 },
    { ITEM_MAX_POTION,   1, 0, 0, 78  },
    { ITEM_IRON,         1, 0, 0, 222 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 206 },
    { ITEM_HYPER_POTION, 1, 0, 0, 93  },
    { ITEM_RARE_CANDY,   1, 0, 0, 94  },
    { ITEM_REVIVE,       1, 0, 0, 95  },
    { ITEM_ULTRA_BALL,   1, 0, 0, 96  },
    { ITEM_PP_UP,        1, 0, 0, 117 },
    { ITEM_BIG_PEARL,    1, 0, 0, 118 },
    { ITEM_ZINC,         1, 0, 0, 119 },
    { ITEM_FULL_HEAL,    1, 0, 0, 120 },
    { ITEM_PROTEIN,      1, 0, 0, 221 },
    { ITEM_MAX_REVIVE,   1, 0, 0, 121 },
    { ITEM_ULTRA_BALL,   1, 0, 0, 123 },
    { ITEM_NUGGET,       1, 0, 0, 124 },
    { ITEM_DEEPSEATOOTH, 1, 0, 0, 38  },
    { ITEM_DEEPSEASCALE, 1, 0, 0, 229 },
    { ITEM_PP_MAX,       1, 0, 0, 230 },
    // SINNOH_PORT_BEGIN
    { 2, 1, 0, 0, 231 }, // Diamond SC02
    { 78, 1, 0, 0, 232 }, // Diamond SC01
    { 78, 1, 0, 0, 233 }, // Diamond SR202
    { 52, 1, 0, 0, 234 }, // Diamond ST01
    { 396, 1, 0, 0, 235 }, // Diamond SL01
    { 22, 1, 0, 0, 236 }, // Diamond SC03
    { 26, 1, 0, 0, 237 }, // Diamond SD13R0101
    { 46, 1, 0, 0, 238 }, // Diamond SD13R0101
    { 324, 1, 0, 0, 239 }, // Diamond SD13R0101
    { 52, 1, 0, 0, 240 }, // Diamond SD13R0101
    { 249, 1, 0, 0, 241 }, // Diamond SD13R0101
    { 255, 1, 0, 0, 242 }, // Diamond SD13R0101
    { 28, 1, 0, 0, 243 }, // Diamond SD13R0101
    { 380, 1, 0, 0, 244 }, // Diamond SD13R0101
    { 279, 1, 0, 0, 245 }, // Diamond SD13R0101
    { 48, 1, 0, 0, 246 }, // Diamond SD13R0101
    { 109, 1, 0, 0, 247 }, // Diamond SD13R0101
    { 50, 1, 0, 0, 248 }, // Diamond SR205A
    { 365, 1, 0, 0, 249 }, // Diamond SD02
    { 350, 1, 0, 0, 250 }, // Diamond SR205B
    { 17, 1, 0, 0, 251 }, // Diamond SD03R0101
    { 41, 1, 0, 0, 252 }, // Diamond SD25R0102
    { 18, 1, 0, 0, 253 }, // Diamond SC04
    { 350, 1, 0, 0, 254 }, // Diamond SC04
    { 79, 1, 0, 0, 255 }, // Diamond SC04
    { 38, 1, 0, 0, 256 }, // Diamond SC04
    { 4, 1, 0, 0, 257 }, // Diamond SR206
    { 328, 1, 0, 0, 258 }, // Diamond SR206
    { 358, 1, 0, 0, 259 }, // Diamond SD21R0101
    { 90, 1, 0, 0, 260 }, // Diamond SD21R0101
    { 305, 1, 0, 0, 261 }, // Diamond SD21R0101
    { 50, 1, 0, 0, 262 }, // Diamond SD21R0101
    { 40, 1, 0, 0, 263 }, // Diamond SD21R0101
    { 108, 1, 0, 0, 264 }, // Diamond SD21R0101
    { 58, 1, 0, 0, 265 }, // Diamond SD21R0102
    { 4, 1, 0, 0, 266 }, // Diamond SD21R0102
    { 78, 1, 0, 0, 267 }, // Diamond SR207
    { 305, 1, 0, 0, 268 }, // Diamond SR207
    { 72, 1, 0, 0, 269 }, // Diamond SR207
    { 2, 1, 0, 0, 270 }, // Diamond SR207
    { 352, 1, 0, 0, 271 }, // Diamond SD04
    { 107, 1, 0, 0, 272 }, // Diamond SD04
    { 76, 1, 0, 0, 273 }, // Diamond SD04R0101
    { 27, 1, 0, 0, 274 }, // Diamond SD04R0101
    { 79, 1, 0, 0, 275 }, // Diamond SR211A
    { 38, 1, 0, 0, 276 }, // Diamond SR211A
    { 109, 1, 0, 0, 277 }, // Diamond SR211B
    { 17, 1, 0, 0, 278 }, // Diamond SD05R0101
    { 22, 1, 0, 0, 279 }, // Diamond SR208
    { 254, 1, 0, 0, 280 }, // Diamond SR208
    { 45, 1, 0, 0, 281 }, // Diamond SC05
    { 38, 1, 0, 0, 282 }, // Diamond SR209
    { 94, 1, 0, 0, 283 }, // Diamond SR209
    { 54, 1, 0, 0, 284 }, // Diamond SR209
    { 242, 1, 0, 0, 285 }, // Diamond SR209
    { 28, 1, 0, 0, 286 }, // Diamond SR209R0102
    { 407, 1, 0, 0, 287 }, // Diamond SR209R0104
    { 17, 1, 0, 0, 288 }, // Diamond ST04
    { 312, 1, 0, 0, 289 }, // Diamond SD07R0104
    { 417, 1, 0, 0, 290 }, // Diamond SD07R0112
    { 17, 1, 0, 0, 291 }, // Diamond SD07R0119
    { 373, 1, 0, 0, 292 }, // Diamond SR210A
    { 39, 1, 0, 0, 293 }, // Diamond SR210A
    { 45, 1, 0, 0, 294 }, // Diamond SR210A
    { 24, 1, 0, 0, 295 }, // Diamond SR210A
    { 326, 1, 0, 0, 296 }, // Diamond SR210A
    { 245, 1, 0, 0, 297 }, // Diamond SR210B
    { 222, 1, 0, 0, 298 }, // Diamond SR210B
    { 52, 1, 0, 0, 299 }, // Diamond SR215
    { 376, 1, 0, 0, 300 }, // Diamond SR215
    { 348, 1, 0, 0, 301 }, // Diamond SR215
    { 26, 1, 0, 0, 302 }, // Diamond SC07
    { 51, 1, 0, 0, 303 }, // Diamond SC07
    { 411, 1, 0, 0, 304 }, // Diamond SD26R0101
    { 389, 1, 0, 0, 305 }, // Diamond SD26R0102
    { 52, 1, 0, 0, 306 }, // Diamond SD26R0102
    { 333, 1, 0, 0, 307 }, // Diamond SD26R0103
    { 61, 1, 0, 0, 308 }, // Diamond SD26R0103
    { 28, 1, 0, 0, 309 }, // Diamond SD26R0103
    { 76, 1, 0, 0, 310 }, // Diamond SD26R0104
    { 409, 1, 0, 0, 311 }, // Diamond SR214
    { 339, 1, 0, 0, 312 }, // Diamond SR214
    { 28, 1, 0, 0, 313 }, // Diamond SR214
    { 3, 1, 0, 0, 314 }, // Diamond SL02
    { 397, 1, 0, 0, 315 }, // Diamond SL02
    { 23, 1, 0, 0, 316 }, // Diamond SL02
    { 363, 1, 0, 0, 317 }, // Diamond SL02
    { 22, 1, 0, 0, 318 }, // Diamond SR213
    { 18, 1, 0, 0, 319 }, // Diamond SR213
    { 26, 1, 0, 0, 320 }, // Diamond SR213
    { 24, 1, 0, 0, 321 }, // Diamond SR213
    { 269, 1, 0, 0, 322 }, // Diamond SR213
    { 90, 1, 0, 0, 323 }, // Diamond SR213
    { 23, 1, 0, 0, 324 }, // Diamond SR213
    { 29, 1, 0, 0, 325 }, // Diamond SR213
    { 40, 1, 0, 0, 326 }, // Diamond SR213
    { 440, 1, 0, 0, 327 }, // Diamond SR213
    { 45, 1, 0, 0, 328 }, // Diamond SR213
    { 427, 1, 0, 0, 329 }, // Diamond SR213R0601
    { 79, 1, 0, 0, 330 }, // Diamond SC06
    { 1, 1, 0, 0, 331 }, // Diamond SD06R0201
    { 89, 1, 0, 0, 332 }, // Diamond SD06R0201
    { 1, 1, 0, 0, 333 }, // Diamond SD06R0202
    { 326, 1, 0, 0, 334 }, // Diamond SD06R0202
    { 1, 1, 0, 0, 335 }, // Diamond SD06R0203
    { 50, 1, 0, 0, 336 }, // Diamond SD06R0203
    { 1, 1, 0, 0, 337 }, // Diamond SD06R0204
    { 280, 1, 0, 0, 338 }, // Diamond SD06R0204
    { 1, 1, 0, 0, 339 }, // Diamond SD06R0205
    { 234, 1, 0, 0, 340 }, // Diamond SD06R0205
    { 1, 1, 0, 0, 341 }, // Diamond SD06R0206
    { 327, 1, 0, 0, 342 }, // Diamond SD06R0206
    { 319, 1, 0, 0, 343 }, // Diamond SR212A
    { 366, 1, 0, 0, 344 }, // Diamond SR212A
    { 330, 1, 0, 0, 345 }, // Diamond SR212B
    { 57, 1, 0, 0, 346 }, // Diamond SR212B
    { 4, 1, 0, 0, 347 }, // Diamond SR212B
    { 336, 1, 0, 0, 348 }, // Diamond SR212B
    { 17, 1, 0, 0, 349 }, // Diamond SR212B
    { 351, 1, 0, 0, 350 }, // Diamond SR212B
    { 21, 1, 0, 0, 351 }, // Diamond SR212B
    { 18, 1, 0, 0, 352 }, // Diamond SR212B
    { 237, 1, 0, 0, 353 }, // Diamond SR212AR0102
    { 3, 1, 0, 0, 354 }, // Diamond SD05R0102
    { 17, 1, 0, 0, 355 }, // Diamond SD05R0102
    { 26, 1, 0, 0, 356 }, // Diamond SD05R0103
    { 94, 1, 0, 0, 357 }, // Diamond SD05R0105
    { 29, 1, 0, 0, 358 }, // Diamond SD05R0105
    { 332, 1, 0, 0, 359 }, // Diamond SD05R0105
    { 367, 1, 0, 0, 360 }, // Diamond SD05R0105
    { 354, 1, 0, 0, 361 }, // Diamond SD05R0110
    { 110, 1, 0, 0, 362 }, // Diamond SD05R0110
    { 28, 1, 0, 0, 363 }, // Diamond SD05R0110
    { 314, 1, 0, 0, 364 }, // Diamond SD05R0110
    { 307, 1, 0, 0, 365 }, // Diamond SD05R0110
    { 92, 1, 0, 0, 366 }, // Diamond SD05R0110
    { 370, 1, 0, 0, 367 }, // Diamond SD05R0112
    { 310, 1, 0, 0, 368 }, // Diamond SD05R0112
    { 372, 1, 0, 0, 369 }, // Diamond SD05R0112
    { 59, 1, 0, 0, 370 }, // Diamond SD05R0112
    { 4, 1, 0, 0, 371 }, // Diamond SD05R0112
    { 48, 1, 0, 0, 372 }, // Diamond SD05R0111
    { 94, 1, 0, 0, 373 }, // Diamond SD05R0104
    { 29, 1, 0, 0, 374 }, // Diamond SD05R0104
    { 4, 1, 0, 0, 375 }, // Diamond SD05R0104
    { 18, 1, 0, 0, 376 }, // Diamond SD05R0104
    { 243, 1, 0, 0, 377 }, // Diamond SD05R0104
    { 84, 1, 0, 0, 378 }, // Diamond SD05R0106
    { 51, 1, 0, 0, 379 }, // Diamond SD05R0106
    { 46, 1, 0, 0, 380 }, // Diamond SD05R0106
    { 94, 1, 0, 0, 381 }, // Diamond SD05R0106
    { 22, 1, 0, 0, 382 }, // Diamond SD05R0106
    { 412, 1, 0, 0, 383 }, // Diamond SD05R0106
    { 60, 1, 0, 0, 384 }, // Diamond SD05R0106
    { 49, 1, 0, 0, 385 }, // Diamond SD05R0107
    { 346, 1, 0, 0, 386 }, // Diamond SD05R0108
    { 374, 1, 0, 0, 387 }, // Diamond SD05R0108
    { 414, 1, 0, 0, 388 }, // Diamond SR216
    { 3, 1, 0, 0, 389 }, // Diamond SR217
    { 18, 1, 0, 0, 390 }, // Diamond SR217
    { 94, 1, 0, 0, 391 }, // Diamond SR217
    { 83, 1, 0, 0, 392 }, // Diamond SR217
    { 88, 1, 0, 0, 393 }, // Diamond SR217
    { 88, 1, 0, 0, 394 }, // Diamond SR217
    { 345, 1, 0, 0, 395 }, // Diamond SR217
    { 368, 1, 0, 0, 396 }, // Diamond SR217
    { 27, 1, 0, 0, 397 }, // Diamond SR217
    { 50, 1, 0, 0, 398 }, // Diamond SR217
    { 49, 1, 0, 0, 399 }, // Diamond SC09
    { 246, 1, 0, 0, 400 }, // Diamond SD20R0104
    { 50, 1, 0, 0, 401 }, // Diamond SR222
    { 397, 1, 0, 0, 402 }, // Diamond SR222
    { 239, 1, 0, 0, 403 }, // Diamond SR222
    { 85, 1, 0, 0, 404 }, // Diamond SR222
    { 76, 1, 0, 0, 405 }, // Diamond SC08
    { 3, 1, 0, 0, 406 }, // Diamond SC08
    { 2, 1, 0, 0, 407 }, // Diamond SW223
    { 303, 1, 0, 0, 408 }, // Diamond SD09R0101
    { 55, 1, 0, 0, 409 }, // Diamond SD09R0101
    { 25, 1, 0, 0, 410 }, // Diamond SD09R0101
    { 38, 1, 0, 0, 411 }, // Diamond SD09R0102
    { 27, 1, 0, 0, 412 }, // Diamond SD09R0102
    { 421, 1, 0, 0, 413 }, // Diamond SD09R0104
    { 108, 1, 0, 0, 414 }, // Diamond SD09R0104
    { 463, 1, 0, 0, 415 }, // Diamond SD09R0104
    { 228, 1, 0, 0, 416 }, // Diamond SD09R0104
    { 355, 1, 0, 0, 417 }, // Diamond SD09R0104
    { 51, 1, 0, 0, 418 }, // Diamond SC10
    { 340, 1, 0, 0, 419 }, // Diamond SR219
    { 19, 1, 0, 0, 420 }, // Diamond SW220
    { 340, 1, 0, 0, 421 }, // Diamond SW220
    { 50, 1, 0, 0, 422 }, // Diamond SR221
    { 359, 1, 0, 0, 423 }, // Diamond SR221
    { 78, 1, 0, 0, 424 }, // Diamond SR221
    { 329, 1, 0, 0, 425 }, // Diamond SR221
    { 48, 1, 0, 0, 426 }, // Diamond SR221
    { 78, 1, 0, 0, 427 }, // Diamond SD24
    { 353, 1, 0, 0, 428 }, // Diamond SD24R0103
    { 39, 1, 0, 0, 429 }, // Diamond SD24R0104
    { 56, 1, 0, 0, 430 }, // Diamond SD24R0105
    { 28, 1, 0, 0, 431 }, // Diamond SD24R0105
    { 286, 1, 0, 0, 432 }, // Diamond SD24R0105
    { 361, 1, 0, 0, 433 }, // Diamond SD09R0103
    { 316, 1, 0, 0, 434 }, // Diamond SD09R0103
    { 40, 1, 0, 0, 435 }, // Diamond SD05R0113
    { 318, 1, 0, 0, 436 }, // Diamond SD05R0113
    { 338, 1, 0, 0, 437 }, // Diamond SD05R0113
    { 223, 1, 0, 0, 438 }, // Diamond SD05R0113
    { 296, 1, 0, 0, 439 }, // Diamond SR224
    { 24, 1, 0, 0, 440 }, // Diamond SR224
    { 62, 1, 0, 0, 441 }, // Diamond SR224
    { 50, 1, 0, 0, 442 }, // Diamond SR224
    { 219, 1, 0, 0, 443 }, // Diamond SR224
    { 20, 1, 0, 0, 444 }, // Diamond SR224
    { 45, 1, 0, 0, 445 }, // Diamond SR224
    { 317, 1, 0, 0, 446 }, // Diamond SR225
    { 334, 1, 0, 0, 447 }, // Diamond SR225
    { 39, 1, 0, 0, 448 }, // Diamond SR225
    { 23, 1, 0, 0, 449 }, // Diamond SR225
    { 357, 1, 0, 0, 450 }, // Diamond ST06
    { 82, 1, 0, 0, 451 }, // Diamond SW226
    { 362, 1, 0, 0, 452 }, // Diamond SW226
    { 19, 1, 0, 0, 453 }, // Diamond SW226
    { 315, 1, 0, 0, 454 }, // Diamond SW226
    { 356, 1, 0, 0, 455 }, // Diamond SW226
    { 299, 1, 0, 0, 456 }, // Diamond SR227
    { 48, 1, 0, 0, 457 }, // Diamond SR227
    { 356, 1, 0, 0, 458 }, // Diamond SR227
    { 38, 1, 0, 0, 459 }, // Diamond SD16R0101
    { 46, 1, 0, 0, 460 }, // Diamond SD16R0102
    { 408, 1, 0, 0, 461 }, // Diamond SD16R0102
    { 94, 1, 0, 0, 462 }, // Diamond SD16R0102
    { 47, 1, 0, 0, 463 }, // Diamond SD16R0102
    { 2, 1, 0, 0, 464 }, // Diamond SD16R0102
    { 341, 1, 0, 0, 465 }, // Diamond SD16R0102
    { 320, 1, 0, 0, 466 }, // Diamond SR228
    { 94, 1, 0, 0, 467 }, // Diamond SR228
    { 50, 1, 0, 0, 468 }, // Diamond SR228
    { 406, 1, 0, 0, 469 }, // Diamond SR228
    { 398, 1, 0, 0, 470 }, // Diamond SR228
    { 386, 1, 0, 0, 471 }, // Diamond SR228
    { 416, 1, 0, 0, 472 }, // Diamond SR229
    { 278, 1, 0, 0, 473 }, // Diamond ST07
    { 416, 1, 0, 0, 474 }, // Diamond ST07
    { 78, 1, 0, 0, 475 }, // Diamond SW230
    { 76, 1, 0, 0, 476 }, // Diamond SW230
    // SINNOH_PORT_END
};
#endif //_IN_FIELDMAP_C
