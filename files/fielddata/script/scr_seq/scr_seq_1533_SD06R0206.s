#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD06R0206.h"
#include "msgdata/msg/msg_1113_SD06R0206.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD06R0206_000
	ScrDef scr_seq_SD06R0206_001
	ScrDefEnd

scr_seq_SD06R0206_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_352
	GoToIf 1, _004F
	NPCMsg msg_1113_SD06R0206_00000
	SetVar 0x8004, 424
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004F
	SetFlag FLAG_SINNOH_352
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_004F:
	NPCMsg msg_1113_SD06R0206_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD06R0206_001:
	DirectionSignpost msg_1113_SD06R0206_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
