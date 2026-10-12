#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST02.h"
#include "msgdata/msg/msg_0873_ST02.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST02_000
	ScrDef scr_seq_ST02_001
	ScrDef scr_seq_ST02_002
	ScrDef scr_seq_ST02_003
	ScrDef scr_seq_ST02_004
	ScrDef scr_seq_ST02_005
	ScrDef scr_seq_ST02_006
	ScrDef scr_seq_ST02_007
	ScrDef scr_seq_ST02_008
	ScrDef scr_seq_ST02_009
	ScrDef scr_seq_ST02_010
	ScrDef scr_seq_ST02_011
	ScrDefEnd

scr_seq_ST02_000:
	CompareVarToValue VAR_SINNOH_4071, 1
	CallIf 1, _005F
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0075
	CompareVarToValue 0x4000, 1
	GoToIf 1, _007D
	End

_005F:
	MovePerson 4, 168, 845
	SetObjectFacing 4, 0
	SetObjectMovementType 4, 14
	Return

_0075:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_007D:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_ST02_001:
	LockAll
	ApplyMovement 4, mv_ST02_03A4
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 843
	GoToIf 1, _00E7
	CompareVarToValue 0x8005, 844
	GoToIf 1, _00FF
	CompareVarToValue 0x8005, 845
	GoToIf 1, _010F
	CompareVarToValue 0x8005, 846
	GoToIf 1, _011F
	CompareVarToValue 0x8005, 847
	GoToIf 1, _0137
	CompareVarToValue 0x8005, 848
	GoToIf 1, _014F
	End

_00E7:
	ApplyMovement 4, mv_ST02_03B0
	ApplyMovement obj_player, mv_ST02_0474
	WaitMovement
	GoTo _0169

_00FF:
	ApplyMovement 4, mv_ST02_03BC
	WaitMovement
	GoTo _0169

_010F:
	ApplyMovement 4, mv_ST02_03CC
	WaitMovement
	GoTo _0169

_011F:
	ApplyMovement 4, mv_ST02_03D4
	ApplyMovement obj_player, mv_ST02_0498
	WaitMovement
	GoTo _0169

_0137:
	ApplyMovement 4, mv_ST02_03E0
	ApplyMovement obj_player, mv_ST02_04A4
	WaitMovement
	GoTo _0169

_014F:
	ApplyMovement 4, mv_ST02_03EC
	ApplyMovement obj_player, mv_ST02_04B0
	WaitMovement
	GoTo _0169

_0169:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0189
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0195
	End

_0189:
	BufferFriendsName 0
	NPCMsg msg_0873_ST02_00000
	GoTo _01A1

_0195:
	BufferFriendsName 0
	NPCMsg msg_0873_ST02_00002
	GoTo _01A1

_01A1:
	CloseMsg
	CompareVarToValue 0x8005, 843
	GoToIf 1, _01F3
	CompareVarToValue 0x8005, 844
	GoToIf 1, _020B
	CompareVarToValue 0x8005, 845
	GoToIf 1, _0223
	CompareVarToValue 0x8005, 846
	GoToIf 1, _023B
	CompareVarToValue 0x8005, 847
	GoToIf 1, _0253
	CompareVarToValue 0x8005, 848
	GoToIf 1, _026B
	End

_01F3:
	ApplyMovement 4, mv_ST02_03F8
	ApplyMovement obj_player, mv_ST02_04BC
	WaitMovement
	GoTo _0283

_020B:
	ApplyMovement 4, mv_ST02_0404
	ApplyMovement obj_player, mv_ST02_04CC
	WaitMovement
	GoTo _0283

_0223:
	ApplyMovement 4, mv_ST02_0410
	ApplyMovement obj_player, mv_ST02_04DC
	WaitMovement
	GoTo _0283

_023B:
	ApplyMovement 4, mv_ST02_0420
	ApplyMovement obj_player, mv_ST02_04F0
	WaitMovement
	GoTo _0283

_0253:
	ApplyMovement 4, mv_ST02_0434
	ApplyMovement obj_player, mv_ST02_0508
	WaitMovement
	GoTo _0283

_026B:
	ApplyMovement 4, mv_ST02_0444
	ApplyMovement obj_player, mv_ST02_0518
	WaitMovement
	GoTo _0283

_0283:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02A3
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02AC
	End

_02A3:
	NPCMsg msg_0873_ST02_00001
	GoTo _02B5

_02AC:
	NPCMsg msg_0873_ST02_00003
	GoTo _02B5

_02B5:
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	ClearFlag FLAG_SINNOH_437
	ShowPerson 3
	ApplyMovement 3, mv_ST02_054C
	WaitMovement
	ApplyMovement 3, mv_ST02_0554
	WaitMovement
	PlayFanfare 1538
	NPCMsg msg_0873_ST02_00004
	ApplyMovement 3, mv_ST02_055C
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00005
	CloseMsg
	ApplyMovement obj_player, mv_ST02_0540
	ApplyMovement 4, mv_ST02_0468
	ApplyMovement 3, mv_ST02_0564
	WaitMovement
	HidePerson 3
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _033C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _034A
	End

_033C:
	BufferFriendsName 0
	NPCMsg msg_0873_ST02_00006
	GoTo _0356

_034A:
	BufferFriendsName 0
	NPCMsg msg_0873_ST02_00007
	GoTo _0356

_0356:
	CloseMsg
	ApplyMovement 4, mv_ST02_0454
	ApplyMovement obj_player, mv_ST02_0528
	WaitMovement
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	HidePerson 4
	SetVar VAR_SINNOH_4071, 1
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_SANDGEM_ROWANS_LAB, 0, 7, 15, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	End

scr_seq_ST02_002:
	LockAll
	ApplyMovement 4, mv_ST02_0714
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _05A0
	CompareVarToValue 0x800C, 1
	GoToIf 1, _05AF
	ReleaseAll
	End

_05A0:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00008
	GoTo _05BE

_05AF:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00013
	GoTo _05BE

_05BE:
	CloseMsg
	CallStd 2048 /* TODO Diamond std script */
	ApplyMovement 4, mv_ST02_071C
	ApplyMovement obj_player, mv_ST02_06DC
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _05F6
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0605
	ReleaseAll
	End

_05F6:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00009
	GoTo _0614

_0605:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00014
	GoTo _0614

_0614:
	CloseMsg
	ApplyMovement 4, mv_ST02_0728
	ApplyMovement obj_player, mv_ST02_06EC
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0648
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0654
	ReleaseAll
	End

_0648:
	BufferPlayersName 0
	NPCMsg msg_0873_ST02_00010
	GoTo _0660

_0654:
	BufferPlayersName 0
	NPCMsg msg_0873_ST02_00015
	GoTo _0660

_0660:
	CloseMsg
	ApplyMovement 4, mv_ST02_0734
	ApplyMovement obj_player, mv_ST02_06F8
	WaitMovement
	ApplyMovement 4, mv_ST02_073C
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _069E
	CompareVarToValue 0x800C, 1
	GoToIf 1, _06AA
	ReleaseAll
	End

_069E:
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00011
	GoTo _06B6

_06AA:
	BufferPlayersName 1
	NPCMsg msg_0873_ST02_00016
	GoTo _06B6

_06B6:
	CloseMsg
	ApplyMovement 4, mv_ST02_0744
	ApplyMovement obj_player, mv_ST02_0700
	WaitMovement
	CallStd 2049 /* TODO Diamond std script */
	HidePerson 4
	SetVar VAR_SINNOH_4071, 2
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST02_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0873_ST02_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0873_ST02_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0873_ST02_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0873_ST02_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02_007:
	DirectionSignpost msg_0873_ST02_00021, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST02_008:
	DirectionSignpost msg_0873_ST02_00022, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST02_009:
	BufferFriendsName 0
	DirectionSignpost msg_0873_ST02_00023, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST02_010:
	DirectionSignpost msg_0873_ST02_00024, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST02_011:
	DirectionSignpost msg_0873_ST02_00025, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_ST02_03A4:
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_ST02_03B0:
	.short 14, 4
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_ST02_03BC:
	.short 14, 2
	.short 12, 1
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_ST02_03CC:
	.short 14, 3
	EndMovement

	.balign 4, 0
mv_ST02_03D4:
	.short 14, 4
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_ST02_03E0:
	.short 14, 4
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_ST02_03EC:
	.short 14, 4
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_ST02_03F8:
	.short 15, 5
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0404:
	.short 15, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0410:
	.short 12, 1
	.short 15, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0420:
	.short 15, 2
	.short 12, 1
	.short 15, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0434:
	.short 12, 2
	.short 15, 5
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0444:
	.short 12, 2
	.short 15, 5
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0454:
	.short 12, 1
	.short 14, 1
	.short 12, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_ST02_0468:
	.short 62, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST02_0474:
	.short 63, 3
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_ST02_0498:
	.short 63, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04A4:
	.short 63, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04B0:
	.short 63, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04BC:
	.short 13, 1
	.short 15, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04CC:
	.short 15, 2
	.short 15, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04DC:
	.short 15, 1
	.short 12, 1
	.short 15, 3
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_04F0:
	.short 12, 1
	.short 15, 2
	.short 12, 1
	.short 15, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0508:
	.short 12, 3
	.short 15, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0518:
	.short 12, 4
	.short 15, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0528:
	.short 63, 1
	.short 32, 1
	.short 63, 2
	.short 12, 2
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_ST02_0540:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST02_054C:
	.short 17, 1
	EndMovement

	.balign 4, 0
mv_ST02_0554:
	.short 37, 2
	EndMovement

	.balign 4, 0
mv_ST02_055C:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_ST02_0564:
	.short 19, 2
	.short 17, 1
	.short 19, 7
	EndMovement

	.balign 4, 0
mv_ST02_06DC:
	.short 13, 1
	.short 15, 9
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_06EC:
	.short 15, 10
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_06F8:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST02_0700:
	.short 63, 1
	.short 33, 1
	.short 62, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST02_0714:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_ST02_071C:
	.short 15, 10
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0728:
	.short 15, 10
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST02_0734:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST02_073C:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_ST02_0744:
	.short 13, 1
	.short 14, 5
	.short 12, 10
	EndMovement


	.balign 4, 0
