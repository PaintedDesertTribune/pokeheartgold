#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05GYM0108.h"
#include "msgdata/msg/msg_0990_SC05GYM0108.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05GYM0108_000
	ScrDef scr_seq_SC05GYM0108_001
	ScrDef scr_seq_SC05GYM0108_002
	ScrDef scr_seq_SC05GYM0108_003
	ScrDefEnd

scr_seq_SC05GYM0108_000:
	SinnohHearthomeGymInit
	End

scr_seq_SC05GYM0108_001:
	SinnohHearthomeGymElevator
	End

scr_seq_SC05GYM0108_002:
	LockAll
	PlayFanfare SEQ_SE_DP_UG_020
	NPCMsg msg_0990_SC05GYM0108_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0108_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0990_SC05GYM0108_00000
	PlayFanfare SEQ_SE_DP_MAZYO4
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
