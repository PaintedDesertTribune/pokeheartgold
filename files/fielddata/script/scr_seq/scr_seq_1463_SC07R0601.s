#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0601.h"
#include "msgdata/msg/msg_1078_SC07R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0601_000
	ScrDef scr_seq_SC07R0601_001
	ScrDef scr_seq_SC07R0601_002
	ScrDefEnd

scr_seq_SC07R0601_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1078_SC07R0601_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0601_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1078_SC07R0601_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0601_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 427, 0
	NPCMsg msg_1078_SC07R0601_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
