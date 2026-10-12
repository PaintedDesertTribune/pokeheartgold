#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL02.h"
#include "msgdata/msg/msg_1082_SL02.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL02_000
	ScrDef scr_seq_SL02_001
	ScrDef scr_seq_SL02_002
	ScrDef scr_seq_SL02_003
	ScrDef scr_seq_SL02_004
	ScrDef scr_seq_SL02_005
	ScrDef scr_seq_SL02_006
	ScrDef scr_seq_SL02_007
	ScrDef scr_seq_SL02_008
	ScrDef scr_seq_SL02_009
	ScrDef scr_seq_SL02_010
	ScrDef scr_seq_SL02_011
	ScrDefEnd

scr_seq_SL02_000:
	CheckFlag FLAG_SINNOH_262
	CallIf 1, _005A
	CheckFlag FLAG_SINNOH_350
	CallIf 1, _0088
	CheckFlag FLAG_SINNOH_350
	GoToIf 0, _0094
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _00A6
	End

_005A:
	MovePerson 5, 723, 769
	SetObjectFacing 5, 0
	SetObjectMovementType 5, 14
	Return

scr_seq_SL02_001:
	CheckFlag FLAG_SINNOH_350
	GoToIf 0, _0094
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _00A6
	End

_0088:
	SetFlag FLAG_SINNOH_667
	SetVar VAR_SINNOH_4112, 1
	Return

_0094:
	MoveWarp 5, 713, 760
	MoveWarp 6, 713, 761
	End

_00A6:
	MoveWarp 3, 713, 760
	MoveWarp 4, 713, 761
	End

scr_seq_SL02_002:
	PlayFanfare 1500
	LockAll
	CheckFlag FLAG_SINNOH_262
	GoToIf 1, _0155
	NPCMsg msg_1082_SL02_00000
	FacePlayer
	ApplyMovement 5, mv_SL02_0228
	WaitMovement
	NPCMsg msg_1082_SL02_00001
	CloseMsg
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 1
	GoToIf 1, _0101
	CompareVarToValue 0x8004, 0
	GoToIf 1, _0119
	GoTo _0129

_0101:
	ApplyMovement 5, mv_SL02_0230
	ApplyMovement obj_player, mv_SL02_01F4
	WaitMovement
	GoTo _0141

_0119:
	ApplyMovement 5, mv_SL02_023C
	WaitMovement
	GoTo _0141

_0129:
	ApplyMovement 5, mv_SL02_023C
	ApplyMovement obj_player, mv_SL02_0200
	WaitMovement
	GoTo _0141

_0141:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	SetFlag FLAG_SINNOH_262
	ReleaseAll
	End

_0155:
	FacePlayer
	NPCMsg msg_1082_SL02_00002
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_36, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01EC
	NPCMsg msg_1082_SL02_00003
	CloseMsg
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 1
	GoToIf 1, _019C
	CompareVarToValue 0x8004, 0
	GoToIf 1, _01B4
	GoTo _01C4

_019C:
	ApplyMovement 5, mv_SL02_0244
	ApplyMovement obj_player, mv_SL02_0208
	WaitMovement
	GoTo _01DC

_01B4:
	ApplyMovement 5, mv_SL02_0250
	WaitMovement
	GoTo _01DC

_01C4:
	ApplyMovement 5, mv_SL02_0250
	ApplyMovement obj_player, mv_SL02_021C
	WaitMovement
	GoTo _01DC

_01DC:
	HidePerson 5
	ClearFlag FLAG_SINNOH_459
	ShowPerson 0
	ReleaseAll
	End

_01EC:
	WhiteOut
	ReleaseAll
	End

scr_seq_SL02_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1082_SL02_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0287
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0290
	End

_0287:
	NPCMsg msg_1082_SL02_00005
	GoTo _0299

_0290:
	NPCMsg msg_1082_SL02_00006
	GoTo _0299

_0299:
	NPCMsg msg_1082_SL02_00007
	SetVar 0x8004, 464
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	NPCMsg msg_1082_SL02_00008
	CloseMsg
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 1
	GoToIf 1, _02C8
	GoTo _02E0

_02C8:
	ApplyMovement 0, mv_SL02_030C
	ApplyMovement obj_player, mv_SL02_032C
	WaitMovement
	GoTo _02F8

_02E0:
	ApplyMovement 0, mv_SL02_0318
	ApplyMovement obj_player, mv_SL02_033C
	WaitMovement
	GoTo _02F8

_02F8:
	HidePerson 0
	SetVar VAR_SINNOH_4083, 2
	SetFlag FLAG_SINNOH_183
	ReleaseAll
	End

scr_seq_SL02_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1082_SL02_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL02_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1082_SL02_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL02_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 451, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0396
	NPCMsg msg_1082_SL02_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0396:
	NPCMsg msg_1082_SL02_00014
	CloseMsg
	TakeItem 451, 1, 0x800C
	ApplyMovement 8, mv_SL02_03E4
	WaitMovement
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	ApplyMovement 8, mv_SL02_03EC
	WaitMovement
	HidePerson 8
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	ClearFlag FLAG_SINNOH_636
	SetFlag FLAG_SINNOH_635
	ReleaseAll
	End

scr_seq_SL02_007:
	DirectionSignpost msg_1082_SL02_00015, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SL02_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1082_SL02_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL02_009:
	LockAll
	ApplyMovement 9, mv_SL02_04E4
	WaitMovement
	GetPlayerCoords 0x8000, 0x8001
	CompareVarToValue 0x8001, 789
	CallIf 1, _0499
	CompareVarToValue 0x8001, 790
	CallIf 1, _04A5
	CompareVarToValue 0x8001, 791
	CallIf 1, _04B1
	ApplyMovement 9, mv_SL02_0538
	ApplyMovement obj_player, mv_SL02_0540
	WaitMovement
	NPCMsg msg_1082_SL02_00011
	CloseMsg
	CompareVarToValue 0x8001, 789
	CallIf 1, _04BD
	CompareVarToValue 0x8001, 790
	CallIf 1, _04C9
	CompareVarToValue 0x8001, 791
	CallIf 1, _04D5
	ReleaseAll
	End

_0499:
	ApplyMovement 9, mv_SL02_04F0
	WaitMovement
	Return

_04A5:
	ApplyMovement 9, mv_SL02_04FC
	WaitMovement
	Return

_04B1:
	ApplyMovement 9, mv_SL02_0508
	WaitMovement
	Return

_04BD:
	ApplyMovement 9, mv_SL02_0514
	WaitMovement
	Return

_04C9:
	ApplyMovement 9, mv_SL02_0520
	WaitMovement
	Return

_04D5:
	ApplyMovement 9, mv_SL02_052C
	WaitMovement
	Return

	.balign 4, 0
mv_SL02_01F4:
	.short 35, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_0200:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_0208:
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_021C:
	.short 63, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_0228:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SL02_0230:
	.short 19, 1
	.short 16, 11
	EndMovement

	.balign 4, 0
mv_SL02_023C:
	.short 16, 10
	EndMovement

	.balign 4, 0
mv_SL02_0244:
	.short 15, 1
	.short 8, 9
	EndMovement

	.balign 4, 0
mv_SL02_0250:
	.short 12, 1
	.short 8, 9
	EndMovement

	.balign 4, 0
mv_SL02_030C:
	.short 15, 1
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SL02_0318:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SL02_032C:
	.short 63, 1
	.short 35, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_033C:
	.short 63, 1
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SL02_03E4:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL02_03EC:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SL02_04E4:
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SL02_04F0:
	.short 15, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SL02_04FC:
	.short 15, 1
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SL02_0508:
	.short 15, 1
	.short 13, 3
	EndMovement

	.balign 4, 0
mv_SL02_0514:
	.short 12, 1
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SL02_0520:
	.short 12, 2
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SL02_052C:
	.short 12, 3
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SL02_0538:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SL02_0540:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	EndMovement

scr_seq_SL02_010:
	SetVar VAR_SPECIAL_x8008, 412
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SL02_011:
	SetVar VAR_SPECIAL_x8008, 22
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
