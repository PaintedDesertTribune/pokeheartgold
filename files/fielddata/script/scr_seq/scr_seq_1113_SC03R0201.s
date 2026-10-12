#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0201.h"
#include "msgdata/msg/msg_0903_SC03R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0201_000
	ScrDef scr_seq_SC03R0201_001
	ScrDefEnd

scr_seq_SC03R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_133
	GoToIf 1, _00B3
	NPCMsg msg_0903_SC03R0201_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0037
	GoTo _00A8

_0037:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_OpenTradeScreen 0x2a5 args []: no HeartGold mapping yet
	GetPartySelection 0x800C
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _00A8
	// TODO Diamond ScrCmd_NPCTradeInit 0x226 args [0]: no HeartGold mapping yet
	CopyVar 0x8004, 0x800C
	GetPartyMonSpecies 0x8004, 0x8005
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_00A8:
	NPCMsg msg_0903_SC03R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B3:
	NPCMsg msg_0903_SC03R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0903_SC03R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
