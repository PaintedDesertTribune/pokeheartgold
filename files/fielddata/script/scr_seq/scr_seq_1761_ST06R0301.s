#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST06R0301.h"
#include "msgdata/msg/msg_1227_ST06R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST06R0301_000
	ScrDefEnd

scr_seq_ST06R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1227_ST06R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
