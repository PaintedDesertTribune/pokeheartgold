#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0501.h"
#include "msgdata/msg/msg_1101_SC06R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0501_000
	ScrDef scr_seq_SC06R0501_001
	ScrDefEnd

scr_seq_SC06R0501_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1101_SC06R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06R0501_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 54, 0
	NPCMsg msg_1101_SC06R0501_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
