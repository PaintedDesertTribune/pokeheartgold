#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR218R0201.h"
#include "msgdata/msg/msg_0842_SR218R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR218R0201_000
	ScrDef scr_seq_SR218R0201_001
	ScrDefEnd

scr_seq_SR218R0201_001:
	LockAll
	Call _0060
	BufferPlayersName 0
	BufferFriendsName 1
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _002F
	GoTo _0038

_002F:
	NPCMsg msg_0842_SR218R0201_00002
	GoTo _0041

_0038:
	NPCMsg msg_0842_SR218R0201_00003
	GoTo _0041

_0041:
	NPCMsg msg_0842_SR218R0201_00004
	CloseMsg
	// Diamond ScrCmd_UnlockGenderEntries dropped: Pokédex gender pages; HeartGold has no toggle
	Call _0091
	SetFlag FLAG_SINNOH_570
	HidePerson 1
	SetVar VAR_SINNOH_4105, 1
	ReleaseAll
	End

_0060:
	GetPlayerCoords 0x8005, 0x8006
	CompareVarToValue 0x8006, 6
	GoToIf 1, _0079
	GoTo _0085

_0079:
	ApplyMovement 1, mv_SR218R0201_00C4
	WaitMovement
	Return

_0085:
	ApplyMovement 1, mv_SR218R0201_00D8
	WaitMovement
	Return

_0091:
	GetPlayerCoords 0x8005, 0x8006
	CompareVarToValue 0x8006, 6
	GoToIf 1, _00AA
	GoTo _00B6

_00AA:
	ApplyMovement 1, mv_SR218R0201_00E4
	WaitMovement
	Return

_00B6:
	ApplyMovement 1, mv_SR218R0201_00F0
	WaitMovement
	Return

scr_seq_SR218R0201_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0842_SR218R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SR218R0201_00C4:
	.short 75, 1
	.short 15, 1
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR218R0201_00D8:
	.short 75, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SR218R0201_00E4:
	.short 13, 1
	.short 15, 4
	EndMovement

	.balign 4, 0
mv_SR218R0201_00F0:
	.short 12, 1
	.short 15, 3
	.short 13, 1
	.short 15, 1
	EndMovement


	.balign 4, 0
