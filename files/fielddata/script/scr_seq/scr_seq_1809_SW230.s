#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW230.h"
#include "msgdata/msg/msg_1251_SW230.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW230_000
	ScrDef scr_seq_SW230_001
	ScrDef scr_seq_SW230_002
	ScrDefEnd

scr_seq_SW230_000:
	DirectionSignpost msg_1251_SW230_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SW230_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1251_SW230_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SW230_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1251_SW230_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
