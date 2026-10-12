#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD27R0101.h"
#include "msgdata/msg/msg_0890_SD27R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD27R0101_000
	ScrDef scr_seq_SD27R0101_001
	ScrDef scr_seq_SD27R0101_002
	ScrDef scr_seq_SD27R0101_003
	ScrDef scr_seq_SD27R0101_004
	ScrDef scr_seq_SD27R0101_005
	ScrDef scr_seq_SD27R0101_006
	ScrDef scr_seq_SD27R0101_007
	ScrDefEnd

scr_seq_SD27R0101_000:
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _003E
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0046
	End

_003E:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_0046:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_SD27R0101_001:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _005B
	End

_005B:
	SetFlag FLAG_SINNOH_429
	HidePerson 3
	HidePerson 2
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD27R0101_002:
	LockAll
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	ApplyMovement 5, mv_SD27R0101_050C
	ApplyMovement obj_player, mv_SD27R0101_05C4
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0890_SD27R0101_00000
	CloseMsg
	// Diamond ScrCmd_LockCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	ApplyMovement 241, mv_SD27R0101_0428
	WaitMovement
	Wait 15, 0x800C
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BC
	GoTo _00C7

_00BC:
	NPCMsg msg_0890_SD27R0101_00003
	GoTo _00D2

_00C7:
	NPCMsg msg_0890_SD27R0101_00004
	GoTo _00D2

_00D2:
	NPCMsg msg_0890_SD27R0101_00005
	ApplyMovement 0, mv_SD27R0101_043C
	WaitMovement
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00006
	CloseMsg
	ApplyMovement 0, mv_SD27R0101_0444
	ApplyMovement 1, mv_SD27R0101_0470
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0112
	GoTo _0120

_0112:
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00007
	GoTo _012E

_0120:
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00008
	GoTo _012E

_012E:
	NPCMsg msg_0890_SD27R0101_00009
	CloseMsg
	Wait 30, 0x800C
	ClearFlag FLAG_SINNOH_404
	ShowPerson 4
	ApplyMovement 0, mv_SD27R0101_0454
	ApplyMovement 1, mv_SD27R0101_0494
	ApplyMovement 5, mv_SD27R0101_0514
	ApplyMovement obj_player, mv_SD27R0101_05CC
	ApplyMovement 241, mv_SD27R0101_0434
	WaitMovement
	// Diamond ScrCmd_ReleaseCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	NPCMsg msg_0890_SD27R0101_00010
	CloseMsg
	ApplyMovement 0, mv_SD27R0101_0464
	WaitMovement
	ApplyMovement 1, mv_SD27R0101_04A8
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _019F
	GoTo _01AD

_019F:
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00011
	GoTo _01BB

_01AD:
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00012
	GoTo _01BB

_01BB:
	CloseMsg
	ApplyMovement 1, mv_SD27R0101_04D0
	WaitMovement
	PlayFanfare 1539
	HidePerson 0
	HidePerson 1
	Wait 50, 0x800C
	ApplyMovement 5, mv_SD27R0101_0524
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0890_SD27R0101_00013
	CloseMsg
	Wait 30, 0x800C
	ApplyMovement 5, mv_SD27R0101_0530
	WaitMovement
	Wait 30, 0x800C
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00014
	CloseMsg
	ApplyMovement 5, mv_SD27R0101_0538
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_0890_SD27R0101_00015
	CloseMsg
	ApplyMovement 5, mv_SD27R0101_0540
	ApplyMovement obj_player, mv_SD27R0101_05D8
	WaitMovement
	NPCMsg msg_0890_SD27R0101_00016
	CloseMsg
	StopBGM 1070
	PlayBGM 1140
	ClearFlag FLAG_SINNOH_429
	ShowPerson 3
	ShowPerson 2
	PlayFanfare 1609
	ApplyMovement 3, mv_SD27R0101_0650
	ApplyMovement 2, mv_SD27R0101_0658
	WaitMovement
	PlayCry 396, 0
	ApplyMovement 5, mv_SD27R0101_0564
	ApplyMovement obj_player, mv_SD27R0101_060C
	WaitMovement
	NPCMsg msg_0890_SD27R0101_00017
	ApplyMovement 5, mv_SD27R0101_056C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00018
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_StarterSelectionScreen 0x0b4 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_EndStarterSelectionScreen 0x0b5 args []: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	GetStarterChoice 0x8000
	GiveMon 0x8000, 5, 0, 0, 0, 0x800C
	SetFlag FLAG_SINNOH_142
	// TODO Diamond ScrCmd_FirstBattle 0x125 args [396, 2]: no HeartGold mapping yet
	ClearFlag FLAG_SINNOH_142
	GoTo _02CE

_02CE:
	ApplyMovement 5, mv_SD27R0101_05A0
	ApplyMovement obj_player, mv_SD27R0101_062C
	WaitMovement
	HealParty
	BufferRivalsName 0
	// TODO Diamond ScrCmd_GetPlayerStarterName 0x0db args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRivalStarterName 0x0dc args [2]: no HeartGold mapping yet
	NPCMsg msg_0890_SD27R0101_00019
	CloseMsg
	ClearFlag FLAG_SINNOH_434
	MovePerson 1, 47, 51
	ShowPerson 1
	Lock 1
	CallStd 2040 /* TODO Diamond std script */
	ApplyMovement 1, mv_SD27R0101_04DC
	ApplyMovement 5, mv_SD27R0101_0574
	ApplyMovement obj_player, mv_SD27R0101_05F4
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0339
	GoTo _0354

_0339:
	BufferFriendsName 0
	NPCMsg msg_0890_SD27R0101_00020
	CloseMsg
	ApplyMovement 1, mv_SD27R0101_04F0
	WaitMovement
	NPCMsg msg_0890_SD27R0101_00021
	GoTo _036C

_0354:
	NPCMsg msg_0890_SD27R0101_00022
	CloseMsg
	ApplyMovement 1, mv_SD27R0101_04F0
	WaitMovement
	NPCMsg msg_0890_SD27R0101_00023
	GoTo _036C

_036C:
	CloseMsg
	ApplyMovement 1, mv_SD27R0101_047C
	WaitMovement
	HidePerson 4
	Wait 15, 0x800C
	ApplyMovement 1, mv_SD27R0101_0484
	ApplyMovement 5, mv_SD27R0101_0584
	ApplyMovement obj_player, mv_SD27R0101_0614
	WaitMovement
	HidePerson 1
	CallStd 2041 /* TODO Diamond std script */
	BufferRivalsName 0
	NPCMsg msg_0890_SD27R0101_00024
	CloseMsg
	ApplyMovement 5, mv_SD27R0101_0590
	ApplyMovement obj_player, mv_SD27R0101_0620
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00025
	CloseMsg
	ClearFlag FLAG_SINNOH_406
	ClearFlag FLAG_SINNOH_407
	SetVar VAR_SINNOH_4095, 1
	SetVar VAR_SINNOH_4082, 2
	ClearFlag FLAG_SINNOH_435
	SetVar VAR_SINNOH_4086, 2
	SetVar VAR_SINNOH_40A4, 3
	ApplyMovement 5, mv_SD27R0101_05A8
	ApplyMovement obj_player, mv_SD27R0101_0634
	WaitMovement
	PlayFanfare 1539
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_VERITY_LAKEFRONT, 0, 81, 842, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SD27R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_184
	GoToIf 1, _0685
	SetFlag FLAG_SINNOH_184
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0685:
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD27R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _06B2
	GoTo _06BE

_06B2:
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00028
	GoTo _06CA

_06BE:
	BufferPlayersName 0
	NPCMsg msg_0890_SD27R0101_00029
	GoTo _06CA

_06CA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD27R0101_005:
	End

scr_seq_SD27R0101_006:
	End

	.balign 4, 0
mv_SD27R0101_0428:
	.short 63, 1
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SD27R0101_0434:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SD27R0101_043C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0444:
	.short 33, 1
	.short 63, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0454:
	.short 13, 5
	.short 14, 1
	.short 13, 4
	EndMovement

	.balign 4, 0
mv_SD27R0101_0464:
	.short 13, 3
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0470:
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_047C:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0484:
	.short 13, 4
	.short 14, 2
	.short 13, 5
	EndMovement

	.balign 4, 0
mv_SD27R0101_0494:
	.short 14, 1
	.short 13, 5
	.short 14, 1
	.short 13, 3
	EndMovement

	.balign 4, 0
mv_SD27R0101_04A8:
	.short 13, 1
	.short 34, 1
	.short 62, 1
	.short 39, 1
	.short 62, 1
	.short 38, 1
	.short 63, 1
	.short 33, 1
	.short 63, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_04D0:
	.short 13, 3
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_04DC:
	.short 12, 4
	.short 15, 2
	.short 12, 4
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_04F0:
	.short 33, 1
	.short 63, 1
	.short 39, 1
	.short 63, 1
	.short 33, 1
	.short 62, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_050C:
	.short 16, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0514:
	.short 63, 10
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0524:
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0530:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0538:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0540:
	.short 12, 5
	.short 15, 1
	.short 12, 4
	.short 15, 1
	.short 12, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0564:
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_056C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0574:
	.short 63, 7
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0584:
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0590:
	.short 14, 1
	.short 13, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_05A0:
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_05A8:
	.short 13, 1
	.short 14, 1
	.short 13, 3
	.short 14, 1
	.short 13, 6
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_05C4:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_05CC:
	.short 63, 10
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_05D8:
	.short 15, 1
	.short 12, 5
	.short 15, 1
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_SD27R0101_05F4:
	.short 63, 5
	.short 33, 1
	.short 63, 2
	.short 35, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_060C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0614:
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0620:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_062C:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0634:
	.short 63, 1
	.short 33, 1
	.short 13, 4
	.short 14, 1
	.short 13, 6
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SD27R0101_0650:
	.short 16, 6
	EndMovement

	.balign 4, 0
mv_SD27R0101_0658:
	.short 18, 7
	EndMovement

scr_seq_SD27R0101_007:
	SetVar VAR_SPECIAL_x8008, 365
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
