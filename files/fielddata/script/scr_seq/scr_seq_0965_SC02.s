#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02.h"
#include "msgdata/msg/msg_0829_SC02.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02_000
	ScrDef scr_seq_SC02_001
	ScrDef scr_seq_SC02_002
	ScrDef scr_seq_SC02_003
	ScrDef scr_seq_SC02_004
	ScrDef scr_seq_SC02_005
	ScrDef scr_seq_SC02_006
	ScrDef scr_seq_SC02_007
	ScrDef scr_seq_SC02_008
	ScrDef scr_seq_SC02_009
	ScrDef scr_seq_SC02_010
	ScrDef scr_seq_SC02_011
	ScrDef scr_seq_SC02_012
	ScrDef scr_seq_SC02_013
	ScrDef scr_seq_SC02_014
	ScrDef scr_seq_SC02_015
	ScrDef scr_seq_SC02_016
	ScrDef scr_seq_SC02_017
	ScrDef scr_seq_SC02_018
	ScrDef scr_seq_SC02_019
	ScrDef scr_seq_SC02_020
	ScrDef scr_seq_SC02_021
	ScrDef scr_seq_SC02_022
	ScrDef scr_seq_SC02_023
	ScrDef scr_seq_SC02_024
	ScrDefEnd

scr_seq_SC02_000:
	CompareVarToValue VAR_SINNOH_40F8, 2
	CallIf 1, _00F0
	CompareVarToValue VAR_SINNOH_40F8, 3
	CallIf 1, _00F8
	Call _0160
	CompareVarToValue 0x4000, 0
	CallIf 1, _01DF
	CompareVarToValue 0x4000, 1
	CallIf 1, _010E
	CompareVarToValue VAR_SINNOH_4078, 1
	CallIf 1, _012A
	CompareVarToValue VAR_SINNOH_4078, 2
	CallIf 1, _012A
	CompareVarToValue VAR_SINNOH_4078, 4
	CallIf 1, _0114
	CompareVarToValue VAR_SINNOH_4078, 5
	CallIf 1, _0150
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0140
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0148
	End

_00F0:
	SetVar VAR_SINNOH_40F8, 0
	Return

_00F8:
	MovePerson 16, 55, 716
	SetObjectFacing 16, 3
	SetObjectMovementType 16, 17
	Return

_010E:
	ClearFlag FLAG_SINNOH_606
	Return

_0114:
	MovePerson 11, 37, 721
	SetObjectFacing 11, 1
	SetObjectMovementType 11, 15
	Return

_012A:
	MovePerson 11, 39, 733
	SetObjectFacing 11, 0
	SetObjectMovementType 11, 14
	Return

_0140:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_0148:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

_0150:
	SetFlag FLAG_SINNOH_465
	SetFlag FLAG_SINNOH_467
	SetVar VAR_SINNOH_4078, 6
	Return

_0160:
	CheckFlag FLAG_SINNOH_344
	GoToIf 1, _01C2
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _01C2
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _01C2
	HasItem 454, 1, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _01C2
	SetVar 0x4000, 0   // Diamond ScrCmd_CheckEventValidity: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _01C2
	CheckFlag FLAG_SINNOH_300
	GoToIf 0, _01C2
	SetVar 0x4000, 1
	Return

_01C2:
	SetVar 0x4000, 0
	Return

scr_seq_SC02_023:
	Call _0160
	CompareVarToValue 0x4000, 0
	CallIf 1, _01DF
	End

_01DF:
	MoveBGEvent 0, 58, 713
	MoveWarp 5, 59, 712
	Return

scr_seq_SC02_001:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 723
	GoToIf 1, _023C
	CompareVarToValue 0x8005, 724
	GoToIf 1, _024A
	CompareVarToValue 0x8005, 725
	GoToIf 1, _0258
	CompareVarToValue 0x8005, 726
	GoToIf 1, _0266
	CompareVarToValue 0x8005, 727
	GoToIf 1, _0274
	End

_023C:
	MovePerson 11, 38, 723
	GoTo _0282

_024A:
	MovePerson 11, 38, 724
	GoTo _0282

_0258:
	MovePerson 11, 38, 725
	GoTo _0282

_0266:
	MovePerson 11, 38, 726
	GoTo _0282

_0274:
	MovePerson 11, 38, 727
	GoTo _0282

_0282:
	SetObjectMovementType 11, 17
	ClearFlag FLAG_SINNOH_464
	ShowPerson 11
	CallStd std_play_rival_intro_music
	ApplyMovement 11, mv_SC02_032C
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0829_SC02_00000
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _02D9
	CompareVarToValue 0x800C, 390
	GoToIf 1, _02E5
	GoTo _02CD

_02CD:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_10, 0, 0, 0
	GoTo _02F1

_02D9:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_11, 0, 0, 0
	GoTo _02F1

_02E5:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_12, 0, 0, 0
	GoTo _02F1

_02F1:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0322
	BufferRivalsName 0
	NPCMsg msg_0829_SC02_00001
	CloseMsg
	ApplyMovement 11, mv_SC02_0334
	WaitMovement
	HidePerson 11
	SetVar VAR_SINNOH_4078, 1
	ReleaseAll
	End

_0322:
	SetFlag FLAG_SINNOH_464
	WhiteOut
	ReleaseAll
	End

scr_seq_SC02_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0829_SC02_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_003:
	LockAll
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0829_SC02_00002
	CloseMsg
	ApplyMovement 11, mv_SC02_0384
	ApplyMovement obj_player, mv_SC02_0394
	WaitMovement
	HidePerson 11
	SetVar VAR_SINNOH_4078, 3
	SetVar VAR_SINNOH_40B2, 1
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC02_004:
	LockAll
	ApplyMovement 13, mv_SC02_0470
	WaitMovement
	NPCMsg msg_0829_SC02_00003
	CloseMsg
	ClearFlag FLAG_SINNOH_466
	ShowPerson 14
	Lock 14
	ApplyMovement 14, mv_SC02_0484
	WaitMovement
	NPCMsg msg_0829_SC02_00004
	CloseMsg
	ApplyMovement 14, mv_SC02_0490
	WaitMovement
	HidePerson 14
	ApplyMovement 11, mv_SC02_0498
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0829_SC02_00005
	CloseMsg
	ApplyMovement 11, mv_SC02_04A0
	WaitMovement
	HidePerson 11
	ApplyMovement 13, mv_SC02_0478
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0829_SC02_00006
	CloseMsg
	ApplyMovement 12, mv_SC02_0468
	WaitMovement
	Wait 15, 0x800C
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0436
	GoTo _0442

_0436:
	BufferPlayersName 0
	NPCMsg msg_0829_SC02_00007
	GoTo _044B

_0442:
	NPCMsg msg_0829_SC02_00008
	GoTo _044B

_044B:
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_4078, 5
	ClearFlag FLAG_SINNOH_434
	ClearFlag FLAG_SINNOH_403
	ClearFlag FLAG_SINNOH_689
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC02_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0829_SC02_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _04DE
	GoTo _04E7

_04DE:
	NPCMsg msg_0829_SC02_00009
	GoTo _04F0

_04E7:
	NPCMsg msg_0829_SC02_00010
	GoTo _04F0

_04F0:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_007:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0514
	NPCMsg msg_0829_SC02_00012
	GoTo _051D

_0514:
	NPCMsg msg_0829_SC02_00013
	GoTo _051D

_051D:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0541
	NPCMsg msg_0829_SC02_00014
	GoTo _051D

_0541:
	NPCMsg msg_0829_SC02_00015
	GoTo _051D

scr_seq_SC02_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0566
	NPCMsg msg_0829_SC02_00016
	GoTo _051D

_0566:
	NPCMsg msg_0829_SC02_00017
	GoTo _051D

scr_seq_SC02_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _058B
	NPCMsg msg_0829_SC02_00018
	GoTo _051D

_058B:
	NPCMsg msg_0829_SC02_00019
	GoTo _051D

scr_seq_SC02_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _05B6
	PlayCry 54, 0
	NPCMsg msg_0829_SC02_00020
	GoTo _051D

_05B6:
	PlayCry 54, 0
	NPCMsg msg_0829_SC02_00021
	GoTo _051D

scr_seq_SC02_012:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _05E1
	NPCMsg msg_0829_SC02_00022
	GoTo _051D

_05E1:
	NPCMsg msg_0829_SC02_00023
	GoTo _051D

scr_seq_SC02_013:
	DirectionSignpost msg_0829_SC02_00033, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_014:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0829_SC02_00034, 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_015:
	DirectionSignpost msg_0829_SC02_00035, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_016:
	DirectionSignpost msg_0829_SC02_00036, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_017:
	DirectionSignpost msg_0829_SC02_00037, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_018:
	Call _0160
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0683
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0829_SC02_00039, 0x800C
	CallStd std_signpost
	End

_0683:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0829_SC02_00038, 0x800C
	CallStd std_signpost
	End

scr_seq_SC02_020:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0829_SC02_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_019:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerFacing 0x8004
	FacePlayer
	CompareVarToValue VAR_SINNOH_4106, 2
	GoToIf 1, scr_seq_SC02_021
	NPCMsg msg_0829_SC02_00024
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_0829_SC02_00042, 0, 0
	CheckFlag FLAG_SINNOH_307
	CallIf 1, _0731
	CheckFlag FLAG_SINNOH_316
	CallIf 1, _072B
	MenuItemAdd msg_0829_SC02_00041, 1, 5
	MenuItemAdd msg_0829_SC02_00043, 2, 4
	MenuExec
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0737
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0772
	CompareVarToValue 0x800C, 2
	GoToIf 1, _07AD
	CompareVarToValue 0x800C, 3
	GoToIf 1, _07E8
	CompareVarToValue 0x800C, 5
	GoToIf 1, _sail_olivine
	GoTo _07E8

_072B:
	MenuItemAdd msg_0829_SC02_00045, 0, 2
	Return

_0731:
	MenuItemAdd msg_0829_SC02_00044, 0, 1
	Return

_0737:
	Call _07F3
	CompareVarToValue 0x8004, 1
	CallIf 1, _0812
	CompareVarToValue 0x8004, 3
	CallIf 1, _082C
	CompareVarToValue 0x8004, 0
	CallIf 1, _0846
	SinnohShipCutscene 3, 3, MAP_SINNOH_IRON_ISLAND_EXTERIOR, 100, 502
	ReleaseAll
	End

_0772:
	Call _07F3
	CompareVarToValue 0x8004, 1
	CallIf 1, _0812
	CompareVarToValue 0x8004, 3
	CallIf 1, _082C
	CompareVarToValue 0x8004, 0
	CallIf 1, _0846
	SinnohShipCutscene 3, 2, MAP_SINNOH_FULLMOON_ISLAND_EXTERIOR, 39, 277
	ReleaseAll
	End

_07AD:
	Call _07F3
	CompareVarToValue 0x8004, 1
	CallIf 1, _0812
	CompareVarToValue 0x8004, 3
	CallIf 1, _082C
	CompareVarToValue 0x8004, 0
	CallIf 1, _0846
	SinnohShipCutscene 3, 3, MAP_SINNOH_NEWMOON_ISLAND_EXTERIOR, 152, 277
	ReleaseAll
	End

_sail_olivine:
	Call _07F3
	CompareVarToValue 0x8004, 1
	CallIf 1, _0812
	CompareVarToValue 0x8004, 3
	CallIf 1, _082C
	CompareVarToValue 0x8004, 0
	CallIf 1, _0846
	SinnohShipCutscene 3, DIR_SOUTH, MAP_OLIVINE, 279, 277
	ReleaseAll
	End

_07E8:
	NPCMsg msg_0829_SC02_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07F3:
	NPCMsg msg_0829_SC02_00025
	CloseMsg
	ApplyMovement 16, mv_SC02_0860
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	ApplyMovement 16, mv_SC02_086C
	WaitMovement
	Return

_0812:
	ApplyMovement obj_player, mv_SC02_0874
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_player, mv_SC02_086C
	WaitMovement
	Return

_082C:
	ApplyMovement obj_player, mv_SC02_0884
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_player, mv_SC02_086C
	WaitMovement
	Return

_0846:
	ApplyMovement obj_player, mv_SC02_0890
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	ApplyMovement obj_player, mv_SC02_086C
	WaitMovement
	Return

scr_seq_SC02_021:
	HasItem 453, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _08EE
	NPCMsg msg_0829_SC02_00028
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08D8
	CompareVarToValue 0x800C, 1
	GoToIf 1, _08E3
	End

_08D8:
	NPCMsg msg_0829_SC02_00029
	CloseMsg
	GoTo _0772

_08E3:
	NPCMsg msg_0829_SC02_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08EE:
	NPCMsg msg_0829_SC02_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02_022:
	LockAll
	ApplyMovement 16, mv_SC02_093C
	WaitMovement
	NPCMsg msg_0829_SC02_00032
	CloseMsg
	ApplyMovement 16, mv_SC02_094C
	WaitMovement
	HidePerson 16
	MovePerson 16, 45, 750
	SetObjectFacing 16, 2
	SetObjectMovementType 16, 16
	ShowPerson 16
	SetVar VAR_SINNOH_40F8, 4
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SC02_032C:
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SC02_0334:
	.short 18, 9
	EndMovement

	.balign 4, 0
mv_SC02_0384:
	.short 17, 1
	.short 18, 5
	.short 16, 10
	EndMovement

	.balign 4, 0
mv_SC02_0394:
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC02_0468:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC02_0470:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC02_0478:
	.short 63, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC02_0484:
	.short 18, 5
	.short 16, 2
	EndMovement

	.balign 4, 0
mv_SC02_0490:
	.short 17, 6
	EndMovement

	.balign 4, 0
mv_SC02_0498:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC02_04A0:
	.short 17, 3
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC02_0860:
	.short 3, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC02_086C:
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC02_0874:
	.short 13, 1
	.short 3, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC02_0884:
	.short 15, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC02_0890:
	.short 12, 1
	.short 3, 1
	.short 64, 1
	EndMovement

	.balign 4, 0
mv_SC02_093C:
	.short 75, 1
	.short 15, 3
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SC02_094C:
	.short 13, 1
	.short 14, 3
	.short 13, 8
	EndMovement

scr_seq_SC02_024:
	SetVar VAR_SPECIAL_x8008, 416
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
