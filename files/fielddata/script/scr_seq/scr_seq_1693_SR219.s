#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR219.h"
#include "msgdata/msg/msg_1193_SR219.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR219_000
	ScrDef scr_seq_SR219_001
	ScrDefEnd

scr_seq_SR219_000:
	DirectionSignpost msg_1193_SR219_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR219_001:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
