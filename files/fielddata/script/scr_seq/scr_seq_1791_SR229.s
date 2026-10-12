#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR229.h"
#include "msgdata/msg/msg_1242_SR229.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR229_000
	ScrDef scr_seq_SR229_001
	ScrDefEnd

scr_seq_SR229_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_218
	GoToIf 1, _004F
	NPCMsg msg_1242_SR229_00000
	SetVar 0x8004, 92
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005A
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_218
	GoTo _004F

_004F:
	NPCMsg msg_1242_SR229_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005A:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR229_001:
	DirectionSignpost msg_1242_SR229_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
