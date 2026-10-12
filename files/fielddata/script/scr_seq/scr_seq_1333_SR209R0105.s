#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR209R0105.h"
#include "msgdata/msg/msg_1013_SR209R0105.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR209R0105_000
	ScrDef scr_seq_SR209R0105_001
	ScrDefEnd

scr_seq_SR209R0105_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_150
	GoToIf 1, _0036
	NPCMsg msg_1013_SR209R0105_00000
	SetVar 0x8004, 423
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	GoTo _0036

_0036:
	SetFlag FLAG_SINNOH_150
	CheckBadge 4, 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0062
	CompareVarToValue 0x8004, 1
	CallIf 1, _0067
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0062:
	NPCMsg msg_1013_SR209R0105_00001
	Return

_0067:
	NPCMsg msg_1013_SR209R0105_00002
	Return

scr_seq_SR209R0105_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_278
	GoToIf 1, _00B1
	NPCMsg msg_1013_SR209R0105_00003
	SetVar 0x8004, 224
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BC
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_278
	GoTo _00B1

_00B1:
	NPCMsg msg_1013_SR209R0105_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BC:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
