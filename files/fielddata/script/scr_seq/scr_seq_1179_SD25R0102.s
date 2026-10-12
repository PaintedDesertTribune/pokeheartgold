#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0102.h"
#include "msgdata/msg/msg_0936_SD25R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD25R0102_000
	ScrDef scr_seq_SD25R0102_001
	ScrDefEnd

scr_seq_SD25R0102_000:
	// TODO Diamond ScrCmd_Unk0292 0x292 args [10, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0022
	SetFlag FLAG_SINNOH_665
	End

_0022:
	ClearFlag FLAG_SINNOH_665
	SetVar VAR_SINNOH_4110, 1
	End

scr_seq_SD25R0102_001:
	LockAll
	ApplyMovement obj_player, mv_SD25R0102_0054
	ApplyMovement 0, mv_SD25R0102_0064
	WaitMovement
	SetFlag FLAG_SINNOH_665
	HidePerson 0
	SetVar VAR_SINNOH_4110, 0
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SD25R0102_0054:
	.short 12, 1
	.short 66, 1
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SD25R0102_0064:
	.short 63, 1
	.short 2, 1
	.short 65, 1
	.short 73, 1
	.short 14, 10
	.short 74, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
