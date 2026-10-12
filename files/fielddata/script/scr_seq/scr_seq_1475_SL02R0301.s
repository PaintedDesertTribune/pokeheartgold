#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL02R0301.h"
#include "msgdata/msg/msg_1084_SL02R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL02R0301_000
	ScrDefEnd

scr_seq_SL02R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _00D3
	// TODO Diamond ScrCmd_CheckSinnohDexComplete 0x1e8 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004C
	CheckFlag FLAG_SINNOH_171
	GoToIf 0, _0057
	// TODO Diamond ScrCmd_CheckNationalDexComplete 0x1e9 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0057
	GoTo _0095

_004C:
	NPCMsg msg_1084_SL02R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0057:
	CheckFlag FLAG_SINNOH_171
	CallIf 0, _00DE
	SetFlag FLAG_SINNOH_171
	SetFlag FLAG_SINNOH_1
	NPCMsg msg_1084_SL02R0301_00001
	PlaySE 1158
	WaitSE 1158
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_RegisterSinnohPokedex 0x1ea args []: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_0095:
	CheckFlag FLAG_SINNOH_172
	CallIf 0, _00E4
	SetFlag FLAG_SINNOH_172
	SetFlag FLAG_SINNOH_1
	NPCMsg msg_1084_SL02R0301_00002
	PlaySE 1158
	WaitSE 1158
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_RegisterNationalPokedex 0x1eb args []: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_00D3:
	NPCMsg msg_1084_SL02R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DE:
	AddSpecialGameStat 26
	Return

_00E4:
	AddSpecialGameStat 27
	Return



	.balign 4, 0
