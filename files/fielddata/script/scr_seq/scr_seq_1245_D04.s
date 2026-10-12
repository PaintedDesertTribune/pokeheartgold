#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D04.h"
#include "msgdata/msg/msg_0969_D04.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D04_000
	ScrDefEnd

scr_seq_D04_000:
	DirectionSignpost msg_0969_D04_00000, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
