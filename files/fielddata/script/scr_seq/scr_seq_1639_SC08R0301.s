#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0301.h"
#include "msgdata/msg/msg_1166_SC08R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0301_000
	ScrDef scr_seq_SC08R0301_001
	ScrDef scr_seq_SC08R0301_002
	ScrDef scr_seq_SC08R0301_003
	ScrDef scr_seq_SC08R0301_004
	ScrDef scr_seq_SC08R0301_005
	ScrDef scr_seq_SC08R0301_006
	ScrDefEnd

scr_seq_SC08R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0301_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1166_SC08R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
