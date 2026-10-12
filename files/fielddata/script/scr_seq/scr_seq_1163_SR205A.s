#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR205A.h"
#include "msgdata/msg/msg_0928_SR205A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR205A_000
	ScrDef scr_seq_SR205A_001
	ScrDef scr_seq_SR205A_002
	ScrDef scr_seq_SR205A_003
	ScrDef scr_seq_SR205A_004
	ScrDef scr_seq_SR205A_005
	ScrDef scr_seq_SR205A_006
	ScrDef scr_seq_SR205A_007
	ScrDef scr_seq_SR205A_008
	ScrDef scr_seq_SR205A_009
	ScrDefEnd

scr_seq_SR205A_000:
	CheckFlag FLAG_SINNOH_280
	GoToIf 1, _0037
	End

_0037:
	MovePerson 31, 210, 653
	End

scr_seq_SR205A_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	ApplyMovement 13, mv_SR205A_0074
	WaitMovement
	NPCMsg msg_0928_SR205A_00003
	CloseMsg
	ApplyMovement 12, mv_SR205A_007C
	WaitMovement
	Call _00CA
	NPCMsg msg_0928_SR205A_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR205A_006:
	LockAll
	ApplyMovement 13, mv_SR205A_00D0
	WaitMovement
	NPCMsg msg_0928_SR205A_00003
	CloseMsg
	ApplyMovement 12, mv_SR205A_00D8
	WaitMovement
	NPCMsg msg_0928_SR205A_00004
	CloseMsg
	ApplyMovement 13, mv_SR205A_00E0
	ApplyMovement obj_player, mv_SR205A_0100
	WaitMovement
	ApplyMovement 12, mv_SR205A_00F8
	WaitMovement
	Call _00CA
	ReleaseAll
	End

_00CA:
	SetFlag FLAG_SINNOH_127
	Return

scr_seq_SR205A_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0928_SR205A_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR205A_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetFlag FLAG_SINNOH_280
	NPCMsg msg_0928_SR205A_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR205A_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_145
	GoToIf 1, _015A
	Call _0165
	NPCMsg msg_0928_SR205A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015A:
	NPCMsg msg_0928_SR205A_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0165:
	SetFlag FLAG_SINNOH_447
	SetFlag FLAG_SINNOH_145
	SetVar VAR_SINNOH_4089, 1
	Return

scr_seq_SR205A_005:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 659
	GoToIf 1, _01C0
	CompareVarToValue 0x8005, 660
	GoToIf 1, _01DA
	CompareVarToValue 0x8005, 661
	GoToIf 1, _01F4
	CompareVarToValue 0x8005, 662
	GoToIf 1, _01FA
	CompareVarToValue 0x8005, 663
	GoToIf 1, _0214
	End

_01C0:
	ApplyMovement 18, mv_SR205A_0250
	WaitMovement
	ApplyMovement obj_player, mv_SR205A_0240
	WaitMovement
	GoTo _022E

_01DA:
	ApplyMovement 18, mv_SR205A_0264
	WaitMovement
	ApplyMovement obj_player, mv_SR205A_0240
	WaitMovement
	GoTo _022E

_01F4:
	GoTo _022E

_01FA:
	ApplyMovement 18, mv_SR205A_0274
	WaitMovement
	ApplyMovement obj_player, mv_SR205A_0248
	WaitMovement
	GoTo _022E

_0214:
	ApplyMovement 18, mv_SR205A_0284
	WaitMovement
	ApplyMovement obj_player, mv_SR205A_0248
	WaitMovement
	GoTo _022E

_022E:
	Call _0165
	NPCMsg msg_0928_SR205A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR205A_007:
	DirectionSignpost msg_0928_SR205A_00008, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR205A_008:
	DirectionSignpost msg_0928_SR205A_00009, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR205A_009:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0928_SR205A_00010, 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SR205A_0074:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR205A_007C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR205A_00D0:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR205A_00D8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR205A_00E0:
	.short 19, 1
	.short 37, 1
	.short 63, 2
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR205A_00F8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0100:
	.short 13, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0240:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0248:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0250:
	.short 32, 1
	.short 75, 1
	.short 63, 1
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0264:
	.short 32, 1
	.short 75, 1
	.short 63, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0274:
	.short 33, 1
	.short 75, 1
	.short 63, 1
	EndMovement

	.balign 4, 0
mv_SR205A_0284:
	.short 33, 1
	.short 75, 1
	.short 63, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
