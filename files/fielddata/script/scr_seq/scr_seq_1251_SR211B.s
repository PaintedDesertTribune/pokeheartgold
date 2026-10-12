#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR211B.h"
#include "msgdata/msg/msg_0972_SR211B.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR211B_000
	ScrDef scr_seq_SR211B_001
	ScrDef scr_seq_SR211B_002
	ScrDef scr_seq_SR211B_003
	ScrDef scr_seq_SR211B_004
	ScrDefEnd

scr_seq_SR211B_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_198
	GoToIf 1, _0066
	NPCMsg msg_0972_SR211B_00000
	CloseMsg
	FacePlayer
	ApplyMovement 0x800D, mv_SR211B_0080
	WaitMovement
	NPCMsg msg_0972_SR211B_00001
	SetVar 0x8004, 404
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0073
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_198
	GoTo _0066

_0066:
	FacePlayer
	NPCMsg msg_0972_SR211B_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0073:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR211B_001:
	DirectionSignpost msg_0972_SR211B_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR211B_002:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0972_SR211B_00004, 0x800C
	CallStd std_signpost
	End

scr_seq_SR211B_003:
	DirectionSignpost msg_0972_SR211B_00005, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SR211B_0080:
	.short 75, 1
	EndMovement

scr_seq_SR211B_004:
	SetVar VAR_SPECIAL_x8008, 356
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
