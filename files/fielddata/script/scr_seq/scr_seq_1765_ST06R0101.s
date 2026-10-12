#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST06R0101.h"
#include "msgdata/msg/msg_1229_ST06R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST06R0101_000
	ScrDef scr_seq_ST06R0101_001
	ScrDefEnd

scr_seq_ST06R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_215
	GoToIf 1, _003E
	CheckFlag FLAG_SINNOH_214
	GoToIf 1, _0033
	NPCMsg msg_1229_ST06R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0033:
	NPCMsg msg_1229_ST06R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003E:
	NPCMsg msg_1229_ST06R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetFlag FLAG_SINNOH_293
	NPCMsg msg_1229_ST06R0101_00003
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 4
	CallIf 1, _008A
	CompareVarToValue 0x8005, 5
	CallIf 1, _009E
	HidePerson 1
	SetFlag FLAG_SINNOH_231
	SetFlag FLAG_SINNOH_500
	ReleaseAll
	End

_008A:
	ApplyMovement obj_player, mv_ST06R0101_00B4
	ApplyMovement 1, mv_ST06R0101_00CC
	WaitMovement
	Return

_009E:
	ApplyMovement obj_player, mv_ST06R0101_00BC
	ApplyMovement 1, mv_ST06R0101_00DC
	WaitMovement
	Return

	.balign 4, 0
mv_ST06R0101_00B4:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST06R0101_00BC:
	.short 34, 1
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST06R0101_00CC:
	.short 13, 3
	.short 14, 4
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_ST06R0101_00DC:
	.short 14, 1
	.short 13, 3
	.short 14, 3
	.short 13, 1
	EndMovement


	.balign 4, 0
