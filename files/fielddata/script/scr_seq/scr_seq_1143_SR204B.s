#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR204B.h"
#include "msgdata/msg/msg_0918_SR204B.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR204B_000
	ScrDef scr_seq_SR204B_001
	ScrDef scr_seq_SR204B_002
	ScrDef scr_seq_SR204B_003
	ScrDef scr_seq_SR204B_004
	ScrDefEnd

scr_seq_SR204B_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0918_SR204B_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR204B_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_197
	GoToIf 1, _0066
	NPCMsg msg_0918_SR204B_00001
	SetVar 0x8004, 405
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0071
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_197
	GoTo _0066

_0066:
	NPCMsg msg_0918_SR204B_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0071:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR204B_002:
	DirectionSignpost msg_0918_SR204B_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR204B_003:
	SetVar VAR_SPECIAL_x8008, 336
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR204B_004:
	SetVar VAR_SPECIAL_x8008, 21
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
