#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0102.h"
#include "msgdata/msg/msg_0850_SC01R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0102_000
	ScrDef scr_seq_SC01R0102_001
	ScrDef scr_seq_SC01R0102_002
	ScrDef scr_seq_SC01R0102_003
	ScrDefEnd

scr_seq_SC01R0102_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0850_SC01R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0102_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0850_SC01R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0102_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 35, 0
	NPCMsg msg_0850_SC01R0102_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0102_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 417, 0
	NPCMsg msg_0850_SC01R0102_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
