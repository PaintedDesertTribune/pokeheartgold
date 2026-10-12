#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0113.h"
#include "msgdata/msg/msg_1211_SD05R0113.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0113_000
	ScrDef scr_seq_SD05R0113_001
	ScrDef scr_seq_SD05R0113_002
	ScrDef scr_seq_SD05R0113_003
	ScrDef scr_seq_SD05R0113_004
	ScrDef scr_seq_SD05R0113_005
	ScrDef scr_seq_SD05R0113_006
	ScrDefEnd

scr_seq_SD05R0113_000:
	End


scr_seq_SD05R0113_001:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0113_002:
	SetVar VAR_SPECIAL_x8008, 237
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0113_003:
	SetVar VAR_SPECIAL_x8008, 269
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0113_004:
	SetVar VAR_SPECIAL_x8008, 41
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0113_005:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0113_006:
	SetVar VAR_SPECIAL_x8008, 90
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
