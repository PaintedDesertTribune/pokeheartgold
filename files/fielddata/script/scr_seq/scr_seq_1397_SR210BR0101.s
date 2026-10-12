#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR210BR0101.h"
#include "msgdata/msg/msg_1045_SR210BR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR210BR0101_000
	ScrDef scr_seq_SR210BR0101_001
	ScrDefEnd

scr_seq_SR210BR0101_000:
	SetFlag FLAG_SINNOH_2538
	End

scr_seq_SR210BR0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_256
	GoToIf 1, _0041
	SetFlag FLAG_SINNOH_256
	NPCMsg msg_1045_SR210BR0101_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	GoTo _00A2

_0041:
	NPCMsg msg_1045_SR210BR0101_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	GoTo _00A2

_005B:
	NPCMsg msg_1045_SR210BR0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A2:
	GetPartyCount 0x4000
	SubVar 0x4000, 1
	GetPartyMonSpecies 0x4000, 0x800C
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End


	.balign 4, 0
