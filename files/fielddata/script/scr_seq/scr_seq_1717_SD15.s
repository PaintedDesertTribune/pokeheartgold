#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD15.h"
#include "msgdata/msg/msg_1205_SD15.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD15_000
	ScrDef scr_seq_SD15_001
	ScrDefEnd

scr_seq_SD15_000:
	SetFlag FLAG_SINNOH_2512
	// TODO Diamond ScrCmd_Unk0270 0x270 args [0, 1]: no HeartGold mapping yet
	End

scr_seq_SD15_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerFacing 0x8004
	HasItem 453, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0052
	NPCMsg msg_1205_SD15_00001
	YesNo 0x800C
	CloseMsg
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005D
	GoTo _0098

_0052:
	NPCMsg msg_1205_SD15_00000
	CloseMsg
	GoTo _005D

_005D:
	Call _00A3
	CompareVarToValue 0x8004, 1
	CallIf 1, _00BD
	CompareVarToValue 0x8004, 3
	CallIf 1, _00D7
	CompareVarToValue 0x8004, 0
	CallIf 1, _00F1
	SinnohShipCutscene 0, 2, MAP_SINNOH_CANALAVE, 44, 750
	ReleaseAll
	End

_0098:
	NPCMsg msg_1205_SD15_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A3:
	ApplyMovement 0, mv_SD15_010C
	WaitMovement
	PlayFanfare 1539
	ApplyMovement 0, mv_SD15_0118
	WaitMovement
	Return

_00BD:
	ApplyMovement obj_player, mv_SD15_0120
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SD15_0118
	WaitMovement
	Return

_00D7:
	ApplyMovement obj_player, mv_SD15_0130
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SD15_0118
	WaitMovement
	Return

_00F1:
	ApplyMovement obj_player, mv_SD15_013C
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SD15_0118
	WaitMovement
	Return

	.balign 4, 0
mv_SD15_010C:
	.short 15, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SD15_0118:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SD15_0120:
	.short 13, 1
	.short 15, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SD15_0130:
	.short 15, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SD15_013C:
	.short 12, 1
	.short 15, 2
	.short 64, 1
	EndMovement

	.balign 4, 0
