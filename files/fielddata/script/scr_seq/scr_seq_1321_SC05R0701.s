#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0701.h"
#include "msgdata/msg/msg_1007_SC05R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0701_000
	ScrDef scr_seq_SC05R0701_001
	ScrDef scr_seq_SC05R0701_002
	ScrDef scr_seq_SC05R0701_003
	ScrDefEnd

scr_seq_SC05R0701_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1007_SC05R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0701_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1007_SC05R0701_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0701_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1007_SC05R0701_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0701_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1007_SC05R0701_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
