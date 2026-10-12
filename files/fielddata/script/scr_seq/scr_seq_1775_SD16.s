#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD16.h"
#include "msgdata/msg/msg_1234_SD16.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD16_000
	ScrDef scr_seq_SD16_001
	ScrDef scr_seq_SD16_002
	ScrDef scr_seq_SD16_003
	ScrDefEnd

scr_seq_SD16_000:
	SetFlag FLAG_SINNOH_2513
	End

scr_seq_SD16_001:
	DirectionSignpost msg_1234_SD16_00000, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SD16_002:
	SetVar VAR_SPECIAL_x8008, 270
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD16_003:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
