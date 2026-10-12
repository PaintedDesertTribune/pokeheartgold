#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R217.h"
#include "msgdata/msg/msg_1134_R217.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R217_000
	ScrDef scr_seq_R217_001
	ScrDef scr_seq_R217_002
	ScrDefEnd

scr_seq_R217_000:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1134_R217_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R217_001:
	DirectionSignpost msg_1134_R217_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R217_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1134_R217_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
