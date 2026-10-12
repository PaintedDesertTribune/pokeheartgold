#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD12R0101.h"
#include "msgdata/msg/msg_0917_SD12R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD12R0101_000
	ScrDef scr_seq_SD12R0101_001
	ScrDef scr_seq_SD12R0101_002
	ScrDef scr_seq_SD12R0101_003
	ScrDef scr_seq_SD12R0101_004
	ScrDefEnd

scr_seq_SD12R0101_000:
	SetFlag FLAG_SINNOH_2509
	End


scr_seq_SD12R0101_001:
	SetVar VAR_SPECIAL_x8008, 366
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD12R0101_002:
	SetVar VAR_SPECIAL_x8008, 319
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD12R0101_003:
	SetVar VAR_SPECIAL_x8008, 330
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD12R0101_004:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
