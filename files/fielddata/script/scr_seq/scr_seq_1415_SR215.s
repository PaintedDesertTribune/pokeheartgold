#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR215.h"
#include "msgdata/msg/msg_1054_SR215.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR215_000
	ScrDef scr_seq_SR215_001
	ScrDef scr_seq_SR215_002
	ScrDef scr_seq_SR215_003
	ScrDef scr_seq_SR215_004
	ScrDef scr_seq_SR215_005
	ScrDef scr_seq_SR215_006
	ScrDef scr_seq_SR215_007
	ScrDef scr_seq_SR215_008
	ScrDef scr_seq_SR215_009
	ScrDef scr_seq_SR215_010
	ScrDef scr_seq_SR215_011
	ScrDef scr_seq_SR215_012
	ScrDefEnd

scr_seq_SR215_006:
	SetVar 0x4000, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0069
	CompareVarToValue 0x4000, 1
	GoToIf 1, _007B
	CompareVarToValue 0x4000, 2
	GoToIf 1, _007B
	CompareVarToValue 0x4000, 3
	GoToIf 1, _007B
	CompareVarToValue 0x4000, 4
	GoToIf 1, _007B
	End

_0069:
	ClearFlag FLAG_SINNOH_657
	ClearFlag FLAG_SINNOH_659
	SetFlag FLAG_SINNOH_656
	SetFlag FLAG_SINNOH_658
	End

_007B:
	ClearFlag FLAG_SINNOH_656
	ClearFlag FLAG_SINNOH_658
	SetFlag FLAG_SINNOH_657
	SetFlag FLAG_SINNOH_659
	End

scr_seq_SR215_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1054_SR215_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR215_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_205
	GoToIf 1, _00E5
	NPCMsg msg_1054_SR215_00001
	SetVar 0x8004, 393
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F0
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_205
	GoTo _00E5

_00E5:
	NPCMsg msg_1054_SR215_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F0:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR215_002:
	DirectionSignpost msg_1054_SR215_00005, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR215_003:
	DirectionSignpost msg_1054_SR215_00006, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR215_007:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1054_SR215_00007, 0x800C
	CallStd std_signpost
	End

scr_seq_SR215_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1054_SR215_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR215_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1054_SR215_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR215_008:
	SetVar VAR_SPECIAL_x8008, 55
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR215_009:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR215_010:
	SetVar VAR_SPECIAL_x8008, 38
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR215_011:
	SetVar VAR_SPECIAL_x8008, 361
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR215_012:
	SetVar VAR_SPECIAL_x8008, 303
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
