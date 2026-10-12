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
    { 2, 1, 0, 0, 231 }, // Diamond C02
    { 78, 1, 0, 0, 232 }, // Diamond C01
    { 78, 1, 0, 0, 233 }, // Diamond R202
    { 52, 1, 0, 0, 234 }, // Diamond T01
    { 396, 1, 0, 0, 235 }, // Diamond L01
    { 22, 1, 0, 0, 236 }, // Diamond C03
    { 26, 1, 0, 0, 237 }, // Diamond D13R0101
    { 46, 1, 0, 0, 238 }, // Diamond D13R0101
    { 324, 1, 0, 0, 239 }, // Diamond D13R0101
    { 52, 1, 0, 0, 240 }, // Diamond D13R0101
    { 249, 1, 0, 0, 241 }, // Diamond D13R0101
    { 255, 1, 0, 0, 242 }, // Diamond D13R0101
    { 28, 1, 0, 0, 243 }, // Diamond D13R0101
    { 380, 1, 0, 0, 244 }, // Diamond D13R0101
    { 279, 1, 0, 0, 245 }, // Diamond D13R0101
    { 48, 1, 0, 0, 246 }, // Diamond D13R0101
    { 109, 1, 0, 0, 247 }, // Diamond D13R0101
    { 50, 1, 0, 0, 248 }, // Diamond R205A
    { 365, 1, 0, 0, 249 }, // Diamond D02
    { 350, 1, 0, 0, 250 }, // Diamond R205B
    { 17, 1, 0, 0, 251 }, // Diamond D03R0101
    { 41, 1, 0, 0, 252 }, // Diamond D25R0102
    { 18, 1, 0, 0, 253 }, // Diamond C04
    { 350, 1, 0, 0, 254 }, // Diamond C04
    { 79, 1, 0, 0, 255 }, // Diamond C04
    { 38, 1, 0, 0, 256 }, // Diamond C04
    { 4, 1, 0, 0, 257 }, // Diamond R206
    { 328, 1, 0, 0, 258 }, // Diamond R206
    { 358, 1, 0, 0, 259 }, // Diamond D21R0101
    { 90, 1, 0, 0, 260 }, // Diamond D21R0101
    { 305, 1, 0, 0, 261 }, // Diamond D21R0101
    { 50, 1, 0, 0, 262 }, // Diamond D21R0101
    { 40, 1, 0, 0, 263 }, // Diamond D21R0101
    { 108, 1, 0, 0, 264 }, // Diamond D21R0101
    { 58, 1, 0, 0, 265 }, // Diamond D21R0102
    { 4, 1, 0, 0, 266 }, // Diamond D21R0102
    { 78, 1, 0, 0, 267 }, // Diamond R207
    { 305, 1, 0, 0, 268 }, // Diamond R207
    { 72, 1, 0, 0, 269 }, // Diamond R207
    { 2, 1, 0, 0, 270 }, // Diamond R207
    { 352, 1, 0, 0, 271 }, // Diamond D04
    { 107, 1, 0, 0, 272 }, // Diamond D04
    { 76, 1, 0, 0, 273 }, // Diamond D04R0101
    { 27, 1, 0, 0, 274 }, // Diamond D04R0101
    { 79, 1, 0, 0, 275 }, // Diamond R211A
    { 38, 1, 0, 0, 276 }, // Diamond R211A
    { 109, 1, 0, 0, 277 }, // Diamond R211B
    { 17, 1, 0, 0, 278 }, // Diamond D05R0101
    { 22, 1, 0, 0, 279 }, // Diamond R208
    { 254, 1, 0, 0, 280 }, // Diamond R208
    { 45, 1, 0, 0, 281 }, // Diamond C05
    { 38, 1, 0, 0, 282 }, // Diamond R209
    { 94, 1, 0, 0, 283 }, // Diamond R209
    { 54, 1, 0, 0, 284 }, // Diamond R209
    { 242, 1, 0, 0, 285 }, // Diamond R209
    { 28, 1, 0, 0, 286 }, // Diamond R209R0102
    { 407, 1, 0, 0, 287 }, // Diamond R209R0104
    { 17, 1, 0, 0, 288 }, // Diamond T04
    { 312, 1, 0, 0, 289 }, // Diamond D07R0104
    { 417, 1, 0, 0, 290 }, // Diamond D07R0112
    { 17, 1, 0, 0, 291 }, // Diamond D07R0119
    { 373, 1, 0, 0, 292 }, // Diamond R210A
    { 39, 1, 0, 0, 293 }, // Diamond R210A
    { 45, 1, 0, 0, 294 }, // Diamond R210A
    { 24, 1, 0, 0, 295 }, // Diamond R210A
    { 326, 1, 0, 0, 296 }, // Diamond R210A
    { 245, 1, 0, 0, 297 }, // Diamond R210B
    { 222, 1, 0, 0, 298 }, // Diamond R210B
    { 52, 1, 0, 0, 299 }, // Diamond R215
    { 376, 1, 0, 0, 300 }, // Diamond R215
    { 348, 1, 0, 0, 301 }, // Diamond R215
    { 26, 1, 0, 0, 302 }, // Diamond C07
    { 51, 1, 0, 0, 303 }, // Diamond C07
    { 411, 1, 0, 0, 304 }, // Diamond D26R0101
    { 389, 1, 0, 0, 305 }, // Diamond D26R0102
    { 52, 1, 0, 0, 306 }, // Diamond D26R0102
    { 333, 1, 0, 0, 307 }, // Diamond D26R0103
    { 61, 1, 0, 0, 308 }, // Diamond D26R0103
    { 28, 1, 0, 0, 309 }, // Diamond D26R0103
    { 76, 1, 0, 0, 310 }, // Diamond D26R0104
    { 409, 1, 0, 0, 311 }, // Diamond R214
    { 339, 1, 0, 0, 312 }, // Diamond R214
    { 28, 1, 0, 0, 313 }, // Diamond R214
    { 3, 1, 0, 0, 314 }, // Diamond L02
    { 397, 1, 0, 0, 315 }, // Diamond L02
    { 23, 1, 0, 0, 316 }, // Diamond L02
    { 363, 1, 0, 0, 317 }, // Diamond L02
    { 22, 1, 0, 0, 318 }, // Diamond R213
    { 18, 1, 0, 0, 319 }, // Diamond R213
    { 26, 1, 0, 0, 320 }, // Diamond R213
    { 24, 1, 0, 0, 321 }, // Diamond R213
    { 269, 1, 0, 0, 322 }, // Diamond R213
    { 90, 1, 0, 0, 323 }, // Diamond R213
    { 23, 1, 0, 0, 324 }, // Diamond R213
    { 29, 1, 0, 0, 325 }, // Diamond R213
    { 40, 1, 0, 0, 326 }, // Diamond R213
    { 440, 1, 0, 0, 327 }, // Diamond R213
    { 45, 1, 0, 0, 328 }, // Diamond R213
    { 427, 1, 0, 0, 329 }, // Diamond R213R0601
    { 79, 1, 0, 0, 330 }, // Diamond C06
    { 1, 1, 0, 0, 331 }, // Diamond D06R0201
    { 89, 1, 0, 0, 332 }, // Diamond D06R0201
    { 1, 1, 0, 0, 333 }, // Diamond D06R0202
    { 326, 1, 0, 0, 334 }, // Diamond D06R0202
    { 1, 1, 0, 0, 335 }, // Diamond D06R0203
    { 50, 1, 0, 0, 336 }, // Diamond D06R0203
    { 1, 1, 0, 0, 337 }, // Diamond D06R0204
    { 280, 1, 0, 0, 338 }, // Diamond D06R0204
    { 1, 1, 0, 0, 339 }, // Diamond D06R0205
    { 234, 1, 0, 0, 340 }, // Diamond D06R0205
    { 1, 1, 0, 0, 341 }, // Diamond D06R0206
    { 327, 1, 0, 0, 342 }, // Diamond D06R0206
    { 319, 1, 0, 0, 343 }, // Diamond R212A
    { 366, 1, 0, 0, 344 }, // Diamond R212A
    { 330, 1, 0, 0, 345 }, // Diamond R212B
    { 57, 1, 0, 0, 346 }, // Diamond R212B
    { 4, 1, 0, 0, 347 }, // Diamond R212B
    { 336, 1, 0, 0, 348 }, // Diamond R212B
    { 17, 1, 0, 0, 349 }, // Diamond R212B
    { 351, 1, 0, 0, 350 }, // Diamond R212B
    { 21, 1, 0, 0, 351 }, // Diamond R212B
    { 18, 1, 0, 0, 352 }, // Diamond R212B
    { 237, 1, 0, 0, 353 }, // Diamond R212AR0102
    { 3, 1, 0, 0, 354 }, // Diamond D05R0102
    { 17, 1, 0, 0, 355 }, // Diamond D05R0102
    { 26, 1, 0, 0, 356 }, // Diamond D05R0103
    { 94, 1, 0, 0, 357 }, // Diamond D05R0105
    { 29, 1, 0, 0, 358 }, // Diamond D05R0105
    { 332, 1, 0, 0, 359 }, // Diamond D05R0105
    { 367, 1, 0, 0, 360 }, // Diamond D05R0105
    { 354, 1, 0, 0, 361 }, // Diamond D05R0110
    { 110, 1, 0, 0, 362 }, // Diamond D05R0110
    { 28, 1, 0, 0, 363 }, // Diamond D05R0110
    { 314, 1, 0, 0, 364 }, // Diamond D05R0110
    { 307, 1, 0, 0, 365 }, // Diamond D05R0110
    { 92, 1, 0, 0, 366 }, // Diamond D05R0110
    { 370, 1, 0, 0, 367 }, // Diamond D05R0112
    { 310, 1, 0, 0, 368 }, // Diamond D05R0112
    { 372, 1, 0, 0, 369 }, // Diamond D05R0112
    { 59, 1, 0, 0, 370 }, // Diamond D05R0112
    { 4, 1, 0, 0, 371 }, // Diamond D05R0112
    { 48, 1, 0, 0, 372 }, // Diamond D05R0111
    { 94, 1, 0, 0, 373 }, // Diamond D05R0104
    { 29, 1, 0, 0, 374 }, // Diamond D05R0104
    { 4, 1, 0, 0, 375 }, // Diamond D05R0104
    { 18, 1, 0, 0, 376 }, // Diamond D05R0104
    { 243, 1, 0, 0, 377 }, // Diamond D05R0104
    { 84, 1, 0, 0, 378 }, // Diamond D05R0106
    { 51, 1, 0, 0, 379 }, // Diamond D05R0106
    { 46, 1, 0, 0, 380 }, // Diamond D05R0106
    { 94, 1, 0, 0, 381 }, // Diamond D05R0106
    { 22, 1, 0, 0, 382 }, // Diamond D05R0106
    { 412, 1, 0, 0, 383 }, // Diamond D05R0106
    { 60, 1, 0, 0, 384 }, // Diamond D05R0106
    { 49, 1, 0, 0, 385 }, // Diamond D05R0107
    { 346, 1, 0, 0, 386 }, // Diamond D05R0108
    { 374, 1, 0, 0, 387 }, // Diamond D05R0108
    { 414, 1, 0, 0, 388 }, // Diamond R216
    { 3, 1, 0, 0, 389 }, // Diamond R217
    { 18, 1, 0, 0, 390 }, // Diamond R217
    { 94, 1, 0, 0, 391 }, // Diamond R217
    { 83, 1, 0, 0, 392 }, // Diamond R217
    { 88, 1, 0, 0, 393 }, // Diamond R217
    { 88, 1, 0, 0, 394 }, // Diamond R217
    { 345, 1, 0, 0, 395 }, // Diamond R217
    { 368, 1, 0, 0, 396 }, // Diamond R217
    { 27, 1, 0, 0, 397 }, // Diamond R217
    { 50, 1, 0, 0, 398 }, // Diamond R217
    { 49, 1, 0, 0, 399 }, // Diamond C09
    { 246, 1, 0, 0, 400 }, // Diamond D20R0104
    { 50, 1, 0, 0, 401 }, // Diamond R222
    { 397, 1, 0, 0, 402 }, // Diamond R222
    { 239, 1, 0, 0, 403 }, // Diamond R222
    { 85, 1, 0, 0, 404 }, // Diamond R222
    { 76, 1, 0, 0, 405 }, // Diamond C08
    { 3, 1, 0, 0, 406 }, // Diamond C08
    { 2, 1, 0, 0, 407 }, // Diamond W223
    { 303, 1, 0, 0, 408 }, // Diamond D09R0101
    { 55, 1, 0, 0, 409 }, // Diamond D09R0101
    { 25, 1, 0, 0, 410 }, // Diamond D09R0101
    { 38, 1, 0, 0, 411 }, // Diamond D09R0102
    { 27, 1, 0, 0, 412 }, // Diamond D09R0102
    { 421, 1, 0, 0, 413 }, // Diamond D09R0104
    { 108, 1, 0, 0, 414 }, // Diamond D09R0104
    { 463, 1, 0, 0, 415 }, // Diamond D09R0104
    { 228, 1, 0, 0, 416 }, // Diamond D09R0104
    { 355, 1, 0, 0, 417 }, // Diamond D09R0104
    { 51, 1, 0, 0, 418 }, // Diamond C10
    { 340, 1, 0, 0, 419 }, // Diamond R219
    { 19, 1, 0, 0, 420 }, // Diamond W220
    { 340, 1, 0, 0, 421 }, // Diamond W220
    { 50, 1, 0, 0, 422 }, // Diamond R221
    { 359, 1, 0, 0, 423 }, // Diamond R221
    { 78, 1, 0, 0, 424 }, // Diamond R221
    { 329, 1, 0, 0, 425 }, // Diamond R221
    { 48, 1, 0, 0, 426 }, // Diamond R221
    { 78, 1, 0, 0, 427 }, // Diamond D24
    { 353, 1, 0, 0, 428 }, // Diamond D24R0103
    { 39, 1, 0, 0, 429 }, // Diamond D24R0104
    { 56, 1, 0, 0, 430 }, // Diamond D24R0105
    { 28, 1, 0, 0, 431 }, // Diamond D24R0105
    { 286, 1, 0, 0, 432 }, // Diamond D24R0105
    { 361, 1, 0, 0, 433 }, // Diamond D09R0103
    { 316, 1, 0, 0, 434 }, // Diamond D09R0103
    { 40, 1, 0, 0, 435 }, // Diamond D05R0113
    { 318, 1, 0, 0, 436 }, // Diamond D05R0113
    { 338, 1, 0, 0, 437 }, // Diamond D05R0113
    { 223, 1, 0, 0, 438 }, // Diamond D05R0113
    // SINNOH_PORT_END
};
#endif //_IN_FIELDMAP_C
