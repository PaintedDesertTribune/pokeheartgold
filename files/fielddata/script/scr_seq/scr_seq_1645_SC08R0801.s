#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0801.h"
#include "msgdata/msg/msg_1169_SC08R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0801_000
	ScrDef scr_seq_SC08R0801_001
	ScrDef scr_seq_SC08R0801_002
	ScrDef scr_seq_SC08R0801_003
	ScrDefEnd

scr_seq_SC08R0801_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1169_SC08R0801_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0801_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1169_SC08R0801_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0801_002:
	PlayFanfare 1500
	LockAll
	BufferPlayersName 0
	NPCMsg msg_1169_SC08R0801_00003
	CloseMsg
	// TODO Diamond ScrCmd_UseSunyshoreBinoculars 0x27a args []: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC08R0801_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1169_SC08R0801_00000
	NPCMsg msg_1169_SC08R0801_00001
	NPCMsg msg_1169_SC08R0801_00002
	CloseMsg
	Wait 15, 0x800C
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0092
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00AA
	CompareVarToValue 0x800C, 3
	GoToIf 1, _00C2
	End

_0092:
	ApplyMovement 2, mv_SC08R0801_0104
	ApplyMovement obj_player, mv_SC08R0801_013C
	WaitMovement
	GoTo _00D2

_00AA:
	ApplyMovement 2, mv_SC08R0801_0118
	ApplyMovement obj_player, mv_SC08R0801_0148
	WaitMovement
	GoTo _00D2

_00C2:
	ApplyMovement 2, mv_SC08R0801_0118
	WaitMovement
	GoTo _00D2

_00D2:
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	ApplyMovement 2, mv_SC08R0801_0130
	WaitMovement
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	HidePerson 2
	SetFlag FLAG_SINNOH_354
	ReleaseAll
	End

	.balign 4, 0
mv_SC08R0801_0104:
	.short 15, 3
	.short 13, 6
	.short 14, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC08R0801_0118:
	.short 13, 1
	.short 15, 3
	.short 13, 5
	.short 14, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC08R0801_0130:
	.short 12, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC08R0801_013C:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC08R0801_0148:
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
