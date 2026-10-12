#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD24R0103.h"
#include "msgdata/msg/msg_1201_SD24R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD24R0103_000
	ScrDef scr_seq_SD24R0103_001
	ScrDef scr_seq_SD24R0103_002
	ScrDef scr_seq_SD24R0103_003
	ScrDefEnd

scr_seq_SD24R0103_000:
	// Diamond ScrCmd_Unk025B dropped: Great Marsh observatory binoculars
	End

scr_seq_SD24R0103_001:
	// Diamond ScrCmd_Unk025C dropped: Great Marsh observatory binoculars
	End


scr_seq_SD24R0103_002:
	SetVar VAR_SPECIAL_x8008, 76
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD24R0103_003:
	SetVar VAR_SPECIAL_x8008, 78
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
