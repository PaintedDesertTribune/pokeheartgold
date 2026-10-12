#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR210B.h"
#include "msgdata/msg/msg_1044_SR210B.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR210B_000
	ScrDef scr_seq_SR210B_001
	ScrDef scr_seq_SR210B_002
	ScrDef scr_seq_SR210B_003
	ScrDef scr_seq_SR210B_004
	ScrDef scr_seq_SR210B_005
	ScrDefEnd

scr_seq_SR210B_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1044_SR210B_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR210B_001:
	DirectionSignpost msg_1044_SR210B_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR210B_002:
	DirectionSignpost msg_1044_SR210B_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR210B_003:
	SetVar VAR_SPECIAL_x8008, 228
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR210B_004:
	SetVar VAR_SPECIAL_x8008, 317
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR210B_005:
	SetVar VAR_SPECIAL_x8008, 357
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
