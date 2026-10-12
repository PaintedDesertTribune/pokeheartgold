#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10.h"
#include "msgdata/msg/msg_1176_SC10.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10_000
	ScrDef scr_seq_SC10_001
	ScrDef scr_seq_SC10_002
	ScrDefEnd

scr_seq_SC10_000:
	DirectionSignpost msg_1176_SC10_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC10_001:
	DirectionSignpost msg_1176_SC10_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC10_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1176_SC10_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
