#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0102.h"
#include "msgdata/msg/msg_1179_SC10R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0102_000
	ScrDef scr_seq_SC10R0102_001
	ScrDef scr_seq_SC10R0102_002
	ScrDefEnd

scr_seq_SC10R0102_000:
	SetVar 0x4000, 0
	// Diamond ScrCmd_Unk025B dropped: Great Marsh observatory binoculars
	// Diamond ScrCmd_Unk025D dropped: Great Marsh observatory binoculars
	CompareVarToValue 0x4001, 0
	GoToIf 1, scr_seq_SC10R0102_001
	End

scr_seq_SC10R0102_001:
	SetVar 0x4000, 1
	End

scr_seq_SC10R0102_002:
	// Diamond ScrCmd_Unk025C dropped: Great Marsh observatory binoculars
	SetVar 0x4000, 1
	End


	.balign 4, 0
