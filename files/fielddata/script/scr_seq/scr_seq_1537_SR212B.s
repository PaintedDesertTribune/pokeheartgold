#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR212B.h"
#include "msgdata/msg/msg_1115_SR212B.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR212B_000
	ScrDef scr_seq_SR212B_001
	ScrDef scr_seq_SR212B_002
	ScrDef scr_seq_SR212B_003
	ScrDef scr_seq_SR212B_004
	ScrDef scr_seq_SR212B_005
	ScrDef scr_seq_SR212B_006
	ScrDef scr_seq_SR212B_007
	ScrDef scr_seq_SR212B_008
	ScrDef scr_seq_SR212B_009
	ScrDef scr_seq_SR212B_010
	ScrDef scr_seq_SR212B_011
	ScrDef scr_seq_SR212B_012
	ScrDef scr_seq_SR212B_013
	ScrDef scr_seq_SR212B_014
	ScrDefEnd

scr_seq_SR212B_006:
	SetVar 0x4000, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0069
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0069
	CompareVarToValue 0x4000, 2
	GoToIf 1, _0069
	CompareVarToValue 0x4000, 3
	GoToIf 1, _0073
	CompareVarToValue 0x4000, 4
	GoToIf 1, _0073
	End

_0069:
	ClearFlag FLAG_SINNOH_646
	SetFlag FLAG_SINNOH_647
	End

_0073:
	ClearFlag FLAG_SINNOH_647
	SetFlag FLAG_SINNOH_646
	End

scr_seq_SR212B_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1115_SR212B_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212B_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1115_SR212B_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212B_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1115_SR212B_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212B_003:
	DirectionSignpost msg_1115_SR212B_00004, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR212B_004:
	DirectionSignpost msg_1115_SR212B_00005, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR212B_007:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1115_SR212B_00006, 0x800C
	CallStd std_signpost
	End

scr_seq_SR212B_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1115_SR212B_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR212B_008:
	SetVar VAR_SPECIAL_x8008, 18
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_009:
	SetVar VAR_SPECIAL_x8008, 411
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_010:
	SetVar VAR_SPECIAL_x8008, 389
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_011:
	SetVar VAR_SPECIAL_x8008, 52
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_012:
	SetVar VAR_SPECIAL_x8008, 61
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_013:
	SetVar VAR_SPECIAL_x8008, 333
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR212B_014:
	SetVar VAR_SPECIAL_x8008, 28
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
