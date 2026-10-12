#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08GYM0102.h"
#include "msgdata/msg/msg_1161_SC08GYM0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08GYM0102_000
	ScrDef scr_seq_SC08GYM0102_001
	ScrDef scr_seq_SC08GYM0102_002
	ScrDef scr_seq_SC08GYM0102_003
	ScrDefEnd

scr_seq_SC08GYM0102_000:
	SetVar 0x4000, 0
	SinnohSunyshoreGymInit 1
	End

scr_seq_SC08GYM0102_001:
	SinnohSunyshoreGymRotate 0
	End

scr_seq_SC08GYM0102_002:
	SinnohSunyshoreGymRotate 1
	End

scr_seq_SC08GYM0102_003:
	End



	.balign 4, 0
