#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0301.h"
#include "msgdata/msg/msg_0955_SC04R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0301_000
	ScrDef scr_seq_SC04R0301_001
	ScrDef scr_seq_SC04R0301_002
	ScrDefEnd

scr_seq_SC04R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0955_SC04R0301_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0032
	GoTo _00B3

_0032:
	NPCMsg msg_0955_SC04R0301_00001
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
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BE
	// TODO Diamond ScrCmd_CheckPartyMonOTID 0x199 args [32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C9
	BufferPartyMonNick 0, 0x8005
	NPCMsg msg_0955_SC04R0301_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D9
	GoTo _00B3

_00B3:
	NPCMsg msg_0955_SC04R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_0955_SC04R0301_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	BufferPartyMonNick 0, 0x8005
	NPCMsg msg_0955_SC04R0301_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D9:
	NPCMsg msg_0955_SC04R0301_00003
	WaitButton
	CloseMsg
	SetVar 0x800C, 0
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_NamePokemonScreen 0x0bb args [32773, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0125
	// TODO unknown Diamond command ScrCmd_Unk02B8 (0x2b8); script truncated here
	End

_0125:
	BufferPartyMonNick 0, 0x8005
	NPCMsg msg_0955_SC04R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0301_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_134
	GoToIf 1, _01E0
	NPCMsg msg_0955_SC04R0301_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0164
	GoTo _01D5

_0164:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_OpenTradeScreen dropped: the trade screen is part of HeartGold's NPCTradeExec
	GetPartySelection 0x800C
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _01D5
	LoadNPCTrade 14
	CopyVar 0x8004, 0x800C
	GetPartyMonSpecies 0x8004, 0x8005
	NPCTradeGetReqSpecies 0x800C
	CompareVarToVar 0x8005, 0x800C
	GoToIf 5, _01C8
	NPCTradeExec 0x8004
	NPCTradeEnd
	SetFlag FLAG_SINNOH_134
	NPCMsg msg_0955_SC04R0301_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01C8:
	NPCTradeEnd
	NPCMsg msg_0955_SC04R0301_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01D5:
	NPCMsg msg_0955_SC04R0301_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E0:
	NPCMsg msg_0955_SC04R0301_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0301_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar 0x800C, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x800C, 4
	GoToIf 1, _0217
	GoTo _020C

_020C:
	NPCMsg msg_0955_SC04R0301_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0217:
	NPCMsg msg_0955_SC04R0301_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
