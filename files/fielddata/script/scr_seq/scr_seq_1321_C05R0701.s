#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C05R0701.h"
#include "msgdata/msg/msg_1007_C05R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C05R0701_000
	ScrDef scr_seq_C05R0701_001
	ScrDef scr_seq_C05R0701_002
	ScrDef scr_seq_C05R0701_003
	ScrDefEnd

scr_seq_C05R0701_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1007_C05R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C05R0701_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1007_C05R0701_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C05R0701_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1007_C05R0701_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C05R0701_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1007_C05R0701_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
