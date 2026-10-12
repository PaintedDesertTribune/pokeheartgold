#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R217R0101.h"
#include "msgdata/msg/msg_1136_R217R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R217R0101_000
	ScrDefEnd

scr_seq_R217R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_222
	GoToIf 1, _0039
	HasItem 427, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0044
	NPCMsg msg_1136_R217R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0039:
	NPCMsg msg_1136_R217R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0044:
	NPCMsg msg_1136_R217R0101_00001
	SetVar 0x8004, 302
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0076
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_222
	GoTo _0039

_0076:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
