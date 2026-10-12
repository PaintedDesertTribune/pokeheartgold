#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0301.h"
#include "msgdata/msg/msg_1104_SC06R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0301_000
	ScrDef scr_seq_SC06R0301_001
	ScrDefEnd

scr_seq_SC06R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1104_SC06R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_284
	GoToIf 1, _00B3
	NPCMsg msg_1104_SC06R0301_00001
	// TODO Diamond ScrCmd_CheckBurmyForms 0x264 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0092
	CompareVarToValue 0x800C, 1
	GoToIf 1, _009D
	CompareVarToValue 0x800C, 2
	GoToIf 1, _009D
	NPCMsg msg_1104_SC06R0301_00004
	SetVar 0x8004, 215
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A8
	SetFlag FLAG_SINNOH_284
	CallStd std_obtain_item_verbose
	GoTo _00B3

_0092:
	NPCMsg msg_1104_SC06R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009D:
	NPCMsg msg_1104_SC06R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A8:
	NPCMsg msg_1104_SC06R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B3:
	NPCMsg msg_1104_SC06R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
