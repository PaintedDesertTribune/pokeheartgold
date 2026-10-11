#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0401.h"
#include "msgdata/msg/msg_0839_C02R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0401_000
	ScrDef scr_seq_C02R0401_001
	ScrDef scr_seq_C02R0401_002
	ScrDefEnd

scr_seq_C02R0401_000:
	SetFlag FLAG_SINNOH_607
	CheckFlag FLAG_SINNOH_344
	GoToIf 0, _001F
	End

_001F:
	CheckFlag FLAG_SINNOH_2404
	GoToIf 1, _002C
	End

_002C:
	// TODO Diamond ScrCmd_NationalDex 0x22d args [2, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0040
	End

_0040:
	HasItem 454, 1, 0x4000
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0057
	End

_0057:
	// TODO Diamond ScrCmd_CheckEventValidity 0x28b args [0, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 1
	GoToIf 1, _006B
	End

_006B:
	CheckFlag FLAG_SINNOH_300
	GoToIf 1, _0078
	End

_0078:
	CompareVarToValue VAR_SINNOH_40F8, 2
	GoToIf 4, _0091
	ClearFlag FLAG_SINNOH_607
	SetVar VAR_SINNOH_40F8, 1
	End

_0091:
	End

scr_seq_C02R0401_001:
	LockAll
	Wait 30, 0x800C
	NPCMsg msg_0839_C02R0401_00000
	CloseMsg
	ApplyMovement 0, mv_C02R0401_0148
	ApplyMovement obj_player, mv_C02R0401_0130
	WaitMovement
	Wait 15, 0x800C
	BufferPlayersName 0
	NPCMsg msg_0839_C02R0401_00001
	CloseMsg
	PlayFanfare 1590
	SetFlag FLAG_SINNOH_316
	SetFlag FLAG_SINNOH_607
	SetVar VAR_SINNOH_40F8, 2
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 3, 0, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 3, 1, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 3, 0, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 3, 1, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 6, 0, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	Wait 120, 0x800C
	// TODO Diamond ScrCmd_Warp 0x0be args [320, 0, 152, 277, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 6, 1, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_C02R0401_002:
	LockAll
	Call _0184
	// TODO Diamond ScrCmd_Unk02B5 0x2b5 args [33, 58, 714]: no HeartGold mapping yet
	PlaySE 1166
	// TODO Diamond ScrCmd_PlaySoundWait 0x04f args []: mapping arity mismatch
	BufferPlayersName 0
	NPCMsg msg_0839_C02R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0184:
	CheckFlag FLAG_SINNOH_344
	GoToIf 1, _0197
	SetVar VAR_SINNOH_40F8, 0
	Return

_0197:
	SetVar VAR_SINNOH_40F8, 3
	Return

mv_C02R0401_0130:
	.short 12, 1
	.short 15, 3
	.short 12, 1
	.short 15, 1
	.short 33, 1
	EndMovement

mv_C02R0401_0148:
	.short 15, 3
	.short 12, 2
	.short 33, 1
	.short 63, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
