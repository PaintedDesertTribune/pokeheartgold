#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0108.h"
#include "msgdata/msg/msg_1072_SD26R0108.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0108_000
	ScrDef scr_seq_SD26R0108_001
	ScrDef scr_seq_SD26R0108_002
	ScrDefEnd

scr_seq_SD26R0108_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1072_SD26R0108_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0108_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1072_SD26R0108_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0108_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1072_SD26R0108_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
