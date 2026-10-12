#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR228R0201.h"
#include "msgdata/msg/msg_1239_SR228R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR228R0201_000
	ScrDef scr_seq_SR228R0201_001
	ScrDefEnd

scr_seq_SR228R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_264
	GoToIf 1, _003B
	SetFlag FLAG_SINNOH_264
	NPCMsg msg_1239_SR228R0201_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0055
	GoTo _028F

_003B:
	NPCMsg msg_1239_SR228R0201_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0055
	GoTo _028F

_0055:
	NPCMsg msg_1239_SR228R0201_00002
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8000, 255
	GoToIf 1, _028F
	GetPartyMonSpecies 0x8000, 0x8001
	// TODO unknown Diamond command cmd_8001 (0x8001); script truncated here
	End

_028F:
	NPCMsg msg_1239_SR228R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR228R0201_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1239_SR228R0201_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
