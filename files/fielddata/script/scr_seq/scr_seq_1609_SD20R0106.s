#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD20R0106.h"
#include "msgdata/msg/msg_1151_SD20R0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD20R0106_000
	ScrDef scr_seq_SD20R0106_001
	ScrDefEnd

scr_seq_SD20R0106_000:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _0017
	End

_0017:
	SetFlag FLAG_SINNOH_609
	HidePerson 0
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD20R0106_001:
	LockAll
	PlayFanfare 1500
	WaitSE 1500
	CheckFlag FLAG_SINNOH_282
	GoToIf 1, _0081
	// TODO Diamond ScrCmd_CheckRegis 0x26b args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0073
	SetFlag FLAG_SINNOH_282
	BufferPlayersName 0
	NPCMsg msg_1151_SD20R0106_00001
	CloseMsg
	Release 0
	// TODO Diamond ScrCmd_ShakeEvent 0x269 args [0, 8, 90, 3, 0]: no HeartGold mapping yet
	Lock 0
	GoTo _0081

_0073:
	BufferPlayersName 0
	NPCMsg msg_1151_SD20R0106_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0081:
	NPCMsg msg_1151_SD20R0106_00002
	CloseMsg
	PlayCry 486, 0
	WaitCry
	SetFlag FLAG_SINNOH_142
	WildBattle 486, 70
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D1
	// TODO Diamond ScrCmd_Unk00ED 0x0ed args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C6
	SetFlag FLAG_SINNOH_283
	ReleaseAll
	End

_00C6:
	NPCMsg msg_1151_SD20R0106_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D1:
	WhiteOut
	ReleaseAll
	End


	.balign 4, 0
