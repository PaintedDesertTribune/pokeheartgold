#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C08R0101.h"
#include "msgdata/msg/msg_1163_C08R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C08R0101_000
	ScrDef scr_seq_C08R0101_001
	ScrDef scr_seq_C08R0101_002
	ScrDef scr_seq_C08R0101_003
	ScrDef scr_seq_C08R0101_004
	ScrDefEnd

scr_seq_C08R0101_004:
	End

scr_seq_C08R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x8000
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 0, 24]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0082
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_C08R0101_00000
	// TODO Diamond ScrCmd_GetTotalPokemonEVs 0x233 args [32780, 32768]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 510
	GoToIf 0, _0077
	NPCMsg msg_1163_C08R0101_00001
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32768, 24]: no HeartGold mapping yet
	PlaySE 1155
	BufferPlayersName 1
	NPCMsg msg_1163_C08R0101_00002
	WaitSE 1155
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_C08R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0077:
	NPCMsg msg_1163_C08R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0082:
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_C08R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C08R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1163_C08R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C08R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 434, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D5
	NPCMsg msg_1163_C08R0101_00007
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	Call _00E0
	ReleaseAll
	End

_00D5:
	NPCMsg msg_1163_C08R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E0:
	SetVar 0x800C, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _016B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0147
	CompareVarToValue 0x8008, 2
	GoToIf 1, _014D
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0153
	CompareVarToValue 0x8008, 4
	GoToIf 1, _0159
	CompareVarToValue 0x8008, 5
	GoToIf 1, _015F
	CompareVarToValue 0x8008, 6
	GoToIf 1, _0165
	End

_0147:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [0]: no HeartGold mapping yet
	Return

_014D:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [1]: no HeartGold mapping yet
	Return

_0153:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [2]: no HeartGold mapping yet
	Return

_0159:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [3]: no HeartGold mapping yet
	Return

_015F:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [4]: no HeartGold mapping yet
	Return

_0165:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [5]: no HeartGold mapping yet
	Return

_016B:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [6]: no HeartGold mapping yet
	Return

scr_seq_C08R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1163_C08R0101_00009
	SetVar 0x4000, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _01BA
	CompareVarToValue 0x4000, 1
	GoToIf 1, _01BA
	CompareVarToValue 0x4000, 2
	GoToIf 1, _01BA
	CompareVarToValue 0x4000, 3
	GoToIf 1, _01BA
	GoTo _01C5

_01BA:
	NPCMsg msg_1163_C08R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C5:
	NPCMsg msg_1163_C08R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
