#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR213.h"
#include "msgdata/msg/msg_1088_SR213.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR213_000
	ScrDef scr_seq_SR213_001
	ScrDef scr_seq_SR213_002
	ScrDef scr_seq_SR213_003
	ScrDef scr_seq_SR213_004
	ScrDef scr_seq_SR213_005
	ScrDef scr_seq_SR213_006
	ScrDef scr_seq_SR213_007
	ScrDefEnd

scr_seq_SR213_000:
	CheckFlag FLAG_SINNOH_260
	GoToIf 0, _002F
	End

_002F:
	CheckBadge 3, 0x4000
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0044
	End

_0044:
	CheckFlag FLAG_SINNOH_259
	GoToIf 1, _0051
	End

_0051:
	ClearFlag FLAG_SINNOH_568
	End

scr_seq_SR213_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1088_SR213_00000
	CloseMsg
	FacePlayer
	ApplyMovement 30, mv_SR213_00C4
	WaitMovement
	NPCMsg msg_1088_SR213_00001
	CloseMsg
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 1
	GoToIf 1, _0093
	CompareVarToValue 0x8004, 3
	GoToIf 1, _00A3
	End

_0093:
	ApplyMovement 30, mv_SR213_00CC
	WaitMovement
	GoTo _00B3

_00A3:
	ApplyMovement 30, mv_SR213_00DC
	WaitMovement
	GoTo _00B3

_00B3:
	HidePerson 30
	SetFlag FLAG_SINNOH_260
	ClearFlag FLAG_SINNOH_569
	ReleaseAll
	End

scr_seq_SR213_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1088_SR213_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1088_SR213_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1088_SR213_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213_005:
	DirectionSignpost msg_1088_SR213_00005, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR213_006:
	DirectionSignpost msg_1088_SR213_00006, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR213_007:
	DirectionSignpost msg_1088_SR213_00007, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SR213_00C4:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR213_00CC:
	.short 18, 1
	.short 16, 2
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SR213_00DC:
	.short 16, 2
	.short 19, 9
	EndMovement

	.balign 4, 0
