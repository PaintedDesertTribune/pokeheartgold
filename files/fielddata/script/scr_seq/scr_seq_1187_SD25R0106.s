#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0106.h"
#include "msgdata/msg/msg_0940_SD25R0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD25R0106_000
	ScrDef scr_seq_SD25R0106_001
	ScrDefEnd

scr_seq_SD25R0106_000:
	PlayFanfare 1500
	LockAll
	CheckFlag FLAG_SINNOH_329
	GoToIf 1, _00BF
	CheckFlag FLAG_SINNOH_2736
	GoToIf 1, _00BF
	CheckGameClearFlag 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BF
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BF
	SetVar 0x800C, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x800C, 3
	GoToIf 0, _00BF
	NPCMsg msg_0940_SD25R0106_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00B9
	BufferPlayersName 0
	NPCMsg msg_0940_SD25R0106_00002
	CloseMsg
	PlayCry 479, 0
	WaitCry
	SetFlag FLAG_SINNOH_2736
	WildBattle 479, 15
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CA
	// TODO Diamond ScrCmd_Unk02BC 0x2bc args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00AE
	SetFlag FLAG_SINNOH_329
	ReleaseAll
	End

_00AE:
	NPCMsg msg_0940_SD25R0106_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B9:
	CloseMsg
	ReleaseAll
	End

_00BF:
	NPCMsg msg_0940_SD25R0106_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CA:
	WhiteOut
	ReleaseAll
	End


scr_seq_SD25R0106_001:
	SetVar VAR_SPECIAL_x8008, 312
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
