#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D07R0105.h"
#include "msgdata/msg/msg_1027_D07R0105.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D07R0105_000
	ScrDefEnd

scr_seq_D07R0105_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1027_D07R0105_00000
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004D
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005D
	CompareVarToValue 0x800C, 2
	GoToIf 1, _006D
	CompareVarToValue 0x800C, 3
	GoToIf 1, _007D
	End

_004D:
	ApplyMovement 0, mv_D07R0105_00A4
	WaitMovement
	GoTo _008D

_005D:
	ApplyMovement 0, mv_D07R0105_00B0
	WaitMovement
	GoTo _008D

_006D:
	ApplyMovement 0, mv_D07R0105_00A4
	WaitMovement
	GoTo _008D

_007D:
	ApplyMovement 0, mv_D07R0105_00A4
	WaitMovement
	GoTo _008D

_008D:
	PlayFanfare 1539
	HidePerson 0
	// Diamond ScrCmd_StopFanfare dropped: no stop-fanfare command in HeartGold
	ClearFlag FLAG_SINNOH_572
	ReleaseAll
	End

	.balign 4, 0
mv_D07R0105_00A4:
	.short 12, 3
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_D07R0105_00B0:
	.short 15, 1
	.short 12, 3
	.short 14, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
