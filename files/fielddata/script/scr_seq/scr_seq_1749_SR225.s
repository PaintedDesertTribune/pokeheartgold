#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR225.h"
#include "msgdata/msg/msg_1221_SR225.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR225_000
	ScrDef scr_seq_SR225_001
	ScrDef scr_seq_SR225_002
	ScrDef scr_seq_SR225_003
	ScrDef scr_seq_SR225_004
	ScrDef scr_seq_SR225_005
	ScrDef scr_seq_SR225_006
	ScrDef scr_seq_SR225_007
	ScrDef scr_seq_SR225_008
	ScrDefEnd

scr_seq_SR225_000:
	DirectionSignpost msg_1221_SR225_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR225_001:
	DirectionSignpost msg_1221_SR225_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR225_002:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_003:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_004:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_005:
	SetVar VAR_SPECIAL_x8008, 255
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_006:
	SetVar VAR_SPECIAL_x8008, 324
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_007:
	SetVar VAR_SPECIAL_x8008, 109
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR225_008:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
