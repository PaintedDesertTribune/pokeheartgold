#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD15R0101.h"
#include "msgdata/msg/msg_1206_SD15R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD15R0101_000
	ScrDef scr_seq_SD15R0101_001
	ScrDef scr_seq_SD15R0101_002
	ScrDefEnd

scr_seq_SD15R0101_000:
	End

scr_seq_SD15R0101_001:
	LockAll
	PlayFanfare SEQ_SE_DP_SELECT
	WaitSE SEQ_SE_DP_SELECT
	// Diamond ScrCmd_ShowPokemonPic dropped: Diamond's in-field Pokémon portrait window has no HeartGold script command
	WaitButton
	// TODO Diamond ScrCmd_Unk0209 0x209 args []: no HeartGold mapping yet
	PlayCry 488, 0
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	CallIf 1, _0069
	Release 0
	// TODO Diamond ScrCmd_BlinkEvent 0x26a args [0, 6, 8]: no HeartGold mapping yet
	Lock 0
	SetFlag FLAG_SINNOH_621
	HidePerson 0
	ClearFlag FLAG_SINNOH_1078
	ShowPerson 1
	// TODO Diamond ScrCmd_CreateRoamer 0x21c args [1]: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_287
	NPCMsg msg_1206_SD15R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0069:
	MovePerson 1, 16, 14
	ApplyMovement 0, mv_SD15R0101_0080
	WaitMovement
	Return

	.balign 4, 0
mv_SD15R0101_0080:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	EndMovement

scr_seq_SD15R0101_002:
	SetVar VAR_SPECIAL_x8008, 453
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
