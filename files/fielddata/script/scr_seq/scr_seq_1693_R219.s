#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R219.h"
#include "msgdata/msg/msg_1193_R219.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R219_000
	ScrDefEnd

scr_seq_R219_000:
	DirectionSignpost msg_1193_R219_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
