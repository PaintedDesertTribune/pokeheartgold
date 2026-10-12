#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0112.h"
#include "msgdata/msg/msg_1124_SD05R0112.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0112_000
	ScrDef scr_seq_SD05R0112_001
	ScrDef scr_seq_SD05R0112_002
	ScrDef scr_seq_SD05R0112_003
	ScrDef scr_seq_SD05R0112_004
	ScrDefEnd

scr_seq_SD05R0112_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1124_SD05R0112_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD05R0112_001:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0112_002:
	SetVar VAR_SPECIAL_x8008, 396
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0112_003:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0112_004:
	SetVar VAR_SPECIAL_x8008, 329
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
