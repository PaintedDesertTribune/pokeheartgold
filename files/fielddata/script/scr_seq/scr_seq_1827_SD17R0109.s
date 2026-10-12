#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0109.h"
#include "msgdata/msg/msg_1260_SD17R0109.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0109_000
	ScrDefEnd

scr_seq_SD17R0109_000:
	AddVar VAR_SINNOH_410C, 1
	// TODO Diamond ScrCmd_Unk0285 0x285 args [16651, 16652]: no HeartGold mapping yet
	End


	.balign 4, 0
