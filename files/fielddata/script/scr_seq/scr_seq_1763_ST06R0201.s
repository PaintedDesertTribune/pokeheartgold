#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST06R0201.h"
#include "msgdata/msg/msg_1228_ST06R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST06R0201_000
	ScrDefEnd

scr_seq_ST06R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_203
	GoToIf 1, _004B
	NPCMsg msg_1228_ST06R0201_00000
	SetVar 0x8004, 369
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0056
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_203
	GoTo _004B

_004B:
	NPCMsg msg_1228_ST06R0201_00001
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
