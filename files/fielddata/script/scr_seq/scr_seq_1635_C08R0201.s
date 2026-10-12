#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C08R0201.h"
#include "msgdata/msg/msg_1164_C08R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C08R0201_000
	ScrDefEnd

scr_seq_C08R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2724
	GoToIf 1, _006A
	CheckFlag FLAG_SINNOH_2727
	GoToIf 1, _005F
	CheckFlag FLAG_SINNOH_247
	GoToIf 0, _004C
	GetPartyLead 0x8002
	Call _0070
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0136
	GoTo _0146

_004C:
	SetFlag FLAG_SINNOH_247
	SetFlag FLAG_SINNOH_2727
	NPCMsg msg_1164_C08R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005F:
	NPCMsg msg_1164_C08R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006A:
	GoTo _012B

_0070:
	SetVar 0x800C, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00C8
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00D2
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00DC
	CompareVarToValue 0x800C, 3
	GoToIf 1, _00E6
	CompareVarToValue 0x800C, 4
	GoToIf 1, _00F0
	CompareVarToValue 0x800C, 5
	GoToIf 1, _00FA
	GoTo _0104

_00C8:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 65]: no HeartGold mapping yet
	Return

_00D2:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 59]: no HeartGold mapping yet
	Return

_00DC:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 60]: no HeartGold mapping yet
	Return

_00E6:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 61]: no HeartGold mapping yet
	Return

_00F0:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 62]: no HeartGold mapping yet
	Return

_00FA:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 63]: no HeartGold mapping yet
	Return

_0104:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 64]: no HeartGold mapping yet
	Return

_010E:
	BufferSpeciesName 1, 0x8002, 0, 0
	BufferPlayersName 2
	NPCMsg msg_1164_C08R0201_00004
	PlaySE 1155
	NPCMsg msg_1164_C08R0201_00005
	WaitSE 1155
	NPCMsg msg_1164_C08R0201_00006
	GoTo _012B

_012B:
	NPCMsg msg_1164_C08R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0136:
	BufferSpeciesName 1, 0x8002, 0, 0
	NPCMsg msg_1164_C08R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0146:
	SetVar 0x800C, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x800C, 0
	GoToIf 1, _019E
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01F2
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0246
	CompareVarToValue 0x800C, 3
	GoToIf 1, _029A
	CompareVarToValue 0x800C, 4
	GoToIf 1, _02EE
	CompareVarToValue 0x800C, 5
	GoToIf 1, _0342
	GoTo _0396

_019E:
	NPCMsg msg_1164_C08R0201_00020
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00021
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 65]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 65]: no HeartGold mapping yet
	GoTo _010E

_01F2:
	NPCMsg msg_1164_C08R0201_00002
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00003
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 59]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 59]: no HeartGold mapping yet
	GoTo _010E

_0246:
	NPCMsg msg_1164_C08R0201_00010
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00011
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 60]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 60]: no HeartGold mapping yet
	GoTo _010E

_029A:
	NPCMsg msg_1164_C08R0201_00012
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00013
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 61]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 61]: no HeartGold mapping yet
	GoTo _010E

_02EE:
	NPCMsg msg_1164_C08R0201_00014
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00015
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 62]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 62]: no HeartGold mapping yet
	GoTo _010E

_0342:
	NPCMsg msg_1164_C08R0201_00016
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00017
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 63]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 63]: no HeartGold mapping yet
	GoTo _010E

_0396:
	NPCMsg msg_1164_C08R0201_00018
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32768]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03EA
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32768]: no HeartGold mapping yet
	NPCMsg msg_1164_C08R0201_00019
	SetFlag FLAG_SINNOH_2724
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 64]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRibbonName 0x232 args [3, 64]: no HeartGold mapping yet
	GoTo _010E

_03EA:
	NPCMsg msg_1164_C08R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
