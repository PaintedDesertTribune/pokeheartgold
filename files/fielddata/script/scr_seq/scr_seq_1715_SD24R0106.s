#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD24R0106.h"
#include "msgdata/msg/msg_1204_SD24R0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD24R0106_000
	ScrDef scr_seq_SD24R0106_001
	ScrDef scr_seq_SD24R0106_002
	ScrDef scr_seq_SD24R0106_003
	ScrDefEnd

scr_seq_SD24R0106_000:
	// Diamond ScrCmd_Unk025B dropped: Great Marsh observatory binoculars
	End

scr_seq_SD24R0106_001:
	// Diamond ScrCmd_Unk025C dropped: Great Marsh observatory binoculars
	End

scr_seq_SD24R0106_002:
	End


scr_seq_SD24R0106_003:
	SetVar VAR_SPECIAL_x8008, 107
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
