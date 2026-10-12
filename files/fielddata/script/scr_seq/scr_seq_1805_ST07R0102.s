#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0102.h"
#include "msgdata/msg/msg_1249_ST07R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07R0102_000
	ScrDef scr_seq_ST07R0102_001
	ScrDef scr_seq_ST07R0102_002
	ScrDef scr_seq_ST07R0102_003
	ScrDefEnd

scr_seq_ST07R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2725
	GoToIf 1, _00F9
	CompareVarToValue 0x400A, 1
	GoToIf 1, _00F9
	BufferPlayersName 0
	BufferPartyMonNick 1, 0
	NPCMsg msg_1249_ST07R0102_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0054
	GoTo _005F

_0054:
	NPCMsg msg_1249_ST07R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005F:
	NPCMsg msg_1249_ST07R0102_00002
	CloseMsg
	Call _0142
	GoTo _0070

_0070:
	NPCMsg msg_1249_ST07R0102_00003
	Random 0x800C, 4
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A6
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00AF
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00B8
	GoTo _00C1

_00A6:
	NPCMsg msg_1249_ST07R0102_00004
	GoTo _00CA

_00AF:
	NPCMsg msg_1249_ST07R0102_00005
	GoTo _00CA

_00B8:
	NPCMsg msg_1249_ST07R0102_00006
	GoTo _00CA

_00C1:
	NPCMsg msg_1249_ST07R0102_00007
	GoTo _00CA

_00CA:
	CloseMsg
	PlayFanfare 1634
	Call _0104
	WaitSE 1634
	SetFlag FLAG_SINNOH_2725
	SetVar 0x400A, 1
	ApplyMovement 1, mv_ST07R0102_02C0
	WaitMovement
	NPCMsg msg_1249_ST07R0102_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	NPCMsg msg_1249_ST07R0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0104:
	Random 0x800C, 100
	CompareVarToValue 0x800C, 5
	GoToIf 0, _012A
	CompareVarToValue 0x800C, 30
	GoToIf 0, _0132
	GoTo _013A

_012A:
	// TODO Diamond ScrCmd_AddPartyMonFriendship 0x1ba args [30, 0]: no HeartGold mapping yet
	Return

_0132:
	// TODO Diamond ScrCmd_AddPartyMonFriendship 0x1ba args [10, 0]: no HeartGold mapping yet
	Return

_013A:
	// TODO Diamond ScrCmd_AddPartyMonFriendship 0x1ba args [5, 0]: no HeartGold mapping yet
	Return

_0142:
	GetPlayerCoords 0x8005, 0x8006
	CompareVarToValue 0x8005, 11
	GoToIf 1, _0175
	CompareVarToValue 0x8005, 13
	GoToIf 1, _018D
	CompareVarToValue 0x8006, 4
	GoToIf 1, _01A5
	GoTo _01BD

_0175:
	ApplyMovement obj_player, mv_ST07R0102_0250
	ApplyMovement 2, mv_ST07R0102_01F4
	WaitMovement
	GoTo _01D5

_018D:
	ApplyMovement obj_player, mv_ST07R0102_0264
	ApplyMovement 2, mv_ST07R0102_0208
	WaitMovement
	GoTo _01D5

_01A5:
	ApplyMovement obj_player, mv_ST07R0102_0278
	ApplyMovement 2, mv_ST07R0102_0220
	WaitMovement
	GoTo _01D5

_01BD:
	ApplyMovement obj_player, mv_ST07R0102_0290
	ApplyMovement 2, mv_ST07R0102_0234
	WaitMovement
	GoTo _01D5

_01D5:
	ApplyMovement 0, mv_ST07R0102_02A8
	ApplyMovement 1, mv_ST07R0102_02B0
	ApplyMovement 3, mv_ST07R0102_02B8
	WaitMovement
	Return

scr_seq_ST07R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1249_ST07R0102_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0102_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1249_ST07R0102_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1249_ST07R0102_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST07R0102_01F4:
	.short 15, 2
	.short 13, 2
	.short 15, 3
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0208:
	.short 13, 1
	.short 15, 1
	.short 13, 1
	.short 15, 4
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0220:
	.short 15, 2
	.short 13, 2
	.short 15, 3
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0234:
	.short 15, 1
	.short 13, 1
	.short 15, 2
	.short 13, 1
	.short 15, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0250:
	.short 15, 3
	.short 13, 2
	.short 15, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0264:
	.short 63, 2
	.short 13, 2
	.short 15, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0278:
	.short 13, 1
	.short 15, 3
	.short 13, 2
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_0290:
	.short 63, 2
	.short 15, 3
	.short 13, 1
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_02A8:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_ST07R0102_02B0:
	.short 15, 3
	EndMovement

	.balign 4, 0
mv_ST07R0102_02B8:
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_ST07R0102_02C0:
	.short 12, 1
	.short 33, 1
	EndMovement


	.balign 4, 0
