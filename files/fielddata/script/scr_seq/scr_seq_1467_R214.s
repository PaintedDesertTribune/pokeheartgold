#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R214.h"
#include "msgdata/msg/msg_1080_R214.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R214_000
	ScrDef scr_seq_R214_001
	ScrDef scr_seq_R214_002
	ScrDef scr_seq_R214_003
	ScrDefEnd

scr_seq_R214_003:
	// TODO Diamond ScrCmd_CountSeenUnown 0x284 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 26
	GoToIf 4, _003F
	CompareVarToValue 0x4000, 10
	GoToIf 4, _0051
	CompareVarToValue 0x4000, 10
	GoToIf 0, _0063
	End

_003F:
	MoveWarp 2, 710, 670
	MoveWarp 3, 710, 670
	End

_0051:
	MoveWarp 2, 710, 670
	MoveWarp 4, 710, 670
	End

_0063:
	MoveWarp 3, 710, 670
	MoveWarp 4, 710, 670
	End

scr_seq_R214_002:
	// TODO Diamond ScrCmd_CountSeenUnown 0x284 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 26
	GoToIf 4, _003F
	CompareVarToValue 0x4000, 10
	GoToIf 4, _0051
	CompareVarToValue 0x4000, 10
	GoToIf 0, _0063
	End

scr_seq_R214_000:
	DirectionSignpost msg_1080_R214_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R214_001:
	DirectionSignpost msg_1080_R214_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
