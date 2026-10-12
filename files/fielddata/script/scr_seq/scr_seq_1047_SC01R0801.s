#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0801.h"
#include "msgdata/msg/msg_0870_SC01R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0801_000
	ScrDef scr_seq_SC01R0801_001
	ScrDef scr_seq_SC01R0801_002
	ScrDefEnd

scr_seq_SC01R0801_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0870_SC01R0801_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0801_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_0870_SC01R0801_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0801_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0870_SC01R0801_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
