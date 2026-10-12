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
	// Diamond ScrCmd_InitSunyshoreGym dropped: Sunyshore Gym gears: the gear rooms are walkable without them (collision only closes with the gear hook); gear models and rotation menu not ported yet
	End

scr_seq_SC08GYM0102_001:
	// Diamond ScrCmd_RotateSunyshoreGymGear dropped: Sunyshore Gym gear rotation menu not ported yet (gyms stays walkable)
	End

scr_seq_SC08GYM0102_002:
	// Diamond ScrCmd_RotateSunyshoreGymGear dropped: Sunyshore Gym gear rotation menu not ported yet (gyms stays walkable)
	End

scr_seq_SC08GYM0102_003:
	End



	.balign 4, 0
