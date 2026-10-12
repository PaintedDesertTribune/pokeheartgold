#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD09R0104.h"
#include "msgdata/msg/msg_1174_SD09R0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD09R0104_000
	ScrDef scr_seq_SD09R0104_001
	ScrDef scr_seq_SD09R0104_002
	ScrDef scr_seq_SD09R0104_003
	ScrDefEnd

scr_seq_SD09R0104_003:
	CheckFlag FLAG_SINNOH_230
	GoToIf 0, _001F
	End

_001F:
	SetVar VAR_SINNOH_4090, 0
	End

scr_seq_SD09R0104_000:
	LockAll
	PlayerOnBikeSet 0
	ApplyMovement 28, mv_SD09R0104_0140
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 55
	GoToIf 1, _008C
	CompareVarToValue 0x8005, 56
	GoToIf 1, _009C
	CompareVarToValue 0x8005, 57
	GoToIf 1, _00AC
	CompareVarToValue 0x8005, 58
	GoToIf 1, _00BC
	CompareVarToValue 0x8005, 59
	GoToIf 1, _00CC
	CompareVarToValue 0x8005, 60
	GoToIf 1, _00DC
	End

_008C:
	ApplyMovement 28, mv_SD09R0104_014C
	WaitMovement
	GoTo _00EC

_009C:
	ApplyMovement 28, mv_SD09R0104_0158
	WaitMovement
	GoTo _00EC

_00AC:
	ApplyMovement 28, mv_SD09R0104_0164
	WaitMovement
	GoTo _00EC

_00BC:
	ApplyMovement 28, mv_SD09R0104_0170
	WaitMovement
	GoTo _00EC

_00CC:
	ApplyMovement 28, mv_SD09R0104_0178
	WaitMovement
	GoTo _00EC

_00DC:
	ApplyMovement 28, mv_SD09R0104_0184
	WaitMovement
	GoTo _00EC

_00EC:
	BufferPlayersName 0
	CheckFlag FLAG_SINNOH_223
	CallIf 0, _0134
	CheckFlag FLAG_SINNOH_223
	CallIf 1, _0139
	BufferPlayersName 0
	PlaySE 1153
	NPCMsg msg_1174_SD09R0104_00001
	WaitSE 1153
	SetFlag FLAG_SINNOH_223
	SetVar VAR_SINNOH_4090, 1
	NPCMsg msg_1174_SD09R0104_00002
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_403F, 610
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 28, 48
	ReleaseAll
	End

_0134:
	NPCMsg msg_1174_SD09R0104_00000
	Return

_0139:
	NPCMsg msg_1174_SD09R0104_00003
	Return

scr_seq_SD09R0104_001:
	LockAll
	ApplyMovement obj_player, mv_SD09R0104_0274
	ApplyMovement 28, mv_SD09R0104_02DC
	WaitMovement
	NPCMsg msg_1174_SD09R0104_00004
	CloseMsg
	SetVar VAR_SINNOH_4090, 0
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 28, 14
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 55
	GoToIf 1, _020D
	CompareVarToValue 0x8005, 56
	GoToIf 1, _021D
	CompareVarToValue 0x8005, 57
	GoToIf 1, _022D
	CompareVarToValue 0x8005, 58
	GoToIf 1, _023D
	CompareVarToValue 0x8005, 59
	GoToIf 1, _024D
	CompareVarToValue 0x8005, 60
	GoToIf 1, _025D
	End

_020D:
	ApplyMovement 28, mv_SD09R0104_0284
	WaitMovement
	GoTo _026D

_021D:
	ApplyMovement 28, mv_SD09R0104_0294
	WaitMovement
	GoTo _026D

_022D:
	ApplyMovement 28, mv_SD09R0104_02A4
	WaitMovement
	GoTo _026D

_023D:
	ApplyMovement 28, mv_SD09R0104_02B4
	WaitMovement
	GoTo _026D

_024D:
	ApplyMovement 28, mv_SD09R0104_02BC
	WaitMovement
	GoTo _026D

_025D:
	ApplyMovement 28, mv_SD09R0104_02CC
	WaitMovement
	GoTo _026D

_026D:
	ReleaseAll
	End

scr_seq_SD09R0104_002:
	LockAll
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 28, 14
	ApplyMovement obj_player, mv_SD09R0104_03B4
	ApplyMovement 28, mv_SD09R0104_03E0
	WaitMovement
	NPCMsg msg_1174_SD09R0104_00005
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 51
	GoToIf 1, _0341
	CompareVarToValue 0x8004, 52
	GoToIf 1, _0359
	CompareVarToValue 0x8004, 53
	GoToIf 1, _0371
	CompareVarToValue 0x8004, 54
	GoToIf 1, _0389
	End

_0341:
	ApplyMovement obj_player, mv_SD09R0104_03C0
	ApplyMovement 28, mv_SD09R0104_03EC
	WaitMovement
	GoTo _03A1

_0359:
	ApplyMovement obj_player, mv_SD09R0104_03C0
	ApplyMovement 28, mv_SD09R0104_0400
	WaitMovement
	GoTo _03A1

_0371:
	ApplyMovement obj_player, mv_SD09R0104_03C0
	ApplyMovement 28, mv_SD09R0104_0414
	WaitMovement
	GoTo _03A1

_0389:
	ApplyMovement obj_player, mv_SD09R0104_03D0
	ApplyMovement 28, mv_SD09R0104_0428
	WaitMovement
	GoTo _03A1

_03A1:
	HidePerson 28
	SetFlag FLAG_SINNOH_230
	SetVar VAR_SINNOH_4090, 2
	ReleaseAll
	End

	.balign 4, 0
mv_SD09R0104_0140:
	.short 34, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_014C:
	.short 12, 3
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0158:
	.short 12, 2
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0164:
	.short 12, 1
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0170:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0178:
	.short 13, 1
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0184:
	.short 13, 2
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0274:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0284:
	.short 15, 2
	.short 13, 3
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0294:
	.short 15, 2
	.short 13, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_02A4:
	.short 15, 2
	.short 13, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_02B4:
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_SD09R0104_02BC:
	.short 15, 2
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_02CC:
	.short 15, 2
	.short 12, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_02DC:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_03B4:
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_03C0:
	.short 63, 1
	.short 35, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_03D0:
	.short 63, 1
	.short 34, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_03E0:
	.short 32, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_03EC:
	.short 15, 1
	.short 12, 7
	.short 15, 4
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0400:
	.short 15, 1
	.short 12, 7
	.short 15, 3
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0414:
	.short 15, 1
	.short 12, 7
	.short 15, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD09R0104_0428:
	.short 14, 1
	.short 12, 7
	.short 15, 3
	.short 35, 1
	EndMovement

	.balign 4, 0
