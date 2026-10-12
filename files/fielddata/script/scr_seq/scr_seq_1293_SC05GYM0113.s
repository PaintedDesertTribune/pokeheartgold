#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05GYM0113.h"
#include "msgdata/msg/msg_0993_SC05GYM0113.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05GYM0113_000
	ScrDef scr_seq_SC05GYM0113_001
	ScrDef scr_seq_SC05GYM0113_002
	ScrDef scr_seq_SC05GYM0113_003
	ScrDef scr_seq_SC05GYM0113_004
	ScrDefEnd

scr_seq_SC05GYM0113_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0056
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0066
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0076
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0086
	End

_0056:
	ApplyMovement 0, mv_SC05GYM0113_0188
	WaitMovement
	GoTo _0096

_0066:
	ApplyMovement 0, mv_SC05GYM0113_019C
	WaitMovement
	GoTo _0096

_0076:
	ApplyMovement 0, mv_SC05GYM0113_01B0
	WaitMovement
	GoTo _0096

_0086:
	ApplyMovement 0, mv_SC05GYM0113_01C4
	WaitMovement
	GoTo _0096

_0096:
	CheckBadge 4, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, scr_seq_SC05GYM0113_003
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_0993_SC05GYM0113_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_FANTINA_FANTINA, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, scr_seq_SC05GYM0113_004
	NPCMsg msg_0993_SC05GYM0113_00001
	BufferPlayersName 0
	NPCMsg msg_0993_SC05GYM0113_00002
	PlaySE 1161
	WaitSE 1161
	GiveBadge 4
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_CAMPER_DREW
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_M_ALLEN
	SetTrainerFlag TRAINER_SINNOH_ACE_TRAINER_F_CATHERINE
	SetTrainerFlag TRAINER_SINNOH_LASS_MOLLY
	SetTrainerFlag TRAINER_SINNOH_PICNICKER_CHEYENNE
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_CHANCE
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_F_MACKENZIE
	SetTrainerFlag TRAINER_SINNOH_YOUNGSTER_DONNY
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	ClearFlag FLAG_SINNOH_456
	SetVar VAR_SINNOH_40D1, 1
	NPCMsg msg_0993_SC05GYM0113_00003
	GoTo scr_seq_SC05GYM0113_001

scr_seq_SC05GYM0113_001:
	SetVar 0x8004, 392
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, scr_seq_SC05GYM0113_002
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_125
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_0993_SC05GYM0113_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0113_002:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0113_003:
	CheckFlag FLAG_SINNOH_125
	GoToIf 0, scr_seq_SC05GYM0113_001
	NPCMsg msg_0993_SC05GYM0113_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0113_004:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SC05GYM0113_0188:
	.short 2, 4
	.short 0, 4
	.short 3, 4
	.short 1, 4
	EndMovement

	.balign 4, 0
mv_SC05GYM0113_019C:
	.short 3, 4
	.short 1, 4
	.short 2, 4
	.short 0, 4
	EndMovement

	.balign 4, 0
mv_SC05GYM0113_01B0:
	.short 0, 4
	.short 2, 4
	.short 1, 4
	.short 3, 4
	EndMovement

	.balign 4, 0
mv_SC05GYM0113_01C4:
	.short 0, 4
	.short 3, 4
	.short 1, 4
	.short 2, 4
	EndMovement

	.balign 4, 0
