#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07GYM0101.h"
#include "msgdata/msg/msg_1059_SC07GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07GYM0101_000
	ScrDef scr_seq_SC07GYM0101_001
	ScrDef scr_seq_SC07GYM0101_002
	ScrDef scr_seq_SC07GYM0101_003
	ScrDefEnd

scr_seq_SC07GYM0101_000:
	// TODO Diamond ScrCmd_InitVeilstoneGym 0x174 args []: no HeartGold mapping yet
	End

scr_seq_SC07GYM0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00EF
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1059_SC07GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_MAYLENE_MAYLENE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0108
	NPCMsg msg_1059_SC07GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_1059_SC07GYM0101_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 2
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_COLBY
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_DARREN
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_RAFAEL
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_JEFFERY
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	ClearFlag FLAG_SINNOH_454
	SetVar VAR_SINNOH_407D, 1
	SetVar VAR_SINNOH_411A, 1
	NPCMsg msg_1059_SC07GYM0101_00003
	GoTo _00A7

_00A7:
	SetVar 0x8004, 387
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E5
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_157
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_1059_SC07GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E5:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00EF:
	CheckFlag FLAG_SINNOH_157
	GoToIf 0, _00A7
	BufferPlayersName 0
	NPCMsg msg_1059_SC07GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0108:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC07GYM0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0134
	NPCMsg msg_1059_SC07GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0134:
	BufferPlayersName 0
	NPCMsg msg_1059_SC07GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07GYM0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _016C
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_1059_SC07GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016C:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_1059_SC07GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
