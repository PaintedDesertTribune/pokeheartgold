#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08.h"
#include "msgdata/msg/msg_1156_SC08.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08_000
	ScrDef scr_seq_SC08_001
	ScrDef scr_seq_SC08_002
	ScrDef scr_seq_SC08_003
	ScrDef scr_seq_SC08_004
	ScrDef scr_seq_SC08_005
	ScrDef scr_seq_SC08_006
	ScrDef scr_seq_SC08_007
	ScrDef scr_seq_SC08_008
	ScrDef scr_seq_SC08_009
	ScrDef scr_seq_SC08_010
	ScrDef scr_seq_SC08_011
	ScrDef scr_seq_SC08_012
	ScrDef scr_seq_SC08_013
	ScrDef scr_seq_SC08_014
	ScrDef scr_seq_SC08_015
	ScrDef scr_seq_SC08_016
	ScrDef scr_seq_SC08_017
	ScrDef scr_seq_SC08_018
	ScrDef scr_seq_SC08_019
	ScrDefEnd

scr_seq_SC08_018:
	CompareVarToValue VAR_SINNOH_407E, 0
	GoToIf 1, _005D
	End

_005D:
	MovePerson 18, 841, 790
	SetObjectMovementType 18, 16
	SetObjectFacing 18, 2
	End

scr_seq_SC08_007:
	LockAll
	SetVar VAR_SINNOH_407E, 2
	ApplyMovement 9, mv_SC08_0170
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 853
	GoToIf 1, _00CE
	CompareVarToValue 0x8004, 854
	GoToIf 1, _00DE
	CompareVarToValue 0x8004, 855
	GoToIf 1, _00EE
	CompareVarToValue 0x8004, 856
	GoToIf 1, _00FE
	CompareVarToValue 0x8004, 857
	GoToIf 1, _010E
	End

_00CE:
	ApplyMovement 9, mv_SC08_017C
	WaitMovement
	GoTo _011E

_00DE:
	ApplyMovement 9, mv_SC08_0188
	WaitMovement
	GoTo _011E

_00EE:
	ApplyMovement 9, mv_SC08_0194
	WaitMovement
	GoTo _011E

_00FE:
	ApplyMovement 9, mv_SC08_01A0
	WaitMovement
	GoTo _011E

_010E:
	ApplyMovement 9, mv_SC08_01AC
	WaitMovement
	GoTo _011E

_011E:
	SetFlag FLAG_SINNOH_181
	NPCMsg msg_1156_SC08_00004
	CheckBadge 7, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0162
	Call _0146
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0146:
	NPCMsg msg_1156_SC08_00006
	SetVar 0x8004, 426
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_154
	NPCMsg msg_1156_SC08_00007
	Return

_0162:
	NPCMsg msg_1156_SC08_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_154
	GoToIf 1, _01F6
	NPCMsg msg_1156_SC08_00008
	CheckBadge 7, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01EB
	Call _0146
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01EB:
	NPCMsg msg_1156_SC08_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01F6:
	NPCMsg msg_1156_SC08_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_000:
	// LockAll moved into the branches below: this frame script re-fires until its variable changes
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 790
	GoToIf 1, _0225
	CompareVarToValue 0x8005, 791
	GoToIf 1, _0235
	ReleaseAll
	End

_0225:
	LockAll
	ApplyMovement 18, mv_SC08_02AC
	WaitMovement
	GoTo _0245

_0235:
	LockAll
	ApplyMovement 18, mv_SC08_02C0
	WaitMovement
	GoTo _0245

_0245:
	NPCMsg msg_1156_SC08_00000
	CloseMsg
	ApplyMovement 18, mv_SC08_02D8
	WaitMovement
	Wait 15, 0x800C
	ApplyMovement 18, mv_SC08_02E0
	WaitMovement
	NPCMsg msg_1156_SC08_00001
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 18, mv_SC08_02E8
	WaitMovement
	HidePerson 18
	Wait 1, 0x800C
	MovePerson 18, 845, 748
	SetObjectMovementType 18, 15
	SetObjectFacing 18, 1
	ClearFlag FLAG_SINNOH_599
	ShowPerson 18
	SetVar VAR_SINNOH_407E, 1
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC08_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1156_SC08_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08_009:
	DirectionSignpost msg_1156_SC08_00017, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_010:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1156_SC08_00018, 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_011:
	DirectionSignpost msg_1156_SC08_00019, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_012:
	DirectionSignpost msg_1156_SC08_00020, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_013:
	DirectionSignpost msg_1156_SC08_00021, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_014:
	DirectionSignpost msg_1156_SC08_00022, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_015:
	DirectionSignpost msg_1156_SC08_00023, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC08_016:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	SetVar 0x800C, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0476
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0480
	CompareVarToValue 0x8008, 2
	GoToIf 1, _048A
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 4
	GoToIf 1, _049E
	CompareVarToValue 0x8008, 5
	GoToIf 1, _04A8
	CompareVarToValue 0x8008, 6
	GoToIf 1, _04B2
	End

_0476:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [0]: no HeartGold mapping yet
	GoTo _04BC

_0480:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [1]: no HeartGold mapping yet
	GoTo _04BC

_048A:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [2]: no HeartGold mapping yet
	GoTo _04BC

_0494:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [3]: no HeartGold mapping yet
	GoTo _04BC

_049E:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [4]: no HeartGold mapping yet
	GoTo _04BC

_04A8:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [5]: no HeartGold mapping yet
	GoTo _04BC

_04B2:
	// TODO Diamond ScrCmd_SealsMart 0x14a args [6]: no HeartGold mapping yet
	GoTo _04BC

_04BC:
	ReleaseAll
	End

scr_seq_SC08_017:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_354
	GoToIf 1, _04DE
	NPCMsg msg_1156_SC08_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04DE:
	NPCMsg msg_1156_SC08_00003
	CloseMsg
	Wait 15, 0x800C
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0516
	CompareVarToValue 0x800C, 2
	GoToIf 1, _052E
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0546
	End

_0516:
	ApplyMovement 18, mv_SC08_0568
	ApplyMovement obj_player, mv_SC08_0584
	WaitMovement
	GoTo _055E

_052E:
	ApplyMovement 18, mv_SC08_0578
	ApplyMovement obj_player, mv_SC08_0590
	WaitMovement
	GoTo _055E

_0546:
	ApplyMovement 18, mv_SC08_0578
	ApplyMovement obj_player, mv_SC08_0584
	WaitMovement
	GoTo _055E

_055E:
	HidePerson 18
	ReleaseAll
	End

	.balign 4, 0
mv_SC08_0170:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC08_017C:
	.short 14, 4
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC08_0188:
	.short 14, 3
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC08_0194:
	.short 14, 2
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC08_01A0:
	.short 14, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC08_01AC:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC08_02AC:
	.short 14, 3
	.short 34, 1
	.short 75, 1
	.short 14, 5
	EndMovement

	.balign 4, 0
mv_SC08_02C0:
	.short 13, 1
	.short 14, 3
	.short 34, 1
	.short 75, 1
	.short 14, 5
	EndMovement

	.balign 4, 0
mv_SC08_02D8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC08_02E0:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC08_02E8:
	.short 15, 9
	EndMovement

	.balign 4, 0
mv_SC08_0568:
	.short 15, 1
	.short 13, 2
	.short 15, 8
	EndMovement

	.balign 4, 0
mv_SC08_0578:
	.short 13, 2
	.short 15, 9
	EndMovement

	.balign 4, 0
mv_SC08_0584:
	.short 63, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SC08_0590:
	.short 63, 1
	.short 33, 1
	.short 35, 1
	EndMovement

scr_seq_SC08_019:
	SetVar VAR_SPECIAL_x8008, 83
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
