#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0801.h"
#include "msgdata/msg/msg_1076_SC07R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0801_000
	ScrDef scr_seq_SC07R0801_001
	ScrDef scr_seq_SC07R0801_002
	ScrDefEnd

scr_seq_SC07R0801_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2732
	GoToIf 1, _00D5
	NPCMsg msg_1076_SC07R0801_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00EB
	NPCMsg msg_1076_SC07R0801_00001
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
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E0
	NPCMsg msg_1076_SC07R0801_00003
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlayFanfare 1634
	WaitSE 1634
	FadeScreen 6, 1, 1, 0
	WaitFade
	BufferPartyMonNick 0, 0x4000
	NPCMsg msg_1076_SC07R0801_00004
	SetFlag FLAG_SINNOH_2732
	// TODO Diamond ScrCmd_AddPartyMonFriendship 0x1ba args [3, 16384]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk026C 0x26c args [32772]: no HeartGold mapping yet
	CompareVarToValue 0x8004, 65535
	GoToIf 1, _00F6
	NPCMsg msg_1076_SC07R0801_00007
	SetVar 0x8005, 1
	CallStd 2047 /* TODO Diamond std script */
	GoTo _00F6

_00D5:
	NPCMsg msg_1076_SC07R0801_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E0:
	NPCMsg msg_1076_SC07R0801_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EB:
	NPCMsg msg_1076_SC07R0801_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F6:
	NPCMsg msg_1076_SC07R0801_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0801_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1076_SC07R0801_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0801_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_1076_SC07R0801_00010
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
