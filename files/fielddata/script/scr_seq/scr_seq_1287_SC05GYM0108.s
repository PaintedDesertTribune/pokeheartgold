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
	// Diamond ScrCmd_InitHearthomeGym dropped: Hearthome Gym lift state; the lift is a warp here (no state needed)
	End

scr_seq_SC05GYM0108_001:
	GetPlayerFacing VAR_SPECIAL_RESULT
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfEq _elev_SC05GYM0108_0016
	AddVar VAR_SPECIAL_x8005, 1
	Warp MAP_SINNOH_HEARTHOME_GYM_FOURTH_QUESTION_ROOM, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, DIR_SOUTH
	End
_elev_SC05GYM0108_0016:
	SubVar VAR_SPECIAL_x8005, 1
	Warp MAP_SINNOH_HEARTHOME_GYM_FOURTH_QUESTION_ROOM, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, DIR_NORTH
	End
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
