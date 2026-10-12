#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0101.h"
#include "msgdata/msg/msg_1163_SC08R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0101_000
	ScrDef scr_seq_SC08R0101_001
	ScrDef scr_seq_SC08R0101_002
	ScrDef scr_seq_SC08R0101_003
	ScrDef scr_seq_SC08R0101_004
	ScrDefEnd

scr_seq_SC08R0101_004:
	End

scr_seq_SC08R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLead 0x8000
	MonHasRibbon 0x800C, 0, 24
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0082
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_SC08R0101_00000
	// TODO Diamond ScrCmd_GetTotalPokemonEVs 0x233 args [32780, 32768]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 510
	GoToIf 0, _0077
	NPCMsg msg_1163_SC08R0101_00001
	GiveRibbon 0x8000, 24
	PlaySE SEQ_ME_LVUP
	BufferPlayersName 1
	NPCMsg msg_1163_SC08R0101_00002
	WaitSE SEQ_ME_LVUP
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_SC08R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0077:
	NPCMsg msg_1163_SC08R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0082:
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1163_SC08R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1163_SC08R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem 434, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D5
	NPCMsg msg_1163_SC08R0101_00007
	CallStd std_mart_intro
	CloseMsg
	Call _00E0
	ReleaseAll
	End

_00D5:
	NPCMsg msg_1163_SC08R0101_00008
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
	SealMart 0
	Return

_014D:
	SealMart 1
	Return

_0153:
	SealMart 2
	Return

_0159:
	SealMart 3
	Return

_015F:
	SealMart 4
	Return

_0165:
	SealMart 5
	Return

_016B:
	SealMart 6
	Return

scr_seq_SC08R0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1163_SC08R0101_00009
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
	NPCMsg msg_1163_SC08R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C5:
	NPCMsg msg_1163_SC08R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
