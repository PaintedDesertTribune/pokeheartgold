#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05GYM0106.h"
#include "msgdata/msg/msg_0987_SC05GYM0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05GYM0106_000
	ScrDef scr_seq_SC05GYM0106_001
	ScrDef scr_seq_SC05GYM0106_002
	ScrDef scr_seq_SC05GYM0106_003
	ScrDefEnd

scr_seq_SC05GYM0106_000:
	SinnohHearthomeGymInit
	End

scr_seq_SC05GYM0106_001:
	SinnohHearthomeGymElevator
	End

scr_seq_SC05GYM0106_002:
	LockAll
	PlayFanfare SEQ_SE_DP_UG_020
	NPCMsg msg_0987_SC05GYM0106_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0106_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0987_SC05GYM0106_00000
	PlayFanfare SEQ_SE_DP_MAZYO4
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
