#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0117.h"
#include "msgdata/msg/msg_1276_SD17R0117.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0117_000
	ScrDefEnd

scr_seq_SD17R0117_000:
	AddVar VAR_SINNOH_410C, 1
	// Diamond ScrCmd_Unk0285 dropped: Great Marsh area shuttle warp
	End



	.balign 4, 0
