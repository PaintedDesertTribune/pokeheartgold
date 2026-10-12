#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D24R0201.h"
#include "msgdata/msg/msg_1198_D24R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D24R0201_000
	ScrDef scr_seq_D24R0201_001
	ScrDefEnd

scr_seq_D24R0201_000:
	CheckFlag FLAG_SINNOH_285
	GoToIf 1, _0029
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 1
	CallIf 1, _002F
	End

_0029:
	SetFlag FLAG_SINNOH_619
	End

_002F:
	ClearFlag FLAG_SINNOH_619
	Return

scr_seq_D24R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1198_D24R0201_00000
	SetVar 0x8004, 233
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A8
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_285
	NPCMsg msg_1198_D24R0201_00001
	CloseMsg
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 2
	GoToIf 1, _00B2
	CompareVarToValue 0x8004, 3
	GoToIf 1, _00D0
	CompareVarToValue 0x8004, 0
	GoToIf 1, _00B2
	CompareVarToValue 0x8004, 1
	GoToIf 1, _00D0
	End

_00A8:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_00B2:
	ApplyMovement 0, mv_D24R0201_00F0
	WaitMovement
	PlayFanfare 1539
	HidePerson 0
	WaitSE 1539
	// Diamond ScrCmd_StopFanfare dropped: no stop-fanfare command in HeartGold
	ReleaseAll
	End

_00D0:
	ApplyMovement 0, mv_D24R0201_00FC
	WaitMovement
	PlayFanfare 1539
	HidePerson 0
	WaitSE 1539
	// Diamond ScrCmd_StopFanfare dropped: no stop-fanfare command in HeartGold
	ReleaseAll
	End

	.balign 4, 0
mv_D24R0201_00F0:
	.short 14, 1
	.short 13, 3
	EndMovement

	.balign 4, 0
mv_D24R0201_00FC:
	.short 13, 2
	.short 14, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
