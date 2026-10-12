#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0102.h"
#include "msgdata/msg/msg_0998_SC05R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0102_000
	ScrDef scr_seq_SC05R0102_001
	ScrDefEnd

scr_seq_SC05R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_140
	GoToIf 1, _0054
	BufferItemName 0, 253
	NPCMsg msg_0998_SC05R0102_00000
	SetVar 0x8004, 253
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0064
	SetFlag FLAG_SINNOH_140
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0054:
	BufferItemName 0, 253
	NPCMsg msg_0998_SC05R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0064:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0998_SC05R0102_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
