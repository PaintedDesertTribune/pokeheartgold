#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC09GYM0101.h"
#include "msgdata/msg/msg_1144_SC09GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC09GYM0101_000
	ScrDef scr_seq_SC09GYM0101_001
	ScrDef scr_seq_SC09GYM0101_002
	ScrDef scr_seq_SC09GYM0101_003
	ScrDefEnd

scr_seq_SC09GYM0101_000:
	CheckFlag FLAG_SINNOH_235
	GoToIf 1, _001F
	End

_001F:
	SetFlag FLAG_SINNOH_529
	End

scr_seq_SC09GYM0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 6, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00F8
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1144_SC09GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_CANDICE_CANDICE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _010E
	NPCMsg msg_1144_SC09GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_1144_SC09GYM0101_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 6
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_M_SERGIO
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_M_ISAIAH
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_M_ANTON
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_F_SAVANNAH
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_F_ALICIA
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_SNOW_F_BRENNA
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	SetFlag FLAG_SINNOH_477
	NPCMsg msg_1144_SC09GYM0101_00003
	GoTo _00B0

_00B0:
	SetVar 0x8004, 399
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00EE
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_158
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_1144_SC09GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EE:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00F8:
	CheckFlag FLAG_SINNOH_158
	GoToIf 0, _00B0
	NPCMsg msg_1144_SC09GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010E:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC09GYM0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 6, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _013A
	NPCMsg msg_1144_SC09GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013A:
	BufferPlayersName 0
	NPCMsg msg_1144_SC09GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09GYM0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 6, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0172
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_1144_SC09GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0172:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_1144_SC09GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
