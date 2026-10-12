#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C06R0102.h"
#include "msgdata/msg/msg_1106_C06R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C06R0102_000
	ScrDef scr_seq_C06R0102_001
	ScrDef scr_seq_C06R0102_002
	ScrDef scr_seq_C06R0102_003
	ScrDef scr_seq_C06R0102_004
	ScrDefEnd

scr_seq_C06R0102_000:
	PlayFanfare 1500
	LockAll
	ShowMoneyBox 20, 2
	NPCMsg msg_1106_C06R0102_00000
	YesNo 0x800C
	CloseMsg
	CompareVarToValue 0x800C, 0
	GoToIf 1, _003E
	HideMoneyBox
	ReleaseAll
	End

_003E:
	HasEnoughMoneyImmediate 0x800C, 100
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0063
	SubMoneyImmediate 100
	UpdateMoneyBox
	HideMoneyBox
	// TODO Diamond ScrCmd_UseGreatMarshBinoculars 0x206 args []: no HeartGold mapping yet
	ReleaseAll
	End

_0063:
	NPCMsg msg_1106_C06R0102_00001
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

scr_seq_C06R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1106_C06R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C06R0102_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1106_C06R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C06R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1106_C06R0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C06R0102_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1106_C06R0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
