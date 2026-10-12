#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0201.h"
#include "msgdata/msg/msg_1060_SC07R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0201_000
	ScrDef scr_seq_SC07R0201_001
	ScrDef scr_seq_SC07R0201_002
	ScrDef scr_seq_SC07R0201_003
	ScrDef scr_seq_SC07R0201_004
	ScrDef scr_seq_SC07R0201_005
	ScrDef scr_seq_SC07R0201_006
	ScrDef scr_seq_SC07R0201_007
	ScrDefEnd

scr_seq_SC07R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1060_SC07R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1060_SC07R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0201_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1060_SC07R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0201_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 8
	ReleaseAll
	End

scr_seq_SC07R0201_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 9
	ReleaseAll
	End

scr_seq_SC07R0201_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1060_SC07R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0201_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1060_SC07R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0201_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_297
	GoToIf 1, _0109
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	CallIf 1, _0119
	CompareVarToValue 0x800C, 390
	CallIf 1, _0121
	CompareVarToValue 0x800C, 393
	CallIf 1, _0129
	CopyVar VAR_SINNOH_4107, 0x8004
	// Diamond ScrCmd_GetFashionNameWithArticle dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_1060_SC07R0201_00003
	SetVar 0x8005, 1
	CallStd 2015 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_297
	CloseMsg
	ReleaseAll
	End

_0109:
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_1060_SC07R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0119:
	SetVar 0x8004, 94
	Return

_0121:
	SetVar 0x8004, 92
	Return

_0129:
	SetVar 0x8004, 93
	Return


	.balign 4, 0
