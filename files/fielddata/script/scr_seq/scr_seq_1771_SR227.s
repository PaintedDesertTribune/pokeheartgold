#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR227.h"
#include "msgdata/msg/msg_1232_SR227.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR227_000
	ScrDef scr_seq_SR227_001
	ScrDef scr_seq_SR227_002
	ScrDef scr_seq_SR227_003
	ScrDef scr_seq_SR227_004
	ScrDefEnd

scr_seq_SR227_000:
	LockAll
	ApplyMovement 4, mv_SR227_0160
	ApplyMovement 3, mv_SR227_013C
	ApplyMovement obj_player, mv_SR227_00F8
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_1232_SR227_00001
	CloseMsg
	ApplyMovement 3, mv_SR227_0148
	WaitMovement
	Wait 15, 0x800C
	BufferRivalsName 1
	NPCMsg msg_1232_SR227_00002
	CloseMsg
	ApplyMovement 3, mv_SR227_0150
	WaitMovement
	Wait 5, 0x800C
	BufferPlayersName 0
	NPCMsg msg_1232_SR227_00003
	CloseMsg
	ApplyMovement 3, mv_SR227_0158
	ApplyMovement 4, mv_SR227_016C
	ApplyMovement obj_player, mv_SR227_0100
	WaitMovement
	HidePerson 3
	ApplyMovement 4, mv_SR227_0178
	ApplyMovement obj_player, mv_SR227_010C
	WaitMovement
	NPCMsg msg_1232_SR227_00004
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 738
	GoToIf 1, _00B9
	CompareVarToValue 0x8004, 739
	GoToIf 1, _00D1
	End

_00B9:
	ApplyMovement 4, mv_SR227_0180
	ApplyMovement obj_player, mv_SR227_0114
	WaitMovement
	GoTo _00E9

_00D1:
	ApplyMovement 4, mv_SR227_018C
	ApplyMovement obj_player, mv_SR227_0128
	WaitMovement
	GoTo _00E9

_00E9:
	HidePerson 4
	SetVar VAR_SINNOH_408B, 1
	ReleaseAll
	End

scr_seq_SR227_001:
	DirectionSignpost msg_1232_SR227_00005, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR227_002:
	LockAll
	ApplyMovement 11, mv_SR227_01F4
	ApplyMovement obj_player, mv_SR227_01E0
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_1232_SR227_00000
	CloseMsg
	ApplyMovement 11, mv_SR227_0204
	WaitMovement
	HidePerson 11
	SetVar VAR_SINNOH_4119, 1
	ReleaseAll
	End

	.balign 4, 0
mv_SR227_00F8:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SR227_0100:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR227_010C:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SR227_0114:
	.short 63, 2
	.short 35, 1
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR227_0128:
	.short 63, 1
	.short 34, 1
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR227_013C:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR227_0148:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR227_0150:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR227_0158:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SR227_0160:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR227_016C:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR227_0178:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR227_0180:
	.short 15, 1
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SR227_018C:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SR227_01E0:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SR227_01F4:
	.short 33, 1
	.short 75, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SR227_0204:
	.short 12, 3
	.short 14, 1
	.short 12, 3
	.short 14, 8
	EndMovement

scr_seq_SR227_003:
	SetVar VAR_SPECIAL_x8008, 249
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR227_004:
	SetVar VAR_SPECIAL_x8008, 52
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
