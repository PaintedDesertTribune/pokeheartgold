#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR228.h"
#include "msgdata/msg/msg_1238_SR228.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR228_000
	ScrDef scr_seq_SR228_001
	ScrDefEnd

scr_seq_SR228_000:
	DirectionSignpost msg_1238_SR228_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR228_001:
	DirectionSignpost msg_1238_SR228_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
