#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02GYM0101.h"
#include "msgdata/msg/msg_0831_C02GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02GYM0101_000
	ScrDef scr_seq_C02GYM0101_001
	ScrDef scr_seq_C02GYM0101_002
	ScrDef scr_seq_C02GYM0101_003
	ScrDefEnd

scr_seq_C02GYM0101_000:
	// TODO Diamond ScrCmd_InitCanalaveGym 0x173 args []: no HeartGold mapping yet
	End

scr_seq_C02GYM0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0103
	// TODO Diamond ScrCmd_Unk01CD 0x1cd args [9, 35, 0, 0, 0]: no HeartGold mapping yet
	NPCMsg msg_0831_C02GYM0101_00000
	CloseMsg
	TrainerBattle 1, 0, 0, 0
	// TODO Diamond ScrCmd_Unk00EC 0x0ec args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _011C
	NPCMsg msg_0831_C02GYM0101_00001
	BufferPlayersName 0
	NPCMsg msg_0831_C02GYM0101_00002
	PlaySE 1161
	// TODO Diamond ScrCmd_PlaySoundWait 0x04f args []: mapping arity mismatch
	GiveBadge 5
	AddSpecialGameStat 23
	SetTrainerFlag 1
	SetTrainerFlag 1
	SetTrainerFlag 1
	SetTrainerFlag 1
	SetTrainerFlag 1
	SetTrainerFlag 1
	SetTrainerFlag 1
	// TODO Diamond ScrCmd_Unk01CD 0x1cd args [10, 35, 250, 0, 0]: no HeartGold mapping yet
	ClearFlag FLAG_SINNOH_464
	ClearFlag FLAG_SINNOH_470
	ClearFlag FLAG_SINNOH_468
	ClearFlag FLAG_SINNOH_469
	SetVar VAR_SINNOH_4078, 2
	SetFlag FLAG_SINNOH_438
	NPCMsg msg_0831_C02GYM0101_00003
	GoTo _00BB

_00BB:
	SetVar 0x8004, 418
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F9
	CallStd 2044 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_146
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_0831_C02GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0103:
	CheckFlag FLAG_SINNOH_146
	GoToIf 0, _00BB
	BufferRivalsName 1
	NPCMsg msg_0831_C02GYM0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011C:
	// TODO Diamond ScrCmd_Unk00EB 0x0eb args []: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_C02GYM0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0148
	NPCMsg msg_0831_C02GYM0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0148:
	BufferPlayersName 0
	NPCMsg msg_0831_C02GYM0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02GYM0101_003:
	PlayFanfare 1500
	LockAll
	CheckBadge 5, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0180
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_0831_C02GYM0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0180:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_0831_C02GYM0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
