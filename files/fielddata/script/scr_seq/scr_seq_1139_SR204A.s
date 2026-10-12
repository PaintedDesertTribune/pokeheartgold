#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR204A.h"
#include "msgdata/msg/msg_0916_SR204A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR204A_000
	ScrDef scr_seq_SR204A_001
	ScrDef scr_seq_SR204A_002
	ScrDef scr_seq_SR204A_003
	ScrDef scr_seq_SR204A_004
	ScrDef scr_seq_SR204A_005
	ScrDefEnd

scr_seq_SR204A_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0916_SR204A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR204A_001:
	DirectionSignpost msg_0916_SR204A_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR204A_002:
	DirectionSignpost msg_0916_SR204A_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR204A_003:
	SetVar VAR_SPECIAL_x8008, 254
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR204A_004:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR204A_005:
	SetVar VAR_SPECIAL_x8008, 22
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
