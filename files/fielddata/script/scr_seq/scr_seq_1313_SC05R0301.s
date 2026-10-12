#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0301.h"
#include "msgdata/msg/msg_1003_SC05R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0301_000
	ScrDef scr_seq_SC05R0301_001
	ScrDef scr_seq_SC05R0301_002
	ScrDef scr_seq_SC05R0301_003
	ScrDefEnd

scr_seq_SC05R0301_003:
	// TODO unknown Diamond command ScrCmd_Unk0238 (0x238); script truncated here
	End

scr_seq_SC05R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1003_SC05R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0301_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1003_SC05R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0301_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1003_SC05R0301_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
