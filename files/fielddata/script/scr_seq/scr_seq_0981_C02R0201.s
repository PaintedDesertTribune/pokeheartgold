#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0201.h"
#include "msgdata/msg/msg_0837_C02R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0201_000
	ScrDef scr_seq_C02R0201_001
	ScrDefEnd

scr_seq_C02R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_201
	GoToIf 1, _0051
	NPCMsg msg_0837_C02R0201_00001
	SetVar 0x8004, 375
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005C
	CallStd 2044 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_201
	GoTo _0051

_0051:
	NPCMsg msg_0837_C02R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005C:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0837_C02R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
