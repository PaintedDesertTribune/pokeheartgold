#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06GYM0101.h"
#include "msgdata/msg/msg_1099_SC06GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06GYM0101_000
	ScrDef scr_seq_SC06GYM0101_001
	ScrDef scr_seq_SC06GYM0101_002
	ScrDef scr_seq_SC06GYM0101_003
	ScrDef scr_seq_SC06GYM0101_004
	ScrDef scr_seq_SC06GYM0101_005
	ScrDef scr_seq_SC06GYM0101_006
	ScrDefEnd

scr_seq_SC06GYM0101_000:
	SetVar 0x4001, 0
	SetVar 0x4002, 1
	SetVar 0x4003, 0
	SinnohPastoriaGymInit
	End

scr_seq_SC06GYM0101_001:
	SinnohPastoriaGymButton
	SetVar 0x4001, 1
	SetVar 0x4002, 0
	SetVar 0x4003, 0
	End

scr_seq_SC06GYM0101_002:
	SinnohPastoriaGymButton
	SetVar 0x4001, 0
	SetVar 0x4002, 1
	SetVar 0x4003, 0
	End

scr_seq_SC06GYM0101_003:
	SinnohPastoriaGymButton
	SetVar 0x4001, 0
	SetVar 0x4002, 0
	SetVar 0x4003, 1
	End

scr_seq_SC06GYM0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 3, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _014D
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1099_SC06GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_WAKE_WAKE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0163
	NPCMsg msg_1099_SC06GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_1099_SC06GYM0101_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 3
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_FISHERMAN_ERICK
	SetTrainerFlag TRAINER_SINNOH_SAILOR_DAMIAN
	SetTrainerFlag TRAINER_SINNOH_FISHERMAN_WALTER
	SetTrainerFlag TRAINER_SINNOH_SAILOR_SAMSON
	SetTrainerFlag TRAINER_SINNOH_TUBER_M_JACKY
	SetTrainerFlag TRAINER_SINNOH_TUBER_F_CAITLYN
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	SetVar VAR_SINNOH_407C, 1
	NPCMsg msg_1099_SC06GYM0101_00003
	GoTo _0105

_0105:
	SetVar 0x8004, 382
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0143
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_156
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_1099_SC06GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0143:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_014D:
	CheckFlag FLAG_SINNOH_156
	GoToIf 0, _0105
	NPCMsg msg_1099_SC06GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0163:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC06GYM0101_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 3, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _018F
	NPCMsg msg_1099_SC06GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018F:
	BufferPlayersName 0
	NPCMsg msg_1099_SC06GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06GYM0101_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 3, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01C7
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_1099_SC06GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C7:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_1099_SC06GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
