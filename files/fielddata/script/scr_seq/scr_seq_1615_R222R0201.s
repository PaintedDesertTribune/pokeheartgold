#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R222R0201.h"
#include "msgdata/msg/msg_1154_R222R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R222R0201_000
	ScrDef scr_seq_R222R0201_001
	ScrDefEnd

scr_seq_R222R0201_000:
	SetFlag FLAG_SINNOH_2544
	End

scr_seq_R222R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	PlayerHasSpecies 0x800C, 223
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D1
	NPCMsg msg_1154_R222R0201_00001
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8002
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8002, 255
	GoToIf 1, _0120
	GetPartyMonSpecies 0x8002, 0x8001
	// TODO unknown Diamond command cmd_8001 (0x8001); script truncated here
	End

_00D1:
	NPCMsg msg_1154_R222R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0120:
	NPCMsg msg_1154_R222R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
