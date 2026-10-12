#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD09R0102.h"
#include "msgdata/msg/msg_1172_SD09R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD09R0102_000
	ScrDef scr_seq_SD09R0102_001
	ScrDef scr_seq_SD09R0102_002
	ScrDef scr_seq_SD09R0102_003
	ScrDef scr_seq_SD09R0102_004
	ScrDefEnd

scr_seq_SD09R0102_000:
	End


scr_seq_SD09R0102_001:
	SetVar VAR_SPECIAL_x8008, 406
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0102_002:
	SetVar VAR_SPECIAL_x8008, 39
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0102_003:
	SetVar VAR_SPECIAL_x8008, 23
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0102_004:
	SetVar VAR_SPECIAL_x8008, 398
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
