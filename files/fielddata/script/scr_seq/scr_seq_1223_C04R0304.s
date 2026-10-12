#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04R0304.h"
#include "msgdata/msg/msg_0958_C04R0304.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04R0304_000
	ScrDefEnd

scr_seq_C04R0304_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_118
	GoToIf 1, _004B
	NPCMsg msg_0958_C04R0304_00000
	SetVar 0x8004, 331
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0056
	SetFlag FLAG_SINNOH_118
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_004B:
	NPCMsg msg_0958_C04R0304_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0056:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
