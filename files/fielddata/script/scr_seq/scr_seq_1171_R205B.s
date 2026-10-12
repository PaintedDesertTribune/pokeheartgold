#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R205B.h"
#include "msgdata/msg/msg_0932_R205B.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R205B_000
	ScrDef scr_seq_R205B_001
	ScrDef scr_seq_R205B_002
	ScrDefEnd

scr_seq_R205B_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0932_R205B_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R205B_001:
	DirectionSignpost msg_0932_R205B_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R205B_002:
	DirectionSignpost msg_0932_R205B_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
