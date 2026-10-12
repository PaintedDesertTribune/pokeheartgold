#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T04R0101.h"
#include "msgdata/msg/msg_1018_T04R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T04R0101_000
	ScrDef scr_seq_T04R0101_001
	ScrDef scr_seq_T04R0101_002
	ScrDefEnd

scr_seq_T04R0101_000:
	CheckFlag FLAG_SINNOH_254
	CallIf 1, _001B
	End

_001B:
	ClearFlag FLAG_SINNOH_495
	Return

scr_seq_T04R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0051
	NPCMsg msg_1018_T04R0101_00000
	SetVar 0x8004, 8
	CallStd 2009 /* TODO Diamond std script */
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0051:
	NPCMsg msg_1018_T04R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04R0101_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1018_T04R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
