#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD29R0103.h"
#include "msgdata/msg/msg_1139_SD29R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD29R0103_000
	ScrDef scr_seq_SD29R0103_001
	ScrDef scr_seq_SD29R0103_002
	ScrDefEnd

scr_seq_SD29R0103_000:
	SetFlag FLAG_SINNOH_2531
	End

scr_seq_SD29R0103_001:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _0021
	End

_0021:
	SetFlag FLAG_SINNOH_511
	HidePerson 0
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD29R0103_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry 480, 0
	NPCMsg msg_1139_SD29R0103_00000
	CloseMsg
	SetFlag FLAG_SINNOH_142
	WildBattle 480, 50
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0085
	// TODO Diamond ScrCmd_Unk00ED 0x0ed args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _007A
	SetFlag FLAG_SINNOH_295
	ReleaseAll
	End

_007A:
	NPCMsg msg_1139_SD29R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0085:
	WhiteOut
	ReleaseAll
	End



	.balign 4, 0
