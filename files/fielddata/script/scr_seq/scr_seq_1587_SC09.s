#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC09.h"
#include "msgdata/msg/msg_1140_SC09.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC09_000
	ScrDef scr_seq_SC09_001
	ScrDef scr_seq_SC09_002
	ScrDef scr_seq_SC09_003
	ScrDef scr_seq_SC09_004
	ScrDef scr_seq_SC09_005
	ScrDef scr_seq_SC09_006
	ScrDef scr_seq_SC09_007
	ScrDef scr_seq_SC09_008
	ScrDef scr_seq_SC09_009
	ScrDef scr_seq_SC09_010
	ScrDef scr_seq_SC09_011
	ScrDefEnd

scr_seq_SC09_000:
	CompareVarToValue VAR_SINNOH_407F, 1
	GoToIf 4, _0041
	End

_0041:
	SetFlag FLAG_SINNOH_529
	End

scr_seq_SC09_002:
	LockAll
	ApplyMovement 6, mv_SC09_009C
	WaitMovement
	NPCMsg msg_1140_SC09_00000
	CloseMsg
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0088
	GoTo _0072

_0072:
	ApplyMovement 6, mv_SC09_00A4
	ApplyMovement obj_player, mv_SC09_00AC
	WaitMovement
	ReleaseAll
	End

_0088:
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _0072
	GoTo _0111

scr_seq_SC09_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00DF
	GoTo _00D4

_00D4:
	NPCMsg msg_1140_SC09_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _00D4
	CompareVarToValue VAR_SINNOH_407F, 0
	GoToIf 1, _0102
	NPCMsg msg_1140_SC09_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0102:
	NPCMsg msg_1140_SC09_00000
	CloseMsg
	Call _011B
	ReleaseAll
	End

_0111:
	Call _011B
	ReleaseAll
	End

_011B:
	Wait 30, 0x800C
	ClearFlag FLAG_SINNOH_529
	ShowPerson 7
	ApplyMovement 7, mv_SC09_016C
	WaitMovement
	NPCMsg msg_1140_SC09_00003
	CloseMsg
	ApplyMovement obj_player, mv_SC09_0164
	ApplyMovement 6, mv_SC09_015C
	WaitMovement
	SetVar VAR_SINNOH_407F, 1
	NPCMsg msg_1140_SC09_00004
	WaitButton
	CloseMsg
	Return

scr_seq_SC09_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1140_SC09_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1140_SC09_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1140_SC09_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1140_SC09_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_407F, 1
	GoToIf 4, _01E0
	NPCMsg msg_1140_SC09_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E0:
	NPCMsg msg_1140_SC09_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1140_SC09_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC09_009:
	DirectionSignpost msg_1140_SC09_00015, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC09_010:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1140_SC09_00016, 0x800C
	CallStd std_signpost
	End

scr_seq_SC09_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _0260
	NPCMsg msg_1140_SC09_00010
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0276
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026B
	End

_0260:
	NPCMsg msg_1140_SC09_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026B:
	NPCMsg msg_1140_SC09_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0276:
	NPCMsg msg_1140_SC09_00011
	CloseMsg
	Call _0295
	Call _02AF
	SinnohShipCutscene 2, 0, MAP_SINNOH_FIGHT_AREA, 623, 434
	ReleaseAll
	End

_0295:
	ApplyMovement 8, mv_SC09_02CC
	WaitMovement
	PlayFanfare 1539
	ApplyMovement 8, mv_SC09_02D8
	WaitMovement
	Return

_02AF:
	ApplyMovement obj_player, mv_SC09_02E0
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SC09_02D8
	WaitMovement
	Return

	.balign 4, 0
mv_SC09_009C:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC09_00A4:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC09_00AC:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC09_015C:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC09_0164:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC09_016C:
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_SC09_02CC:
	.short 1, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC09_02D8:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC09_02E0:
	.short 13, 1
	.short 64, 1
	EndMovement


	.balign 4, 0
