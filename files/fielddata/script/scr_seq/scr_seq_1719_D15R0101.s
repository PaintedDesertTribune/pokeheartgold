#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D15R0101.h"
#include "msgdata/msg/msg_1206_D15R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D15R0101_000
	ScrDef scr_seq_D15R0101_001
	ScrDefEnd

scr_seq_D15R0101_000:
	End

scr_seq_D15R0101_001:
	LockAll
	PlayFanfare 1500
	WaitSE 1500
	// TODO Diamond ScrCmd_ShowPokemonPic 0x208 args [488, 1]: no HeartGold mapping yet
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
	NPCMsg msg_1206_D15R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0069:
	MovePerson 1, 16, 14
	ApplyMovement 0, mv_D15R0101_0080
	WaitMovement
	Return

	.balign 4, 0
mv_D15R0101_0080:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
