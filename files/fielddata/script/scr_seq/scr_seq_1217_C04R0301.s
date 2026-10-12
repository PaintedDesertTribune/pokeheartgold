#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04R0301.h"
#include "msgdata/msg/msg_0955_C04R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04R0301_000
	ScrDef scr_seq_C04R0301_001
	ScrDef scr_seq_C04R0301_002
	ScrDefEnd

scr_seq_C04R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0955_C04R0301_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0032
	GoTo _00B3

_0032:
	NPCMsg msg_0955_C04R0301_00001
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x800C
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _00B3
	CopyVar 0x8005, 0x800C
	GetPartyMonSpecies 0x8005, 0x800C
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_00B3:
	NPCMsg msg_0955_C04R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_134
	GoToIf 1, _01E0
	NPCMsg msg_0955_C04R0301_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0164
	GoTo _01D5

_0164:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_OpenTradeScreen 0x2a5 args []: no HeartGold mapping yet
	GetPartySelection 0x800C
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _01D5
	// TODO Diamond ScrCmd_NPCTradeInit 0x226 args [1]: no HeartGold mapping yet
	CopyVar 0x8004, 0x800C
	GetPartyMonSpecies 0x8004, 0x8005
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_01D5:
	NPCMsg msg_0955_C04R0301_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E0:
	NPCMsg msg_0955_C04R0301_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0301_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x800C, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x800C, 4
	GoToIf 1, _0217
	GoTo _020C

_020C:
	NPCMsg msg_0955_C04R0301_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0217:
	NPCMsg msg_0955_C04R0301_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
