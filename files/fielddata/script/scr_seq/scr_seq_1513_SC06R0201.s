#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0201.h"
#include "msgdata/msg/msg_1103_SC06R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0201_000
	ScrDef scr_seq_SC06R0201_001
	ScrDefEnd

scr_seq_SC06R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2723
	GoToIf 1, _0055
	NPCMsg msg_1103_SC06R0201_00000
	Random 0x8004, 17
	AddVar 0x8004, 184
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	SetFlag FLAG_SINNOH_2723
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0055:
	NPCMsg msg_1103_SC06R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1103_SC06R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
