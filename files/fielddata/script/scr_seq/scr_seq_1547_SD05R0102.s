#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0102.h"
#include "msgdata/msg/msg_1120_SD05R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0102_000
	ScrDef scr_seq_SD05R0102_001
	ScrDef scr_seq_SD05R0102_002
	ScrDef scr_seq_SD05R0102_003
	ScrDef scr_seq_SD05R0102_004
	ScrDefEnd

scr_seq_SD05R0102_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1120_SD05R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD05R0102_001:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0102_002:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0102_003:
	SetVar VAR_SPECIAL_x8008, 407
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0102_004:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
