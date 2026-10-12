#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR218.h"
#include "msgdata/msg/msg_0843_SR218.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR218_000
	ScrDef scr_seq_SR218_001
	ScrDef scr_seq_SR218_002
	ScrDef scr_seq_SR218_003
	ScrDefEnd

scr_seq_SR218_000:
	DirectionSignpost msg_0843_SR218_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR218_001:
	DirectionSignpost msg_0843_SR218_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR218_002:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR218_003:
	SetVar VAR_SPECIAL_x8008, 94
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
