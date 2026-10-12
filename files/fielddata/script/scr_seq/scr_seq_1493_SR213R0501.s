#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR213R0501.h"
#include "msgdata/msg/msg_1093_SR213R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR213R0501_000
	ScrDef scr_seq_SR213R0501_001
	ScrDef scr_seq_SR213R0501_002
	ScrDefEnd

scr_seq_SR213R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_202
	GoToIf 1, _0053
	NPCMsg msg_1093_SR213R0501_00000
	SetVar 0x8004, 419
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005E
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_202
	GoTo _0053

_0053:
	NPCMsg msg_1093_SR213R0501_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_353
	GoToIf 1, _012F
	SetFlag FLAG_SINNOH_353
	NPCMsg msg_1093_SR213R0501_00002
	Random 0x800C, 10
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0103
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0103
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0103
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0103
	CompareVarToValue 0x800C, 4
	GoToIf 1, _010E
	CompareVarToValue 0x800C, 5
	GoToIf 1, _010E
	CompareVarToValue 0x800C, 6
	GoToIf 1, _010E
	CompareVarToValue 0x800C, 7
	GoToIf 1, _0119
	CompareVarToValue 0x800C, 8
	GoToIf 1, _0119
	GoTo _0124

_0103:
	NPCMsg msg_1093_SR213R0501_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010E:
	NPCMsg msg_1093_SR213R0501_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0119:
	NPCMsg msg_1093_SR213R0501_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0124:
	NPCMsg msg_1093_SR213R0501_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012F:
	NPCMsg msg_1093_SR213R0501_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213R0501_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1093_SR213R0501_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
