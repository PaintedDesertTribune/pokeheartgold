#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C03R0102.h"
#include "msgdata/msg/msg_0900_C03R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C03R0102_000
	ScrDef scr_seq_C03R0102_001
	ScrDef scr_seq_C03R0102_002
	ScrDef scr_seq_C03R0102_003
	ScrDefEnd

scr_seq_C03R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0900_C03R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0900_C03R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03R0102_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_192
	GoToIf 1, _008C
	BufferItemName 0, 13
	NPCMsg msg_0900_C03R0102_00002
	SetVar 0x8004, 13
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0082
	SetFlag FLAG_SINNOH_192
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0082:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_008C:
	NPCMsg msg_0900_C03R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 54, 0
	NPCMsg msg_0900_C03R0102_00004
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
