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
	// TODO Diamond ScrCmd_InitHearthomeGym 0x171 args []: no HeartGold mapping yet
	CheckFlag FLAG_SINNOH_2445
	GoToIf 0, scr_seq_SC05GYM0101_001
	End

scr_seq_SC05GYM0101_001:
	SetVar 0x4000, 1
	End

scr_seq_SC05GYM0101_002:
	// TODO Diamond ScrCmd_MoveHearthomeGymElevator 0x172 args []: no HeartGold mapping yet
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
