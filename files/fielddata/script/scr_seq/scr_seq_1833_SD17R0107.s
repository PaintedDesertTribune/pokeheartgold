#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0107.h"
#include "msgdata/msg/msg_1263_SD17R0107.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0107_000
	ScrDefEnd

scr_seq_SD17R0107_000:
	Call _0014
	// Diamond ScrCmd_Unk0285 dropped: Great Marsh area shuttle warp
	End

_0014:
	AddVar VAR_SINNOH_410C, 1
	Return


	.balign 4, 0
