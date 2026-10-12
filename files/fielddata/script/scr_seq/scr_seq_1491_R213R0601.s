#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R213R0601.h"
#include "msgdata/msg/msg_1092_R213R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R213R0601_000
	ScrDef scr_seq_R213R0601_001
	ScrDefEnd

scr_seq_R213R0601_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 5, _003A
	NPCMsg msg_1092_R213R0601_00000
	SetVar 0x8004, 14
	CallStd 2009 /* TODO Diamond std script */
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003A:
	NPCMsg msg_1092_R213R0601_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R213R0601_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 5, _0071
	GoTo _0066

_0066:
	NPCMsg msg_1092_R213R0601_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0071:
	NPCMsg msg_1092_R213R0601_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
