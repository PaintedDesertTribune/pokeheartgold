#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0101.h"
#include "msgdata/msg/msg_0935_SD25R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD25R0101_000
	ScrDef scr_seq_SD25R0101_001
	ScrDefEnd

scr_seq_SD25R0101_000:
	SetFlag FLAG_SINNOH_2524
	End

scr_seq_SD25R0101_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0935_SD25R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
