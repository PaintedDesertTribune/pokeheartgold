#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL02R0201.h"
#include "msgdata/msg/msg_1083_SL02R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL02R0201_000
	ScrDefEnd

scr_seq_SL02R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_314
	GoToIf 1, _0055
	NPCMsg msg_1083_SL02R0201_00000
	SetVar 0x8004, 42
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004B
	SetFlag FLAG_SINNOH_314
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_004B:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0055:
	NPCMsg msg_1083_SL02R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
