#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR222R0201.h"
#include "msgdata/msg/msg_1154_SR222R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR222R0201_000
	ScrDef scr_seq_SR222R0201_001
	ScrDefEnd

scr_seq_SR222R0201_000:
	SetFlag FLAG_SINNOH_2544
	End

scr_seq_SR222R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	PlayerHasSpecies 0x800C, 223
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D1
	NPCMsg msg_1154_SR222R0201_00001
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8002, 255
	GoToIf 1, _0120
	GetPartyMonSpecies 0x8002, 0x8001
	CompareVarToValue 0x8001, 223
	GoToIf 5, _010A
	// TODO Diamond ScrCmd_CheckPokemonSizeRecord 0x1c1 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00EF
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00DC
	// TODO Diamond ScrCmd_BufferPartyPokemonSize 0x1c3 args [0, 1, 32770]: no HeartGold mapping yet
	NPCMsg msg_1154_SR222R0201_00002
	SetVar 0x8004, 6
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0115
	CallStd std_obtain_item_verbose
	// TODO Diamond ScrCmd_SetPokemonSizeRecord 0x1c2 args [32770]: no HeartGold mapping yet
	NPCMsg msg_1154_SR222R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D1:
	NPCMsg msg_1154_SR222R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DC:
	// TODO Diamond ScrCmd_BufferPokemonRecordSize 0x1c4 args [0, 1, 223]: no HeartGold mapping yet
	NPCMsg msg_1154_SR222R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EF:
	// TODO Diamond ScrCmd_BufferPartyPokemonSize 0x1c3 args [0, 1, 32770]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_BufferPokemonRecordSize 0x1c4 args [2, 3, 223]: no HeartGold mapping yet
	NPCMsg msg_1154_SR222R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010A:
	NPCMsg msg_1154_SR222R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0115:
	NPCMsg msg_1154_SR222R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0120:
	NPCMsg msg_1154_SR222R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
