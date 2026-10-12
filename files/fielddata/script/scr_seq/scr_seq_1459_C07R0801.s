#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C07R0801.h"
#include "msgdata/msg/msg_1076_C07R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C07R0801_000
	ScrDef scr_seq_C07R0801_001
	ScrDef scr_seq_C07R0801_002
	ScrDefEnd

scr_seq_C07R0801_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2732
	GoToIf 1, _00D5
	NPCMsg msg_1076_C07R0801_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00EB
	NPCMsg msg_1076_C07R0801_00001
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x4000
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x4000, 255
	GoToIf 1, _00EB
	GetPartyMonSpecies 0x4000, 0x800C
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_00D5:
	NPCMsg msg_1076_C07R0801_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EB:
	NPCMsg msg_1076_C07R0801_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0801_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1076_C07R0801_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0801_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_1076_C07R0801_00010
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
