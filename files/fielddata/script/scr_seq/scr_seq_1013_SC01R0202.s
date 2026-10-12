#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0202.h"
#include "msgdata/msg/msg_0853_SC01R0202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0202_000
	ScrDef scr_seq_SC01R0202_001
	ScrDef scr_seq_SC01R0202_002
	ScrDefEnd

scr_seq_SC01R0202_002:
	// TODO unknown Diamond command ScrCmd_Unk0238 (0x238); script truncated here
	End

scr_seq_SC01R0202_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0853_SC01R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0202_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_317
	GoToIf 1, _00A0
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	CallIf 1, _00B0
	CompareVarToValue 0x800C, 390
	CallIf 1, _00B8
	CompareVarToValue 0x800C, 393
	CallIf 1, _00C0
	CopyVar VAR_SINNOH_410A, 0x8004
	// Diamond ScrCmd_GetFashionNameWithArticle dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_0853_SC01R0202_00001
	SetVar 0x8005, 1
	// Diamond std call dropped: Contest accessory gift (dress-up dropped, decision 16)
	SetFlag FLAG_SINNOH_317
	CloseMsg
	ReleaseAll
	End

_00A0:
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_0853_SC01R0202_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B0:
	SetVar 0x8004, 92
	Return

_00B8:
	SetVar 0x8004, 93
	Return

_00C0:
	SetVar 0x8004, 94
	Return



	.balign 4, 0
