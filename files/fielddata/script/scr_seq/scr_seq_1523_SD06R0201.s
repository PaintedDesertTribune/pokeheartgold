#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD06R0201.h"
#include "msgdata/msg/msg_1108_SD06R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD06R0201_000
	ScrDef scr_seq_SD06R0201_001
	ScrDef scr_seq_SD06R0201_002
	ScrDef scr_seq_SD06R0201_003
	ScrDefEnd

scr_seq_SD06R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1108_SD06R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD06R0201_000:
	DirectionSignpost msg_1108_SD06R0201_00001, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SD06R0201_002:
	SetVar VAR_SPECIAL_x8008, 76
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD06R0201_003:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
