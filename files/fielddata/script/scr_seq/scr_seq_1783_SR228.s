#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR228.h"
#include "msgdata/msg/msg_1238_SR228.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR228_000
	ScrDef scr_seq_SR228_001
	ScrDef scr_seq_SR228_002
	ScrDef scr_seq_SR228_003
	ScrDef scr_seq_SR228_004
	ScrDef scr_seq_SR228_005
	ScrDef scr_seq_SR228_006
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


scr_seq_SR228_002:
	SetVar VAR_SPECIAL_x8008, 321
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR228_003:
	SetVar VAR_SPECIAL_x8008, 47
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR228_004:
	SetVar VAR_SPECIAL_x8008, 107
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR228_005:
	SetVar VAR_SPECIAL_x8008, 295
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR228_006:
	SetVar VAR_SPECIAL_x8008, 364
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
