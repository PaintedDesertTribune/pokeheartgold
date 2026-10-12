#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D30.h"
#include "msgdata/msg/msg_1207_D30.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D30_000
	ScrDef scr_seq_D30_001
	ScrDefEnd

scr_seq_D30_000:
	SetFlag FLAG_SINNOH_2532
	// TODO Diamond ScrCmd_Unk0270 0x270 args [1, 1]: no HeartGold mapping yet
	ClearFlag FLAG_SINNOH_663
	CheckFlag FLAG_SINNOH_344
	CallIf 0, _0024
	End

_0024:
	CompareVarToValue VAR_SINNOH_40F8, 2
	GoToIf 5, _0035
	SetFlag FLAG_SINNOH_663

_0035:
	Return

scr_seq_D30_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerFacing 0x8004
	NPCMsg msg_1207_D30_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005D
	GoTo _009D

_005D:
	NPCMsg msg_1207_D30_00001
	CloseMsg
	Call _00A8
	CompareVarToValue 0x8004, 1
	CallIf 1, _00C2
	CompareVarToValue 0x8004, 2
	CallIf 1, _00DC
	CompareVarToValue 0x8004, 0
	CallIf 1, _00F6
	SinnohShipCutscene 0, 2, MAP_SINNOH_CANALAVE, 44, 750
	ReleaseAll
	End

_009D:
	NPCMsg msg_1207_D30_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A8:
	ApplyMovement 0, mv_D30_0110
	WaitMovement
	PlayFanfare 1539
	ApplyMovement 0, mv_D30_011C
	WaitMovement
	Return

_00C2:
	ApplyMovement obj_player, mv_D30_0124
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_D30_011C
	WaitMovement
	Return

_00DC:
	ApplyMovement obj_player, mv_D30_0134
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_D30_011C
	WaitMovement
	Return

_00F6:
	ApplyMovement obj_player, mv_D30_0140
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_D30_011C
	WaitMovement
	Return

	.balign 4, 0
mv_D30_0110:
	.short 14, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_D30_011C:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_D30_0124:
	.short 13, 1
	.short 14, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_D30_0134:
	.short 14, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_D30_0140:
	.short 12, 1
	.short 14, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
