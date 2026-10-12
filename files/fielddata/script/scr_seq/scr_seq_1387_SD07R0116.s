#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD07R0116.h"
#include "msgdata/msg/msg_1040_SD07R0116.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD07R0116_000
	ScrDef scr_seq_SD07R0116_001
	ScrDef scr_seq_SD07R0116_002
	ScrDef scr_seq_SD07R0116_003
	ScrDef scr_seq_SD07R0116_004
	ScrDefEnd

scr_seq_SD07R0116_000:
	PlayFanfare 1500
	LockAll
	// TODO Diamond ScrCmd_MessageUnown 0x26d args [0]: no HeartGold mapping yet
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD07R0116_001:
	SetVar VAR_SPECIAL_x8008, 307
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD07R0116_002:
	SetVar VAR_SPECIAL_x8008, 314
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD07R0116_003:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD07R0116_004:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
