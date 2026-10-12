#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR222.h"
#include "msgdata/msg/msg_1152_SR222.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR222_000
	ScrDef scr_seq_SR222_001
	ScrDef scr_seq_SR222_002
	ScrDef scr_seq_SR222_003
	ScrDef scr_seq_SR222_004
	ScrDef scr_seq_SR222_005
	ScrDef scr_seq_SR222_006
	ScrDef scr_seq_SR222_007
	ScrDef scr_seq_SR222_008
	ScrDef scr_seq_SR222_009
	ScrDefEnd

scr_seq_SR222_007:
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
	ClearFlag FLAG_SINNOH_648
	SetFlag FLAG_SINNOH_649
	End

_0073:
	ClearFlag FLAG_SINNOH_649
	SetFlag FLAG_SINNOH_648
	End

scr_seq_SR222_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_206
	GoToIf 1, _00C2
	NPCMsg msg_1152_SR222_00001
	SetVar 0x8004, 383
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CD
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_206
	GoTo _00C2

_00C2:
	NPCMsg msg_1152_SR222_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1152_SR222_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222_002:
	DirectionSignpost msg_1152_SR222_00005, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR222_003:
	DirectionSignpost msg_1152_SR222_00006, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR222_004:
	DirectionSignpost msg_1152_SR222_00007, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR222_005:
	DirectionSignpost msg_1152_SR222_00008, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR222_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1152_SR222_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR222_008:
	SetVar VAR_SPECIAL_x8008, 94
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR222_009:
	SetVar VAR_SPECIAL_x8008, 48
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
