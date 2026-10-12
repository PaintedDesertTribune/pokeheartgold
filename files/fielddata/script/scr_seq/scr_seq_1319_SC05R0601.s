#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0601.h"
#include "msgdata/msg/msg_1006_SC05R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0601_000
	ScrDefEnd

scr_seq_SC05R0601_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1006_SC05R0601_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
