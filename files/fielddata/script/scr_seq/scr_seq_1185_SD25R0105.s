#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0105.h"
#include "msgdata/msg/msg_0939_SD25R0105.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD25R0105_000
	ScrDef scr_seq_SD25R0105_001
	ScrDefEnd

scr_seq_SD25R0105_000:
	End


scr_seq_SD25R0105_001:
	SetVar VAR_SPECIAL_x8008, 312
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
