#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02R0301.h"
#include "msgdata/msg/msg_0838_SC02R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02R0301_000
	ScrDefEnd

scr_seq_SC02R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _0026
	NPCMsg msg_0838_SC02R0301_00000
	SetFlag FLAG_SINNOH_1
	GoTo _0026

_0026:
	NPCMsg msg_0838_SC02R0301_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0049
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0130
	End

_0049:
	NPCMsg msg_0838_SC02R0301_00002
	CloseMsg
	GoTo _0054

_0054:
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8002, 255
	GoToIf 1, _0130
	GetPartyMonSpecies 0x8002, 0x8001
	// TODO unknown Diamond command cmd_8001 (0x8001); script truncated here
	End

_0130:
	NPCMsg msg_0838_SC02R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
