#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0502.h"
#include "msgdata/msg/msg_0865_SC01R0502.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0502_000
	ScrDef scr_seq_SC01R0502_001
	ScrDefEnd

scr_seq_SC01R0502_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0865_SC01R0502_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0502_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0865_SC01R0502_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
