#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08GYM0103.h"
#include "msgdata/msg/msg_1162_SC08GYM0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08GYM0103_000
	ScrDef scr_seq_SC08GYM0103_001
	ScrDef scr_seq_SC08GYM0103_002
	ScrDef scr_seq_SC08GYM0103_003
	ScrDefEnd

scr_seq_SC08GYM0103_000:
	SetVar 0x4000, 0
	// Diamond ScrCmd_InitSunyshoreGym dropped: Sunyshore Gym gears: the gear rooms are walkable without them (collision only closes with the gear hook); gear models and rotation menu not ported yet
	End

scr_seq_SC08GYM0103_001:
	// Diamond ScrCmd_RotateSunyshoreGymGear dropped: Sunyshore Gym gear rotation menu not ported yet (gyms stays walkable)
	End

scr_seq_SC08GYM0103_002:
	// Diamond ScrCmd_RotateSunyshoreGymGear dropped: Sunyshore Gym gear rotation menu not ported yet (gyms stays walkable)
	End

scr_seq_SC08GYM0103_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 7, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00FE
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1162_SC08GYM0103_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_VOLKNER_VOLKNER, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0114
	NPCMsg msg_1162_SC08GYM0103_00001
	BufferPlayersName 0
	NPCMsg msg_1162_SC08GYM0103_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 7
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_M_ZACHERY
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_F_DESTINY
	SetTrainerFlag TRAINER_SINNOH_GUITARIST_JERRY
	SetTrainerFlag TRAINER_SINNOH_GUITARIST_PRESTON
	SetTrainerFlag TRAINER_SINNOH_GUITARIST_LONNIE
	SetTrainerFlag TRAINER_SINNOH_POKE_KID_MEGHAN
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_FORREST
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_F_TIERA
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1162_SC08GYM0103_00003
	GoTo _00B6

_00B6:
	SetVar 0x8004, 384
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F4
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_182
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_1162_SC08GYM0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F4:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00FE:
	CheckFlag FLAG_SINNOH_182
	GoToIf 0, _00B6
	NPCMsg msg_1162_SC08GYM0103_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0114:
	WhiteOut
	ReleaseAll
	End



	.balign 4, 0
