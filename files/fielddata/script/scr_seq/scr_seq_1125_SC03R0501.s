#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0501.h"
#include "msgdata/msg/msg_0909_SC03R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0501_000
	ScrDef scr_seq_SC03R0501_001
	ScrDef scr_seq_SC03R0501_002
	ScrDefEnd

scr_seq_SC03R0501_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0909_SC03R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0501_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0909_SC03R0501_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0501_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_0909_SC03R0501_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
