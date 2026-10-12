#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD07R0102.h"
#include "msgdata/msg/msg_1023_SD07R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD07R0102_000
	ScrDef scr_seq_SD07R0102_001
	ScrDefEnd

scr_seq_SD07R0102_000:
	SetFlag FLAG_SINNOH_2505
	End

scr_seq_SD07R0102_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_MessageUnown 0x26d args [0]: no HeartGold mapping yet
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
