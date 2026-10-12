#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW226.h"
#include "msgdata/msg/msg_1230_SW226.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW226_000
	ScrDef scr_seq_SW226_001
	ScrDef scr_seq_SW226_002
	ScrDef scr_seq_SW226_003
	ScrDef scr_seq_SW226_004
	ScrDefEnd

scr_seq_SW226_000:
	DirectionSignpost msg_1230_SW226_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SW226_001:
	DirectionSignpost msg_1230_SW226_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SW226_002:
	SetVar VAR_SPECIAL_x8008, 380
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SW226_003:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SW226_004:
	SetVar VAR_SPECIAL_x8008, 279
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
