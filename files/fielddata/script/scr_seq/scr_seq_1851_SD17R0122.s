#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0122.h"
#include "msgdata/msg/msg_1272_SD17R0122.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0122_000
	ScrDefEnd

scr_seq_SD17R0122_000:
	Call _0014
	// TODO Diamond ScrCmd_Unk0285 0x285 args [16651, 16652]: no HeartGold mapping yet
	End

_0014:
	AddVar VAR_SINNOH_410C, 1
	Return


	.balign 4, 0
