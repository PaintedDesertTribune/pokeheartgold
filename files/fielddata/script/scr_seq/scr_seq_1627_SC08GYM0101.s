#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08GYM0101.h"
#include "msgdata/msg/msg_1160_SC08GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08GYM0101_000
	ScrDef scr_seq_SC08GYM0101_001
	ScrDef scr_seq_SC08GYM0101_002
	ScrDef scr_seq_SC08GYM0101_003
	ScrDefEnd

scr_seq_SC08GYM0101_000:
	SetVar 0x4000, 0
	// TODO Diamond ScrCmd_InitSunyshoreGym 0x175 args [0]: no HeartGold mapping yet
	End

scr_seq_SC08GYM0101_001:
	// TODO Diamond ScrCmd_RotateSunyshoreGymGear 0x176 args [0]: no HeartGold mapping yet
	End

scr_seq_SC08GYM0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 7, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0048
	NPCMsg msg_1160_SC08GYM0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0048:
	BufferPlayersName 0
	NPCMsg msg_1160_SC08GYM0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08GYM0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 7, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _007A
	NPCMsg msg_1160_SC08GYM0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007A:
	CompareVarToValue VAR_SINNOH_40EF, 1
	GoToIf 4, _0098
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_1160_SC08GYM0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0098:
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_1160_SC08GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
