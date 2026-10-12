#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02GYM0101.h"
#include "msgdata/msg/msg_0831_SC02GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02GYM0101_000
	ScrDef scr_seq_SC02GYM0101_001
	ScrDef scr_seq_SC02GYM0101_002
	ScrDef scr_seq_SC02GYM0101_003
	ScrDefEnd

scr_seq_SC02GYM0101_000:
	SinnohCanalaveGymInit
	End

scr_seq_SC02GYM0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0103
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_0831_SC02GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_BYRON_BYRON, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _011C
	NPCMsg msg_0831_SC02GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0831_SC02GYM0101_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 5
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_DAVID
	SetTrainerFlag TRAINER_SINNOH_WORKER_JACKSON
	SetTrainerFlag TRAINER_SINNOH_WORKER_GARY
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_M_CESAR
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_F_BREANNA
	SetTrainerFlag TRAINER_SINNOH_BLACK_BELT_RICKY
	SetTrainerFlag TRAINER_SINNOH_WORKER_GERARDO
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	ClearFlag FLAG_SINNOH_464
	ClearFlag FLAG_SINNOH_470
	ClearFlag FLAG_SINNOH_468
	ClearFlag FLAG_SINNOH_469
	SetVar VAR_SINNOH_4078, 2
	SetFlag FLAG_SINNOH_438
	NPCMsg msg_0831_SC02GYM0101_00003
	GoTo _00BB

_00BB:
	SetVar 0x8004, 418
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F9
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_146
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_0831_SC02GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0103:
	CheckFlag FLAG_SINNOH_146
	GoToIf 0, _00BB
	BufferRivalsName 1
	NPCMsg msg_0831_SC02GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011C:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC02GYM0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0148
	NPCMsg msg_0831_SC02GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0148:
	BufferPlayersName 0
	NPCMsg msg_0831_SC02GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02GYM0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0180
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_0831_SC02GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0180:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_0831_SC02GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
