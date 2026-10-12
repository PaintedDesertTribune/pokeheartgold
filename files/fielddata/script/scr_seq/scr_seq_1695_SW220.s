#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW220.h"
#include "msgdata/msg/msg_1194_SW220.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW220_000
	ScrDef scr_seq_SW220_001
	ScrDef scr_seq_SW220_002
	ScrDef scr_seq_SW220_003
	ScrDefEnd

scr_seq_SW220_000:
	End


scr_seq_SW220_001:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SW220_002:
	SetVar VAR_SPECIAL_x8008, 299
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SW220_003:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
