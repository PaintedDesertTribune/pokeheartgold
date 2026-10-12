#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0802.h"
#include "msgdata/msg/msg_1001_SC05R0802.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0802_000
	ScrDef scr_seq_SC05R0802_001
	ScrDef scr_seq_SC05R0802_002
	ScrDef scr_seq_SC05R0802_003
	ScrDefEnd

scr_seq_SC05R0802_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1001_SC05R0802_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0802_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1001_SC05R0802_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0802_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1001_SC05R0802_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0802_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1001_SC05R0802_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
