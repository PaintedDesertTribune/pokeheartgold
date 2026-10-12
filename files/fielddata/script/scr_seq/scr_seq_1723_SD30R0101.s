#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD30R0101.h"
#include "msgdata/msg/msg_1208_SD30R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD30R0101_000
	ScrDef scr_seq_SD30R0101_001
	ScrDef scr_seq_SD30R0101_002
	ScrDefEnd

scr_seq_SD30R0101_000:
	End

scr_seq_SD30R0101_001:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _001D
	End

_001D:
	SetFlag FLAG_SINNOH_606
	HidePerson 0
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD30R0101_002:
	LockAll
	PlayFanfare SEQ_SE_DP_SELECT
	WaitSE SEQ_SE_DP_SELECT
	NPCMsg msg_1208_SD30R0101_00000
	CloseMsg
	SetFlag FLAG_SINNOH_142
	WildBattle 491, 40
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F2
	// TODO Diamond ScrCmd_Unk02BC 0x2bc args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0083
	SetFlag FLAG_SINNOH_344

_006E:
	SetFlag FLAG_SINNOH_607
	CompareVarToValue VAR_SINNOH_40F8, 2
	GoToIf 1, _008E
	ReleaseAll
	End

_0083:
	NPCMsg msg_1208_SD30R0101_00001
	CloseMsg
	GoTo _006E

_008E:
	Wait 30, 0x800C
	FadeScreen 6, 3, 0, 0
	WaitFade
	FadeScreen 6, 3, 1, 0
	WaitFade
	FadeScreen 6, 3, 0, 0
	WaitFade
	FadeScreen 6, 3, 1, 0
	WaitFade
	FadeScreen 6, 6, 0, 0
	WaitFade
	Wait 120, 0x800C
	Warp MAP_SINNOH_CANALAVE_HARBOR_INN, 0, 8, 6, 1
	FadeScreen 6, 6, 1, 0
	WaitFade
	ReleaseAll
	End

_00F2:
	WhiteOut
	ReleaseAll
	End



	.balign 4, 0
