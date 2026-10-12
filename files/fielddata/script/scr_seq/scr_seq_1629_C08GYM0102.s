#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C08GYM0102.h"
#include "msgdata/msg/msg_1161_C08GYM0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C08GYM0102_000
	ScrDef scr_seq_C08GYM0102_001
	ScrDef scr_seq_C08GYM0102_002
	ScrDef scr_seq_C08GYM0102_003
	ScrDefEnd

scr_seq_C08GYM0102_000:
	SetVar 0x4000, 0
	// TODO Diamond ScrCmd_InitSunyshoreGym 0x175 args [1]: no HeartGold mapping yet
	End

scr_seq_C08GYM0102_001:
	// TODO Diamond ScrCmd_RotateSunyshoreGymGear 0x176 args [0]: no HeartGold mapping yet
	End

scr_seq_C08GYM0102_002:
	// TODO Diamond ScrCmd_RotateSunyshoreGymGear 0x176 args [1]: no HeartGold mapping yet
	End

scr_seq_C08GYM0102_003:
	End


	.balign 4, 0
