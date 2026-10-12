#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11.h"
#include "msgdata/msg/msg_1213_SC11.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC11_000
	ScrDef scr_seq_SC11_001
	ScrDef scr_seq_SC11_002
	ScrDef scr_seq_SC11_003
	ScrDef scr_seq_SC11_004
	ScrDef scr_seq_SC11_005
	ScrDef scr_seq_SC11_006
	ScrDef scr_seq_SC11_007
	ScrDef scr_seq_SC11_008
	ScrDef scr_seq_SC11_009
	ScrDef scr_seq_SC11_010
	ScrDef scr_seq_SC11_011
	ScrDef scr_seq_SC11_012
	ScrDef scr_seq_SC11_013
	ScrDef scr_seq_SC11_014
	ScrDef scr_seq_SC11_015
	ScrDef scr_seq_SC11_016
	ScrDefEnd

scr_seq_SC11_014:
	CompareVarToValue VAR_SINNOH_409E, 1
	GoToIf 4, _0055
	End

_0055:
	SetFlag FLAG_SINNOH_497
	CompareVarToValue VAR_SINNOH_410E, 1
	GoToIf 4, _0068
	End

_0068:
	SetVar 0x4000, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0088
	CompareVarToValue 0x4000, 6
	GoToIf 1, _0088
	End

_0088:
	MovePerson 7, 658, 430
	SetObjectMovementType 7, 15
	SetObjectFacing 7, 1
	ClearFlag FLAG_SINNOH_497
	End

scr_seq_SC11_000:
	LockAll
	ApplyMovement 7, mv_SC11_0130
	WaitMovement
	ApplyMovement obj_player, mv_SC11_016C
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1213_SC11_00000
	CloseMsg
	ApplyMovement 8, mv_SC11_0194
	ApplyMovement 7, mv_SC11_0144
	WaitMovement
	NPCMsg msg_1213_SC11_00001
	ApplyMovement 7, mv_SC11_0150
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1213_SC11_00002
	CloseMsg
	ApplyMovement 7, mv_SC11_0158
	ApplyMovement 8, mv_SC11_01A4
	WaitMovement
	HidePerson 7
	NPCMsg msg_1213_SC11_00003
	CloseMsg
	ApplyMovement 8, mv_SC11_01B8
	WaitMovement
	NPCMsg msg_1213_SC11_00004
	CloseMsg
	ApplyMovement 8, mv_SC11_01C0
	WaitMovement
	HidePerson 8
	SetVar VAR_SINNOH_4081, 1
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC11_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferItemName 0, 447
	CheckFlag FLAG_SINNOH_107
	GoToIf 1, _02A6
	NPCMsg msg_1213_SC11_00017
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _029B
	NPCMsg msg_1213_SC11_00018
	SetVar 0x8004, 447
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_107
	NPCMsg msg_1213_SC11_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_029B:
	NPCMsg msg_1213_SC11_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02A6:
	NPCMsg msg_1213_SC11_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_008:
	DirectionSignpost msg_1213_SC11_00022, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC11_009:
	DirectionSignpost msg_1213_SC11_00023, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC11_010:
	DirectionSignpost msg_1213_SC11_00024, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC11_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	FacePlayer
	GetPlayerFacing 0x8004
	NPCMsg msg_1213_SC11_00013
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0332
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0327
	End

_0327:
	NPCMsg msg_1213_SC11_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0332:
	NPCMsg msg_1213_SC11_00014
	CloseMsg
	Call _0372
	CompareVarToValue 0x8004, 1
	CallIf 1, _038C
	CompareVarToValue 0x8004, 3
	CallIf 1, _03A6
	CompareVarToValue 0x8004, 2
	CallIf 1, _03C0
	SinnohShipCutscene 1, 0, MAP_SINNOH_SNOWPOINT, 356, 246
	ReleaseAll
	End

_0372:
	ApplyMovement 18, mv_SC11_03DC
	WaitMovement
	PlayFanfare 1539
	ApplyMovement 18, mv_SC11_03E8
	WaitMovement
	Return

_038C:
	ApplyMovement obj_player, mv_SC11_03F0
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SC11_03E8
	WaitMovement
	Return

_03A6:
	ApplyMovement obj_player, mv_SC11_03FC
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SC11_03E8
	WaitMovement
	Return

_03C0:
	ApplyMovement obj_player, mv_SC11_040C
	WaitMovement
	PlayFanfare 1539
	ApplyMovement obj_player, mv_SC11_03E8
	WaitMovement
	Return

scr_seq_SC11_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2738
	GoToIf 1, _0521
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1213_SC11_00025
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _0496
	CompareVarToValue 0x800C, 390
	GoToIf 1, _04CE
	GoTo _045E

_045E:
	// TODO Diamond ScrCmd_Unk028F 0x28f args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 20
	GoToIf 0, _047E
	CompareVarToValue 0x800C, 20
	GoToIf 4, _048A
	End

_047E:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_19, 0, 0, 0
	GoTo _0506

_048A:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_22, 0, 0, 0
	GoTo _0506

_0496:
	// TODO Diamond ScrCmd_Unk028F 0x28f args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 20
	GoToIf 0, _04B6
	CompareVarToValue 0x800C, 20
	GoToIf 4, _04C2
	End

_04B6:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_20, 0, 0, 0
	GoTo _0506

_04C2:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_23, 0, 0, 0
	GoTo _0506

_04CE:
	// TODO Diamond ScrCmd_Unk028F 0x28f args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 20
	GoToIf 0, _04EE
	CompareVarToValue 0x800C, 20
	GoToIf 4, _04FA
	End

_04EE:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_21, 0, 0, 0
	GoTo _0506

_04FA:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_24, 0, 0, 0
	GoTo _0506

_0506:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0532
	SetFlag FLAG_SINNOH_2738
	GoTo _0521

_0521:
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1213_SC11_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0532:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC11_015:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11_016:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1213_SC11_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC11_0130:
	.short 34, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC11_0144:
	.short 63, 4
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC11_0150:
	.short 39, 2
	EndMovement

	.balign 4, 0
mv_SC11_0158:
	.short 17, 1
	.short 19, 2
	.short 16, 1
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SC11_016C:
	.short 15, 4
	EndMovement

	.balign 4, 0
mv_SC11_0194:
	.short 14, 2
	.short 13, 2
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SC11_01A4:
	.short 63, 1
	.short 33, 1
	.short 62, 1
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC11_01B8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC11_01C0:
	.short 15, 10
	EndMovement

	.balign 4, 0
mv_SC11_03DC:
	.short 1, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC11_03E8:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC11_03F0:
	.short 13, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC11_03FC:
	.short 15, 1
	.short 1, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC11_040C:
	.short 14, 1
	.short 1, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
