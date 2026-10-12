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
    { 88, 1, 1, 0, 231 }, // Diamond SC02
    { 22, 1, 1, 0, 232 }, // Diamond SC01
    { 22, 1, 1, 0, 233 }, // Diamond SR202
    { 111, 1, 0, 0, 234 }, // Diamond ST01
    { 17, 1, 1, 0, 235 }, // Diamond SL01
    { 90, 1, 1, 0, 236 }, // Diamond SC03
    { 94, 1, 1, 0, 237 }, // Diamond SD13R0101
    { 94, 1, 1, 0, 238 }, // Diamond SD13R0101
    { 27, 1, 1, 0, 239 }, // Diamond SD13R0101
    { 28, 1, 1, 0, 240 }, // Diamond SD13R0101
    { 24, 1, 1, 0, 241 }, // Diamond SD13R0101
    { 25, 1, 1, 0, 242 }, // Diamond SD13R0101
    { 18, 1, 1, 0, 243 }, // Diamond SD13R0101
    { 26, 1, 1, 0, 244 }, // Diamond SD13R0101
    { 22, 1, 1, 0, 245 }, // Diamond SD13R0101
    { 17, 1, 1, 0, 246 }, // Diamond SD13R0101
    { 28, 1, 1, 0, 247 }, // Diamond SD13R0101
    { 18, 1, 1, 0, 248 }, // Diamond SR205A
    { 41, 1, 1, 0, 249 }, // Diamond SD02
    { 94, 1, 1, 0, 250 }, // Diamond SR205B
    { 308, 1, 1, 0, 251 }, // Diamond SD03R0101
    { 18, 1, 1, 0, 252 }, // Diamond SD25R0102
    { 311, 1, 1, 0, 253 }, // Diamond SC04
    { 94, 1, 1, 0, 254 }, // Diamond SC04
    { 4, 1, 1, 0, 255 }, // Diamond SC04
    { 51, 1, 1, 0, 256 }, // Diamond SC04
    { 40, 1, 2, 0, 257 }, // Diamond SR206
    { 17, 1, 2, 0, 258 }, // Diamond SR206
    { 92, 1, 2, 0, 259 }, // Diamond SD21R0101
    { 19, 1, 2, 0, 260 }, // Diamond SD21R0101
    { 26, 1, 2, 0, 261 }, // Diamond SD21R0101
    { 17, 1, 2, 0, 262 }, // Diamond SD21R0101
    { 17, 1, 2, 0, 263 }, // Diamond SD21R0101
    { 86, 1, 2, 0, 264 }, // Diamond SD21R0101
    { 28, 1, 1, 0, 265 }, // Diamond SD21R0102
    { 90, 1, 1, 0, 266 }, // Diamond SD21R0102
    { 50, 1, 2, 0, 267 }, // Diamond SR207
    { 26, 1, 2, 0, 268 }, // Diamond SR207
    { 4, 1, 2, 0, 269 }, // Diamond SR207
    { 28, 1, 2, 0, 270 }, // Diamond SR207
    { 2, 1, 1, 0, 271 }, // Diamond SD04
    { 24, 1, 1, 0, 272 }, // Diamond SD04
    { 25, 1, 1, 0, 273 }, // Diamond SD04R0101
    { 27, 1, 1, 0, 274 }, // Diamond SD04R0101
    { 4, 1, 1, 0, 275 }, // Diamond SR211A
    { 51, 1, 1, 0, 276 }, // Diamond SR211A
    { 52, 1, 1, 0, 277 }, // Diamond SR211B
    { 38, 1, 1, 0, 278 }, // Diamond SD05R0101
    { 47, 1, 1, 0, 279 }, // Diamond SR208
    { 94, 1, 2, 0, 280 }, // Diamond SR208
    { 86, 1, 1, 0, 281 }, // Diamond SC05
    { 86, 1, 1, 0, 282 }, // Diamond SR209
    { 21, 1, 1, 0, 283 }, // Diamond SR209
    { 26, 1, 1, 0, 284 }, // Diamond SR209
    { 28, 1, 1, 0, 285 }, // Diamond SR209
    { 90, 1, 1, 0, 286 }, // Diamond SR209R0102
    { 3, 1, 1, 0, 287 }, // Diamond SR209R0104
    { 94, 1, 1, 0, 288 }, // Diamond ST04
    { 79, 1, 1, 0, 289 }, // Diamond SD07R0104
    { 78, 1, 1, 0, 290 }, // Diamond SD07R0112
    { 87, 1, 1, 0, 291 }, // Diamond SD07R0119
    { 38, 1, 1, 0, 292 }, // Diamond SR210A
    { 27, 1, 1, 0, 293 }, // Diamond SR210A
    { 3, 1, 1, 0, 294 }, // Diamond SR210A
    { 25, 1, 1, 0, 295 }, // Diamond SR210A
    { 19, 1, 1, 0, 296 }, // Diamond SR210A
    { 92, 1, 1, 0, 297 }, // Diamond SR210B
    { 301, 1, 1, 0, 298 }, // Diamond SR210B
    { 94, 1, 1, 0, 299 }, // Diamond SR215
    { 25, 1, 1, 0, 300 }, // Diamond SR215
    { 52, 1, 1, 0, 301 }, // Diamond SR215
    { 86, 1, 1, 0, 302 }, // Diamond SC07
    { 28, 1, 1, 0, 303 }, // Diamond SC07
    { 51, 1, 1, 0, 304 }, // Diamond SD26R0101
    { 2, 1, 1, 0, 305 }, // Diamond SD26R0102
    { 27, 1, 1, 0, 306 }, // Diamond SD26R0102
    { 50, 1, 1, 0, 307 }, // Diamond SD26R0103
    { 40, 1, 1, 0, 308 }, // Diamond SD26R0103
    { 23, 1, 1, 0, 309 }, // Diamond SD26R0103
    { 92, 1, 1, 0, 310 }, // Diamond SD26R0104
    { 93, 1, 1, 0, 311 }, // Diamond SR214
    { 94, 1, 1, 0, 312 }, // Diamond SR214
    { 86, 1, 1, 0, 313 }, // Diamond SR214
    { 50, 1, 1, 0, 314 }, // Diamond SL02
    { 23, 1, 1, 0, 315 }, // Diamond SL02
    { 25, 1, 1, 0, 316 }, // Diamond SL02
    { 39, 1, 1, 0, 317 }, // Diamond SL02
    { 29, 1, 1, 0, 318 }, // Diamond SR213
    { 89, 1, 1, 0, 319 }, // Diamond SR213
    { 88, 1, 1, 0, 320 }, // Diamond SR213
    { 21, 1, 1, 0, 321 }, // Diamond SR213
    { 88, 1, 1, 0, 322 }, // Diamond SR213
    { 88, 1, 1, 0, 323 }, // Diamond SR213
    { 25, 1, 1, 0, 324 }, // Diamond SR213
    { 3, 1, 1, 0, 325 }, // Diamond SR213
    { 49, 1, 1, 0, 326 }, // Diamond SR213
    { 26, 1, 1, 0, 327 }, // Diamond SR213
    { 451, 1, 0, 0, 328 }, // Diamond SR213
    { 29, 1, 1, 0, 329 }, // Diamond SR213R0601
    { 27, 1, 1, 0, 330 }, // Diamond SC06
    { 50, 1, 1, 0, 331 }, // Diamond SD06R0201
    { 304, 1, 1, 0, 332 }, // Diamond SD06R0202
    { 2, 1, 1, 0, 333 }, // Diamond SD06R0203
    { 92, 1, 1, 0, 334 }, // Diamond SD06R0204
    { 27, 1, 1, 0, 335 }, // Diamond SD06R0205
    { 25, 1, 1, 0, 336 }, // Diamond SD06R0206
    { 3, 1, 1, 0, 337 }, // Diamond SR212A
    { 26, 1, 1, 0, 338 }, // Diamond SR212A
    { 46, 1, 1, 0, 339 }, // Diamond SR212B
    { 50, 1, 1, 0, 340 }, // Diamond SR212B
    { 3, 1, 1, 0, 341 }, // Diamond SR212B
    { 28, 1, 1, 0, 342 }, // Diamond SR212B
    { 25, 1, 1, 0, 343 }, // Diamond SR212B
    { 93, 1, 1, 0, 344 }, // Diamond SR212B
    { 38, 1, 1, 0, 345 }, // Diamond SR212B
    { 86, 1, 1, 0, 346 }, // Diamond SR212B
    { 19, 1, 1, 0, 347 }, // Diamond SR212AR0102
    { 29, 1, 1, 0, 348 }, // Diamond SD05R0102
    { 38, 1, 1, 0, 349 }, // Diamond SD05R0102
    { 76, 1, 1, 0, 350 }, // Diamond SD05R0103
    { 90, 1, 1, 0, 351 }, // Diamond SD05R0105
    { 92, 1, 1, 0, 352 }, // Diamond SD05R0105
    { 24, 1, 1, 0, 353 }, // Diamond SD05R0105
    { 27, 1, 1, 0, 354 }, // Diamond SD05R0105
    { 23, 1, 1, 0, 355 }, // Diamond SD05R0110
    { 92, 1, 1, 0, 356 }, // Diamond SD05R0110
    { 50, 1, 1, 0, 357 }, // Diamond SD05R0110
    { 28, 1, 1, 0, 358 }, // Diamond SD05R0110
    { 39, 1, 1, 0, 359 }, // Diamond SD05R0110
    { 87, 1, 1, 0, 360 }, // Diamond SD05R0110
    { 86, 1, 1, 0, 361 }, // Diamond SD05R0112
    { 86, 1, 1, 0, 362 }, // Diamond SD05R0112
    { 40, 1, 1, 0, 363 }, // Diamond SD05R0112
    { 28, 1, 1, 0, 364 }, // Diamond SD05R0112
    { 25, 1, 1, 0, 365 }, // Diamond SD05R0112
    { 45, 1, 1, 0, 366 }, // Diamond SD05R0111
    { 90, 1, 1, 0, 367 }, // Diamond SD05R0104
    { 92, 1, 1, 0, 368 }, // Diamond SD05R0104
    { 87, 1, 1, 0, 369 }, // Diamond SD05R0104
    { 86, 1, 1, 0, 370 }, // Diamond SD05R0104
    { 50, 1, 1, 0, 371 }, // Diamond SD05R0104
    { 28, 1, 1, 0, 372 }, // Diamond SD05R0106
    { 38, 1, 1, 0, 373 }, // Diamond SD05R0106
    { 78, 1, 1, 0, 374 }, // Diamond SD05R0106
    { 86, 1, 1, 0, 375 }, // Diamond SD05R0106
    { 51, 1, 1, 0, 376 }, // Diamond SD05R0106
    { 2, 1, 1, 0, 377 }, // Diamond SD05R0106
    { 309, 1, 1, 0, 378 }, // Diamond SD05R0106
    { 86, 1, 1, 0, 379 }, // Diamond SD05R0107
    { 24, 1, 1, 0, 380 }, // Diamond SD05R0108
    { 90, 1, 1, 0, 381 }, // Diamond SD05R0108
    { 27, 1, 1, 0, 382 }, // Diamond SR216
    { 49, 1, 1, 0, 383 }, // Diamond SR217
    { 29, 1, 1, 0, 384 }, // Diamond SR217
    { 2, 1, 1, 0, 385 }, // Diamond SR217
    { 51, 1, 1, 0, 386 }, // Diamond SR217
    { 77, 1, 1, 0, 387 }, // Diamond SR217
    { 2, 1, 1, 0, 388 }, // Diamond SR217
    { 46, 1, 1, 0, 389 }, // Diamond SR217
    { 24, 1, 1, 0, 390 }, // Diamond SR217
    { 27, 1, 1, 0, 391 }, // Diamond SR217
    { 92, 1, 1, 0, 392 }, // Diamond SR217
    { 25, 1, 1, 0, 393 }, // Diamond SC09
    { 23, 1, 1, 0, 394 }, // Diamond SD20R0104
    { 87, 1, 1, 0, 395 }, // Diamond SR222
    { 23, 1, 1, 0, 396 }, // Diamond SR222
    { 94, 1, 1, 0, 397 }, // Diamond SR222
    { 2, 1, 1, 0, 398 }, // Diamond SR222
    { 88, 1, 1, 0, 399 }, // Diamond SC08
    { 300, 1, 1, 0, 400 }, // Diamond SC08
    { 89, 1, 1, 0, 401 }, // Diamond SW223
    { 2, 1, 1, 0, 402 }, // Diamond SD09R0101
    { 29, 1, 1, 0, 403 }, // Diamond SD09R0101
    { 41, 1, 1, 0, 404 }, // Diamond SD09R0101
    { 23, 1, 1, 0, 405 }, // Diamond SD09R0102
    { 50, 1, 1, 0, 406 }, // Diamond SD09R0102
    { 29, 1, 1, 0, 407 }, // Diamond SD09R0104
    { 87, 1, 1, 0, 408 }, // Diamond SD09R0104
    { 23, 1, 1, 0, 409 }, // Diamond SD09R0104
    { 50, 1, 1, 0, 410 }, // Diamond SD09R0104
    { 92, 1, 1, 0, 411 }, // Diamond SD09R0104
    { 306, 1, 1, 0, 412 }, // Diamond SC10
    { 26, 1, 1, 0, 413 }, // Diamond SR219
    { 88, 1, 1, 0, 414 }, // Diamond SW220
    { 26, 1, 1, 0, 415 }, // Diamond SW220
    { 94, 1, 1, 0, 416 }, // Diamond SR221
    { 86, 1, 1, 0, 417 }, // Diamond SR221
    { 2, 1, 1, 0, 418 }, // Diamond SR221
    { 48, 1, 1, 0, 419 }, // Diamond SR221
    { 29, 1, 0, 0, 420 }, // Diamond SR221
    { 39, 1, 1, 0, 421 }, // Diamond SD24
    { 86, 1, 1, 0, 422 }, // Diamond SD24R0103
    { 47, 1, 1, 0, 423 }, // Diamond SD24R0104
    { 313, 1, 1, 0, 424 }, // Diamond SD24R0105
    { 23, 1, 1, 0, 425 }, // Diamond SD24R0105
    { 28, 1, 1, 0, 426 }, // Diamond SD24R0105
    { 88, 1, 1, 0, 427 }, // Diamond SD09R0103
    { 87, 1, 1, 0, 428 }, // Diamond SD09R0103
    { 2, 1, 1, 0, 429 }, // Diamond SD05R0113
    { 50, 1, 1, 0, 430 }, // Diamond SD05R0113
    { 51, 1, 1, 0, 431 }, // Diamond SD05R0113
    { 92, 1, 1, 0, 432 }, // Diamond SD05R0113
    { 53, 1, 0, 0, 433 }, // Diamond SR224
    { 90, 1, 1, 0, 434 }, // Diamond SR224
    { 90, 1, 1, 0, 435 }, // Diamond SR224
    { 90, 1, 1, 0, 436 }, // Diamond SR224
    { 88, 1, 1, 0, 437 }, // Diamond SR224
    { 88, 1, 1, 0, 438 }, // Diamond SR224
    { 89, 1, 1, 0, 439 }, // Diamond SR224
    { 2, 1, 1, 0, 440 }, // Diamond SR225
    { 25, 1, 1, 0, 441 }, // Diamond SR225
    { 50, 1, 1, 0, 442 }, // Diamond SR225
    { 77, 1, 1, 0, 443 }, // Diamond SR225
    { 29, 1, 1, 0, 444 }, // Diamond ST06
    { 89, 1, 1, 0, 445 }, // Diamond SW226
    { 87, 1, 0, 0, 446 }, // Diamond SW226
    { 86, 1, 0, 0, 447 }, // Diamond SW226
    { 86, 1, 0, 0, 448 }, // Diamond SW226
    { 51, 1, 1, 0, 449 }, // Diamond SW226
    { 46, 1, 1, 0, 450 }, // Diamond SR227
    { 27, 1, 1, 0, 451 }, // Diamond SR227
    { 51, 1, 1, 0, 452 }, // Diamond SR227
    { 41, 1, 1, 0, 453 }, // Diamond SD16R0101
    { 52, 1, 1, 0, 454 }, // Diamond SD16R0102
    { 47, 1, 1, 0, 455 }, // Diamond SD16R0102
    { 298, 1, 1, 0, 456 }, // Diamond SD16R0102
    { 25, 1, 1, 0, 457 }, // Diamond SD16R0102
    { 28, 1, 1, 0, 458 }, // Diamond SD16R0102
    { 27, 1, 1, 0, 459 }, // Diamond SD16R0102
    { 49, 1, 1, 0, 460 }, // Diamond SR228
    { 90, 1, 1, 0, 461 }, // Diamond SR228
    { 2, 1, 1, 0, 462 }, // Diamond SR228
    { 50, 1, 1, 0, 463 }, // Diamond SR228
    { 51, 1, 1, 0, 464 }, // Diamond SR228
    { 23, 1, 1, 0, 465 }, // Diamond SR228
    { 87, 1, 1, 0, 466 }, // Diamond SR229
    { 92, 1, 1, 0, 467 }, // Diamond ST07
    { 87, 1, 1, 0, 468 }, // Diamond ST07
    { 48, 1, 1, 0, 469 }, // Diamond SW230
    { 45, 1, 1, 0, 470 }, // Diamond SW230
    // SINNOH_PORT_END
};
#endif //_IN_FIELDMAP_C
