#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR221.h"
#include "msgdata/msg/msg_1195_SR221.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR221_000
	ScrDef scr_seq_SR221_001
	ScrDef scr_seq_SR221_002
	ScrDef scr_seq_SR221_003
	ScrDef scr_seq_SR221_004
	ScrDef scr_seq_SR221_005
	ScrDef scr_seq_SR221_006
	ScrDef scr_seq_SR221_007
	ScrDefEnd

scr_seq_SR221_003:
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _002C
	SetFlag FLAG_SINNOH_669
	SetFlag FLAG_SINNOH_670

_002C:
	End

scr_seq_SR221_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1195_SR221_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR221_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1195_SR221_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR221_002:
	DirectionSignpost msg_1195_SR221_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR221_004:
	SetVar VAR_SPECIAL_x8008, 46
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR221_005:
	SetVar VAR_SPECIAL_x8008, 408
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR221_006:
	SetVar VAR_SPECIAL_x8008, 94
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR221_007:
	SetVar VAR_SPECIAL_x8008, 320
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
