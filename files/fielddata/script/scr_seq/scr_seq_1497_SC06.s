#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06.h"
#include "msgdata/msg/msg_1095_SC06.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06_000
	ScrDef scr_seq_SC06_001
	ScrDef scr_seq_SC06_002
	ScrDef scr_seq_SC06_003
	ScrDef scr_seq_SC06_004
	ScrDef scr_seq_SC06_005
	ScrDef scr_seq_SC06_006
	ScrDef scr_seq_SC06_007
	ScrDef scr_seq_SC06_008
	ScrDef scr_seq_SC06_009
	ScrDef scr_seq_SC06_010
	ScrDef scr_seq_SC06_011
	ScrDef scr_seq_SC06_012
	ScrDef scr_seq_SC06_013
	ScrDef scr_seq_SC06_014
	ScrDef scr_seq_SC06_015
	ScrDefEnd

scr_seq_SC06_000:
	CheckFlag FLAG_SINNOH_258
	GoToIf 1, _004F
	End

_004F:
	MovePerson 21, 637, 812
	SetObjectFacing 21, 3
	SetObjectMovementType 21, 17
	End

scr_seq_SC06_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 3, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00D7
	NPCMsg msg_1095_SC06_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D7:
	NPCMsg msg_1095_SC06_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_296
	GoToIf 1, _013C
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	CallIf 1, _0147
	CompareVarToValue 0x800C, 390
	CallIf 1, _014F
	CompareVarToValue 0x800C, 393
	CallIf 1, _0157
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_1095_SC06_00016
	SetVar 0x8005, 1
	CallStd 2015 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_296
	CloseMsg
	ReleaseAll
	End

_013C:
	NPCMsg msg_1095_SC06_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0147:
	SetVar 0x8004, 93
	Return

_014F:
	SetVar 0x8004, 94
	Return

_0157:
	SetVar 0x8004, 92
	Return

scr_seq_SC06_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1095_SC06_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_1095_SC06_00015
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06_008:
	PlayFanfare 1500
	LockAll
	CheckFlag FLAG_SINNOH_258
	GoToIf 1, _0263
	CheckFlag FLAG_SINNOH_257
	GoToIf 1, _01DE
	NPCMsg msg_1095_SC06_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01DE:
	CheckBadge 3, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _021E
	NPCMsg msg_1095_SC06_00002
	FacePlayer
	ApplyMovement 21, mv_SC06_0558
	WaitMovement
	NPCMsg msg_1095_SC06_00003
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 2
	GoToIf 1, _022B
	GoTo _023D

_021E:
	FacePlayer
	NPCMsg msg_1095_SC06_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_022B:
	ApplyMovement 21, mv_SC06_0560
	WaitMovement
	GoTo _024F

_023D:
	ApplyMovement 21, mv_SC06_056C
	WaitMovement
	GoTo _024F

_024F:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	SetFlag FLAG_SINNOH_258
	ReleaseAll
	End

_0263:
	FacePlayer
	NPCMsg msg_1095_SC06_00004
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 2
	GoToIf 1, _029D
	CompareVarToValue 0x800C, 3
	GoToIf 1, _02BD
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02D5
	GoTo _02F5

_029D:
	SetVar 0x8007, 2
	ApplyMovement 21, mv_SC06_0574
	ApplyMovement obj_player, mv_SC06_04D8
	WaitMovement
	GoTo _0315

_02BD:
	SetVar 0x8007, 3
	ApplyMovement 21, mv_SC06_0584
	WaitMovement
	GoTo _0315

_02D5:
	SetVar 0x8007, 0
	ApplyMovement 21, mv_SC06_0584
	ApplyMovement obj_player, mv_SC06_04F8
	WaitMovement
	GoTo _0315

_02F5:
	SetVar 0x8007, 1
	ApplyMovement 21, mv_SC06_0584
	ApplyMovement obj_player, mv_SC06_04F0
	WaitMovement
	GoTo _0315

_0315:
	PlayFanfare 1539
	HidePerson 21
	Wait 15, 0x800C
	ClearFlag FLAG_SINNOH_455
	ShowPerson 22
	CallStd std_play_rival_intro_music
	CompareVarToValue 0x8007, 2
	CallIf 1, _039C
	CompareVarToValue 0x8007, 3
	CallIf 1, _03A8
	CompareVarToValue 0x8007, 0
	CallIf 1, _03B4
	CompareVarToValue 0x8007, 1
	CallIf 1, _03C0
	ApplyMovement obj_player, mv_SC06_04D0
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1095_SC06_00005
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _03DA
	CompareVarToValue 0x800C, 390
	GoToIf 1, _03E8
	GoTo _03CC

_039C:
	ApplyMovement 22, mv_SC06_0530
	WaitMovement
	Return

_03A8:
	ApplyMovement 22, mv_SC06_0538
	WaitMovement
	Return

_03B4:
	ApplyMovement 22, mv_SC06_0540
	WaitMovement
	Return

_03C0:
	ApplyMovement 22, mv_SC06_054C
	WaitMovement
	Return

_03CC:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_7, 0, 0, 0
	GoTo _03F6

_03DA:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_8, 0, 0, 0
	GoTo _03F6

_03E8:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_9, 0, 0, 0
	GoTo _03F6

_03F6:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _04C0
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1095_SC06_00006
	CloseMsg
	CompareVarToValue 0x8007, 2
	GoToIf 1, _0448
	CompareVarToValue 0x8007, 3
	GoToIf 1, _0462
	CompareVarToValue 0x8007, 0
	GoToIf 1, _047C
	CompareVarToValue 0x8007, 1
	GoToIf 1, _0496
	End

_0448:
	ApplyMovement 22, mv_SC06_0590
	ApplyMovement obj_player, mv_SC06_0500
	WaitMovement
	GoTo _04B0

_0462:
	ApplyMovement 22, mv_SC06_05A0
	ApplyMovement obj_player, mv_SC06_050C
	WaitMovement
	GoTo _04B0

_047C:
	ApplyMovement 22, mv_SC06_05B0
	ApplyMovement obj_player, mv_SC06_0518
	WaitMovement
	GoTo _04B0

_0496:
	ApplyMovement 22, mv_SC06_05C0
	ApplyMovement obj_player, mv_SC06_0524
	WaitMovement
	GoTo _04B0

_04B0:
	PlayFanfare 1539
	HidePerson 22
	SetFlag FLAG_SINNOH_259
	ReleaseAll
	End

_04C0:
	ClearFlag FLAG_SINNOH_554
	SetFlag FLAG_SINNOH_455
	WhiteOut
	ReleaseAll
	End

scr_seq_SC06_012:
	DirectionSignpost msg_1095_SC06_00020, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC06_013:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1095_SC06_00021, 0x800C
	CallStd std_signpost
	End

scr_seq_SC06_014:
	DirectionSignpost msg_1095_SC06_00022, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC06_015:
	DirectionSignpost msg_1095_SC06_00023, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SC06_04D0:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC06_04D8:
	.short 33, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_04F0:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_04F8:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_0500:
	.short 33, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_050C:
	.short 33, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_0518:
	.short 32, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_0524:
	.short 33, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC06_0530:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC06_0538:
	.short 19, 7
	EndMovement

	.balign 4, 0
mv_SC06_0540:
	.short 17, 1
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SC06_054C:
	.short 16, 1
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SC06_0558:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC06_0560:
	.short 17, 1
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SC06_056C:
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SC06_0574:
	.short 17, 1
	.short 19, 2
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC06_0584:
	.short 19, 2
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC06_0590:
	.short 17, 1
	.short 19, 2
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC06_05A0:
	.short 17, 1
	.short 19, 4
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC06_05B0:
	.short 16, 1
	.short 19, 3
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC06_05C0:
	.short 17, 1
	.short 19, 3
	.short 39, 1
	EndMovement

	.balign 4, 0
