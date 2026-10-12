#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW226.h"
#include "msgdata/msg/msg_1230_SW226.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW226_000
	ScrDef scr_seq_SW226_001
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


	.balign 4, 0
