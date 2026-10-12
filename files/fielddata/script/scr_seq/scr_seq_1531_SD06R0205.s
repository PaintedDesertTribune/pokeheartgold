#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD06R0205.h"
#include "msgdata/msg/msg_1112_SD06R0205.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD06R0205_000
	ScrDef scr_seq_SD06R0205_001
	ScrDef scr_seq_SD06R0205_002
	ScrDefEnd

scr_seq_SD06R0205_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1112_SD06R0205_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD06R0205_001:
	DirectionSignpost msg_1112_SD06R0205_00001, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SD06R0205_002:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
