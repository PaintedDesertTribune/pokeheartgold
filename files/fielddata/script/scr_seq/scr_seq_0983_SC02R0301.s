#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02R0301.h"
#include "msgdata/msg/msg_0838_SC02R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02R0301_000
	ScrDefEnd

scr_seq_SC02R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _0026
	NPCMsg msg_0838_SC02R0301_00000
	SetFlag FLAG_SINNOH_1
	GoTo _0026

_0026:
	NPCMsg msg_0838_SC02R0301_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0049
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0130
	End

_0049:
	NPCMsg msg_0838_SC02R0301_00002
	CloseMsg
	GoTo _0054

_0054:
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8002, 255
	GoToIf 1, _0130
	GetPartyMonSpecies 0x8002, 0x8001
	CompareVarToValue 0x8001, 0
	GoToIf 1, _011A
	// TODO Diamond ScrCmd_CountPartyMonMoves 0x1c8 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0125
	NPCMsg msg_0838_SC02R0301_00006
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk01C6 0x1c6 args [32770]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk01C7 0x1c7 args [32769]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8001, 255
	GoToIf 1, _0049
	// TODO Diamond ScrCmd_GetPokemonMoveName 0x1cb args [0, 32770, 32769]: no HeartGold mapping yet
	NPCMsg msg_0838_SC02R0301_00007
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0105
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0049
	End

_0105:
	// TODO Diamond ScrCmd_ForgetPartyMonMove 0x1c9 args [32770, 32769]: no HeartGold mapping yet
	NPCMsg msg_0838_SC02R0301_00008
	PlaySE 1165
	WaitSE 1165
	WaitButton
	CloseMsg
	End

_011A:
	NPCMsg msg_0838_SC02R0301_00005
	CloseMsg
	GoTo _0054

_0125:
	NPCMsg msg_0838_SC02R0301_00004
	CloseMsg
	GoTo _0054

_0130:
	NPCMsg msg_0838_SC02R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
