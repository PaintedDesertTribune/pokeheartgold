#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C01R0102.h"
#include "msgdata/msg/msg_0850_C01R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C01R0102_000
	ScrDef scr_seq_C01R0102_001
	ScrDef scr_seq_C01R0102_002
	ScrDef scr_seq_C01R0102_003
	ScrDefEnd

scr_seq_C01R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0850_C01R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0850_C01R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0102_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0850_C01R0102_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_0850_C01R0102_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
