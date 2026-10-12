#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D24.h"
#include "msgdata/msg/msg_1197_D24.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D24_000
	ScrDef scr_seq_D24_001
	ScrDefEnd

scr_seq_D24_000:
	SetFlag FLAG_SINNOH_2522
	End

scr_seq_D24_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerFacing 0x8004
	FacePlayer
	NPCMsg msg_1197_D24_00000
	YesNo 0x800C
	CloseMsg
	CompareVarToValue 0x800C, 0
	GoToIf 1, _003A
	GoTo _006D

_003A:
	NPCMsg msg_1197_D24_00001
	CloseMsg
	Call _0078
	CompareVarToValue 0x8004, 1
	CallIf 1, _0092
	CompareVarToValue 0x8004, 2
	CallIf 1, _00AC
	SinnohShipCutscene 0, 2, MAP_SINNOH_CANALAVE, 44, 750
	ReleaseAll
	End

_006D:
	NPCMsg msg_1197_D24_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0078:
	ApplyMovement 0, mv_D24_00C8
	WaitMovement
	PlayFanfare 1539
	ApplyMovement 0, mv_D24_00D4
	WaitMovement
	Return

_0092:
	ApplyMovement obj_player, mv_D24_00DC
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_D24_00D4
	WaitMovement
	Return

_00AC:
	ApplyMovement obj_player, mv_D24_00EC
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_D24_00D4
	WaitMovement
	Return

	.balign 4, 0
mv_D24_00C8:
	.short 2, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_D24_00D4:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_D24_00DC:
	.short 13, 1
	.short 2, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_D24_00EC:
	.short 14, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
