#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R217R0201.h"
#include "msgdata/msg/msg_1135_R217R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R217R0201_000
	ScrDefEnd

scr_seq_R217R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_315
	GoToIf 1, _0059
	NPCMsg msg_1135_R217R0201_00000
	SetVar 0x8004, 247
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004F
	SetFlag FLAG_SINNOH_315
	SetFlag FLAG_SINNOH_637
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_004F:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0059:
	NPCMsg msg_1135_R217R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
