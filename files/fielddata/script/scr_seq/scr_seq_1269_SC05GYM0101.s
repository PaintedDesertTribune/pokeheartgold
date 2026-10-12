#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05GYM0101.h"
#include "msgdata/msg/msg_0981_SC05GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05GYM0101_000
	ScrDef scr_seq_SC05GYM0101_001
	ScrDef scr_seq_SC05GYM0101_002
	ScrDef scr_seq_SC05GYM0101_003
	ScrDef scr_seq_SC05GYM0101_004
	ScrDef scr_seq_SC05GYM0101_005
	ScrDefEnd

scr_seq_SC05GYM0101_000:
	SetVar 0x4000, 0
	// Diamond ScrCmd_InitHearthomeGym dropped: Hearthome Gym lift state; the lift is a warp here (no state needed)
	CheckFlag FLAG_SINNOH_2445
	GoToIf 0, scr_seq_SC05GYM0101_001
	End

scr_seq_SC05GYM0101_001:
	SetVar 0x4000, 1
	End

scr_seq_SC05GYM0101_002:
	GetPlayerFacing VAR_SPECIAL_RESULT
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_RESULT, DIR_NORTH
	GoToIfEq _elev_SC05GYM0101_0037
	AddVar VAR_SPECIAL_x8005, 1
	Warp MAP_SINNOH_HEARTHOME_GYM_FIRST_QUESTION_ROOM, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, DIR_SOUTH
	End
_elev_SC05GYM0101_0037:
	SubVar VAR_SPECIAL_x8005, 1
	Warp MAP_SINNOH_HEARTHOME_GYM_FIRST_QUESTION_ROOM, 0, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, DIR_NORTH
	End
	End

scr_seq_SC05GYM0101_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0981_SC05GYM0101_00000
	PlayFanfare 1591
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_165
	GoToIf 0, _008F
	CheckBadge 4, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0081
	NPCMsg msg_0981_SC05GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0081:
	BufferPlayersName 0
	NPCMsg msg_0981_SC05GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008F:
	CheckFlag FLAG_SINNOH_163
	GoToIf 1, _00A9
	SetFlag FLAG_SINNOH_163
	NPCMsg msg_0981_SC05GYM0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A9:
	NPCMsg msg_0981_SC05GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0101_005:
	PlayFanfare 1500
	LockAll
	CheckBadge 4, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00DE
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_0981_SC05GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DE:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_0981_SC05GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
