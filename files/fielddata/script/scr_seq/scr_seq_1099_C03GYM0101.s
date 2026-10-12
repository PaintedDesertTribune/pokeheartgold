#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C03GYM0101.h"
#include "msgdata/msg/msg_0896_C03GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C03GYM0101_000
	ScrDef scr_seq_C03GYM0101_001
	ScrDef scr_seq_C03GYM0101_002
	ScrDefEnd

scr_seq_C03GYM0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00FD
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_0896_C03GYM0101_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_ROARK_ROARK, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0113
	NPCMsg msg_0896_C03GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0896_C03GYM0101_00002
	PlaySE 1161
	WaitSE 1161
	SetTrainerFlag TRAINER_SINNOH_YOUNGSTER_JONATHON
	SetTrainerFlag TRAINER_SINNOH_YOUNGSTER_DARIUS
	GiveBadge 0
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_YOUNGSTER_JONATHON
	SetTrainerFlag TRAINER_SINNOH_YOUNGSTER_DARIUS
	SetFlag FLAG_SINNOH_605
	SetVar VAR_SINNOH_40F0, 1
	SetVar VAR_SINNOH_4079, 2
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	SetVar VAR_SINNOH_4077, 3
	ClearFlag FLAG_SINNOH_408
	ClearFlag FLAG_SINNOH_443
	ClearFlag FLAG_SINNOH_442
	SetFlag FLAG_SINNOH_438
	NPCMsg msg_0896_C03GYM0101_00003
	GoTo _00B5

_00B5:
	SetVar 0x8004, 403
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F3
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_117
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_0896_C03GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F3:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_00FD:
	CheckFlag FLAG_SINNOH_117
	GoToIf 0, _00B5
	NPCMsg msg_0896_C03GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0113:
	WhiteOut
	ReleaseAll
	End

scr_seq_C03GYM0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _013F
	NPCMsg msg_0896_C03GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013F:
	BufferPlayersName 0
	NPCMsg msg_0896_C03GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03GYM0101_002:
	PlayFanfare 1500
	LockAll
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0177
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_0896_C03GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0177:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_0896_C03GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
