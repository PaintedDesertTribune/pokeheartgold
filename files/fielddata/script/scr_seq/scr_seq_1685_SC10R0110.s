#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0110.h"
#include "msgdata/msg/msg_1189_SC10R0110.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0110_000
	ScrDef scr_seq_SC10R0110_001
	ScrDef scr_seq_SC10R0110_002
	ScrDefEnd

scr_seq_SC10R0110_000:
	SetVar 0x4000, 0
	// TODO Diamond ScrCmd_Unk025B 0x25b args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk025D 0x25d args [16385]: no HeartGold mapping yet
	CompareVarToValue 0x4001, 0
	GoToIf 1, scr_seq_SC10R0110_001
	End

scr_seq_SC10R0110_001:
	SetVar 0x4000, 1
	End

scr_seq_SC10R0110_002:
	// TODO Diamond ScrCmd_Unk025C 0x25c args []: no HeartGold mapping yet
	SetVar 0x4000, 1
	End


	.balign 4, 0
