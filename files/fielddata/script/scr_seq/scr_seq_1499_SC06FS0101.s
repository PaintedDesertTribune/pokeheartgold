#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06FS0101.h"
#include "msgdata/msg/msg_1096_SC06FS0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06FS0101_000
	ScrDef scr_seq_SC06FS0101_001
	ScrDef scr_seq_SC06FS0101_002
	ScrDef scr_seq_SC06FS0101_003
	ScrDef scr_seq_SC06FS0101_004
	ScrDefEnd

scr_seq_SC06FS0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_SC06FS0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	SpecialMartBuy 37
	ReleaseAll
	End

scr_seq_SC06FS0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1096_SC06FS0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06FS0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1096_SC06FS0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06FS0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1096_SC06FS0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
