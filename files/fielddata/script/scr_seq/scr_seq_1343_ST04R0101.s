#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST04R0101.h"
#include "msgdata/msg/msg_1018_ST04R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST04R0101_000
	ScrDef scr_seq_ST04R0101_001
	ScrDef scr_seq_ST04R0101_002
	ScrDefEnd

scr_seq_ST04R0101_000:
	CheckFlag FLAG_SINNOH_254
	CallIf 1, _001B
	End

_001B:
	ClearFlag FLAG_SINNOH_495
	Return

scr_seq_ST04R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0051
	NPCMsg msg_1018_ST04R0101_00000
	SetVar 0x8004, 8
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0051:
	NPCMsg msg_1018_ST04R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1018_ST04R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
