#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0108.h"
#include "msgdata/msg/msg_0942_SD25R0108.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD25R0108_000
	ScrDef scr_seq_SD25R0108_001
	ScrDef scr_seq_SD25R0108_002
	ScrDefEnd

scr_seq_SD25R0108_000:
	// TODO Diamond ScrCmd_Unk0292 0x292 args [25, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0022
	SetFlag FLAG_SINNOH_666
	End

_0022:
	ClearFlag FLAG_SINNOH_666
	SetVar VAR_SINNOH_4111, 1
	End

scr_seq_SD25R0108_001:
	LockAll
	ApplyMovement 1, mv_SD25R0108_004C
	WaitMovement
	SetFlag FLAG_SINNOH_666
	HidePerson 1
	SetVar VAR_SINNOH_4111, 0
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SD25R0108_004C:
	.short 65, 1
	.short 1, 1
	.short 65, 1
	.short 73, 1
	.short 13, 2
	.short 74, 1
	.short 69, 1
	EndMovement

scr_seq_SD25R0108_002:
	SetVar VAR_SPECIAL_x8008, 417
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
