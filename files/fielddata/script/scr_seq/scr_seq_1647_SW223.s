#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW223.h"
#include "msgdata/msg/msg_1170_SW223.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW223_000
	ScrDef scr_seq_SW223_001
	ScrDef scr_seq_SW223_002
	ScrDefEnd

scr_seq_SW223_000:
	End


scr_seq_SW223_001:
	SetVar VAR_SPECIAL_x8008, 345
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SW223_002:
	SetVar VAR_SPECIAL_x8008, 88
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
