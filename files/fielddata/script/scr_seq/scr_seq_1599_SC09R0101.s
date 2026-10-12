#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC09R0101.h"
#include "msgdata/msg/msg_1146_SC09R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC09R0101_000
	ScrDef scr_seq_SC09R0101_001
	ScrDefEnd

scr_seq_SC09R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_244
	GoToIf 1, _0028
	NPCMsg msg_1146_SC09R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0028:
	NPCMsg msg_1146_SC09R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_244
	GoToIf 1, _00DC
	NPCMsg msg_1146_SC09R0101_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	GoTo _00D1

_0060:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_OpenTradeScreen dropped: Diamond in-game trades need their trade table imported
	GetPartySelection 0x800C
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _00D1
	// Diamond ScrCmd_NPCTradeInit dropped: Diamond in-game trades need their trade table imported
	CopyVar 0x8004, 0x800C
	GetPartyMonSpecies 0x8004, 0x8005
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_00D1:
	NPCMsg msg_1146_SC09R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DC:
	NPCMsg msg_1146_SC09R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
