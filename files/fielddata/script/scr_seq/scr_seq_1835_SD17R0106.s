#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0106.h"
#include "msgdata/msg/msg_1264_SD17R0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0106_000
	ScrDefEnd

scr_seq_SD17R0106_000:
	Call _0014
	// Diamond ScrCmd_Unk0285 dropped: Great Marsh area shuttle warp
	End

_0014:
	AddVar VAR_SINNOH_410C, 1
	Return


	.balign 4, 0
