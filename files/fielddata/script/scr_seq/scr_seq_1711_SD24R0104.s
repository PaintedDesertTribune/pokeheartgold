#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD24R0104.h"
#include "msgdata/msg/msg_1202_SD24R0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD24R0104_000
	ScrDef scr_seq_SD24R0104_001
	ScrDef scr_seq_SD24R0104_002
	ScrDefEnd

scr_seq_SD24R0104_000:
	End


scr_seq_SD24R0104_001:
	SetVar VAR_SPECIAL_x8008, 39
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD24R0104_002:
	SetVar VAR_SPECIAL_x8008, 350
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
