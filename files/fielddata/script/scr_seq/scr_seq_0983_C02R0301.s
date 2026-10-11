#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0301.h"
#include "msgdata/msg/msg_0838_C02R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0301_000
	ScrDefEnd

scr_seq_C02R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _0026
	NPCMsg msg_0838_C02R0301_00000
	SetFlag FLAG_SINNOH_1
	GoTo _0026

_0026:
	NPCMsg msg_0838_C02R0301_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0049
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0130
	End

_0049:
	NPCMsg msg_0838_C02R0301_00002
	CloseMsg
	GoTo _0054

_0054:
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 1, 0, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_ChoosePokemonMenu 0x191 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetSelectedPartySlot 0x193 args [32770]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_RestoreOverworld 0x0a1 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_FadeScreen 0x0bc args [6, 1, 1, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_WaitFadeScreen 0x0bd args []: no HeartGold mapping yet
	CompareVarToValue 0x8002, 255
	GoToIf 1, _0130
	// TODO Diamond ScrCmd_GetPartyMonSpecies 0x198 args [32770, 32769, 17]: no HeartGold mapping yet
	// TODO unknown Diamond command cmd_8001 (0x8001); script truncated here
	End

_0130:
	NPCMsg msg_0838_C02R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
