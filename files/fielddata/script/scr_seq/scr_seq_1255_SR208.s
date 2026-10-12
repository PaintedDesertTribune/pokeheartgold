#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR208.h"
#include "msgdata/msg/msg_0974_SR208.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR208_000
	ScrDef scr_seq_SR208_001
	ScrDef scr_seq_SR208_002
	ScrDef scr_seq_SR208_003
	ScrDef scr_seq_SR208_004
	ScrDefEnd

scr_seq_SR208_000:
	DirectionSignpost msg_0974_SR208_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR208_001:
	DirectionSignpost msg_0974_SR208_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR208_002:
	DirectionSignpost msg_0974_SR208_00004, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR208_004:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0974_SR208_00005, 0x800C
	CallStd std_signpost
	End

scr_seq_SR208_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_319
	GoToIf 1, _00B5
	NPCMsg msg_0974_SR208_00000
	SetVar 0x8004, 111
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00C0
	SetFlag FLAG_SINNOH_319
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_00B5:
	NPCMsg msg_0974_SR208_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C0:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
