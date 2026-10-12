#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0301.h"
#include "msgdata/msg/msg_0907_SC03R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0301_000
	ScrDef scr_seq_SC03R0301_001
	ScrDefEnd

scr_seq_SC03R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0907_SC03R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0301_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0907_SC03R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
