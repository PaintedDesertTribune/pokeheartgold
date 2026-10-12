#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0114.h"
#include "msgdata/msg/msg_1131_SD05R0114.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0114_000
	ScrDef scr_seq_SD05R0114_001
	ScrDef scr_seq_SD05R0114_002
	ScrDef scr_seq_SD05R0114_003
	ScrDef scr_seq_SD05R0114_004
	ScrDef scr_seq_SD05R0114_005
	ScrDef scr_seq_SD05R0114_006
	ScrDef scr_seq_SD05R0114_007
	ScrDef scr_seq_SD05R0114_008
	ScrDef scr_seq_SD05R0114_009
	ScrDef scr_seq_SD05R0114_010
	ScrDef scr_seq_SD05R0114_011
	ScrDef scr_seq_SD05R0114_012
	ScrDef scr_seq_SD05R0114_013
	ScrDef scr_seq_SD05R0114_014
	ScrDef scr_seq_SD05R0114_015
	ScrDefEnd

scr_seq_SD05R0114_000:
	SetFlag FLAG_SINNOH_2503
	Call _011F
	Call _0086
	Call _00A5
	Call _00C2
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0076
	CompareVarToValue 0x4000, 1
	GoToIf 1, _007E
	End

_0076:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_007E:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

_0086:
	SetVar 0x4021, SPRITE_SINNOH_SPPOKE4
	// TODO Diamond ScrCmd_GetGameVersion 0x246 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 10
	GoToIf 1, _00A3
	SetVar 0x4021, SPRITE_SINNOH_SPPOKE5

_00A3:
	Return

_00A5:
	// TODO Diamond ScrCmd_GetGameVersion 0x246 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 10
	GoToIf 1, _00BC
	SetFlag FLAG_SINNOH_1023
	Return

_00BC:
	SetFlag FLAG_SINNOH_1025
	Return

_00C2:
	CheckGameClearFlag 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _011D
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _011D
	HasItem 455, 1, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _011D
	SetVar 0x4000, 0   // Diamond ScrCmd_CheckEventValidity: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _011D
	CheckFlag FLAG_SINNOH_286
	GoToIf 1, _011D
	SetVar VAR_SINNOH_4118, 1

_011D:
	Return

_011F:
	// TODO Diamond ScrCmd_DebugWatch 0x1f9 args [16536]: no HeartGold mapping yet
	CompareVarToValue VAR_SINNOH_4098, 0
	GoToIf 1, _0173
	CompareVarToValue VAR_SINNOH_4098, 1
	GoToIf 1, _0173
	CompareVarToValue VAR_SINNOH_4098, 2
	GoToIf 1, _018D
	CompareVarToValue VAR_SINNOH_4098, 3
	GoToIf 1, _018F
	CompareVarToValue VAR_SINNOH_4098, 4
	GoToIf 1, _01A1
	CompareVarToValue VAR_SINNOH_4098, 5
	GoToIf 1, _01AF
	Return

_0173:
	SetFlag FLAG_SINNOH_484
	SetFlag FLAG_SINNOH_485
	SetFlag FLAG_SINNOH_483
	SetFlag FLAG_SINNOH_492
	SetFlag FLAG_SINNOH_493
	SetFlag FLAG_SINNOH_494
	Return

_018D:
	Return

_018F:
	MovePerson 7, 30, 32
	MovePerson 8, 32, 32
	Return

_01A1:
	SetFlag FLAG_SINNOH_484
	SetFlag FLAG_SINNOH_485
	SetFlag FLAG_SINNOH_483
	Return

_01AF:
	SetFlag FLAG_SINNOH_484
	SetFlag FLAG_SINNOH_485
	ClearFlag FLAG_SINNOH_482
	Return

scr_seq_SD05R0114_001:
	CheckFlag FLAG_SINNOH_190
	GoToIf 0, _01CD
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [2, 16384]: no HeartGold mapping yet

_01CD:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _01DA
	End

_01DA:
	SetFlag FLAG_SINNOH_482
	HidePerson 5
	ClearFlag FLAG_SINNOH_142
	End

_01E8:
	// TODO Diamond ScrCmd_GetGameVersion 0x246 args [32780]: no HeartGold mapping yet
	CopyVar 0x8004, 0x8005
	CompareVarToValue 0x800C, 10
	GoToIf 1, _0205
	CopyVar 0x8004, 0x8006

_0205:
	Return

_0207:
	GetPlayerGender 0x800C
	CopyVar 0x8004, 0x8005
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0224
	CopyVar 0x8004, 0x8006

_0224:
	Return

scr_seq_SD05R0114_002:
	LockAll
	ApplyMovement 0, mv_SD05R0114_0270
	ApplyMovement 3, mv_SD05R0114_0280
	WaitMovement
	// TODO Diamond ScrCmd_Unk00EE 0x0ee args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 5, _02C2
	NPCMsg msg_1131_SD05R0114_00001
	CloseMsg
	ApplyMovement obj_player, mv_SD05R0114_0290
	WaitMovement
	ApplyMovement 0, mv_SD05R0114_0278
	ApplyMovement 3, mv_SD05R0114_0288
	WaitMovement
	ReleaseAll
	End

scr_seq_SD05R0114_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_4098, 0
	GoToIf 5, _02FE
	// TODO Diamond ScrCmd_Unk00EE 0x0ee args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02EF

_02C2:
	NPCMsg msg_1131_SD05R0114_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_30, TRAINER_SINNOH_GALACTIC_F_GRUNT_16, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02F8
	SetVar VAR_SINNOH_4098, 1
	NPCMsg msg_1131_SD05R0114_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02EF:
	NPCMsg msg_1131_SD05R0114_00001
	CloseMsg
	ReleaseAll
	End

_02F8:
	WhiteOut
	ReleaseAll
	End

_02FE:
	NPCMsg msg_1131_SD05R0114_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD05R0114_003:
	LockAll
	ShowPerson 5
	Release 5
	GetPlayerCoords 0x8000, 0x8001
	// Diamond ScrCmd_LockCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	Call _0510
	WaitMovement
	SetVar 0x8005, 3
	SetVar 0x8006, 4
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	CloseMsg
	FadeOutBGM 0, 60
	ApplyMovement 1, mv_SD05R0114_0504
	WaitMovement
	ApplyMovement 241, mv_SD05R0114_069C
	WaitMovement
	// TODO Diamond ScrCmd_Unk005D 0x05d args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [0, 32780]: no HeartGold mapping yet
	Wait 162, 0x800C
	PlayBGM SEQ_GS_E_TSURETEKE2

_036A:
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [1, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _036A
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [2, 32780]: no HeartGold mapping yet
	ApplyMovement 241, mv_SD05R0114_06A8
	WaitMovement
	SetVar 0x8005, 5
	SetVar 0x8006, 6
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0058 0x058 args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_ScopeMode 0x2c3 args [1]: no HeartGold mapping yet
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ReleaseCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	CloseMsg
	Warp MAP_SINNOH_MOUNT_CORONET_SPEAR_PILLAR, 0, 31, 25, 3
	ShowPerson 255
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [7, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	PlayBGM SEQ_GS_E_TSURETEKE1
	WaitFade
	Wait 90, 0x800C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_VALLEY_WINDWORKS_EXTERIOR, 0, 240, 660, 3
	ShowPerson 255
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [8, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	Wait 90, 0x800C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_HEARTHOME, 0, 479, 692, 2
	ShowPerson 255
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [9, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	Wait 90, 0x800C
	FadeScreen 6, 1, 0, 0
	WaitFade
	SetFlag FLAG_SINNOH_190
	Warp MAP_SINNOH_MOUNT_CORONET_SPEAR_PILLAR, 0, 0x8000, 0x8001, 0
	HidePerson 255
	// Diamond ScrCmd_LockCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	Call _0510
	WaitMovement
	FadeScreen 6, 1, 1, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0058 0x058 args [0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_ScopeMode 0x2c3 args [0]: no HeartGold mapping yet
	SetVar 0x8005, 7
	SetVar 0x8006, 8
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	CloseMsg
	ApplyMovement 241, mv_SD05R0114_069C
	WaitMovement
	SetVar 0x8005, 483
	SetVar 0x8006, 484
	Call _01E8
	PlayCry 0x8004, 0
	SetVar 0x8005, 9
	SetVar 0x8006, 10
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitCry
	CloseMsg
	ApplyMovement 241, mv_SD05R0114_06A8
	WaitMovement
	NPCMsg msg_1131_SD05R0114_00011
	WaitButton
	CloseMsg
	Call _06C4
	WaitMovement
	// Diamond ScrCmd_ReleaseCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	SetVar VAR_SINNOH_4098, 2
	ReleaseAll
	End

_0510:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 29
	GoToIf 1, _055F
	CompareVarToValue 0x8008, 30
	GoToIf 1, _0569
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0573
	CompareVarToValue 0x8008, 32
	GoToIf 1, _057D
	CompareVarToValue 0x8008, 33
	GoToIf 1, _0587
	Return

_055F:
	ApplyMovement 241, mv_SD05R0114_0594
	Return

_0569:
	ApplyMovement 241, mv_SD05R0114_05A4
	Return

_0573:
	ApplyMovement 241, mv_SD05R0114_05B4
	Return

_057D:
	ApplyMovement 241, mv_SD05R0114_05C0
	Return

_0587:
	ApplyMovement 241, mv_SD05R0114_05D0
	Return

_06C4:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 29
	GoToIf 1, _0713
	CompareVarToValue 0x8008, 30
	GoToIf 1, _071D
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0727
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0731
	CompareVarToValue 0x8008, 33
	GoToIf 1, _073B
	Return

_0713:
	ApplyMovement 241, mv_SD05R0114_0748
	Return

_071D:
	ApplyMovement 241, mv_SD05R0114_0758
	Return

_0727:
	ApplyMovement 241, mv_SD05R0114_0768
	Return

_0731:
	ApplyMovement 241, mv_SD05R0114_0774
	Return

_073B:
	ApplyMovement 241, mv_SD05R0114_0784
	Return

scr_seq_SD05R0114_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1131_SD05R0114_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD05R0114_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1131_SD05R0114_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD05R0114_012:
	LockAll
	NPCMsg msg_1131_SD05R0114_00016
	CloseMsg
	ApplyMovement obj_player, mv_SD05R0114_07D0
	WaitMovement
	ReleaseAll
	End

scr_seq_SD05R0114_004:
	LockAll
	Call _08FA
	NPCMsg msg_1131_SD05R0114_00012
	NPCMsg msg_1131_SD05R0114_00013
	CloseMsg
	Call _0867
	BufferRivalsName 0
	NPCMsg msg_1131_SD05R0114_00014
	NPCMsg msg_1131_SD05R0114_00015
	CloseMsg
	Call _09B0
	// TODO Diamond ScrCmd_Unk02A0 0x2a0 args [32772, 528, 407]: no HeartGold mapping yet
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0857
	Call _09E2
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1131_SD05R0114_00020
	PlaySE SEQ_ME_ASA
	WaitSE SEQ_ME_ASA
	HealParty
	NPCMsg msg_1131_SD05R0114_00021
	NPCMsg msg_1131_SD05R0114_00022
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 1]: no HeartGold mapping yet
	ApplyMovement 6, mv_SD05R0114_0A8C
	WaitMovement
	HidePerson 6
	GoTo _0A94

_0857:
	SetVar VAR_SINNOH_4098, 1
	ClearFlag FLAG_SINNOH_190
	WhiteOut
	ReleaseAll
	End

_0867:
	ClearFlag FLAG_SINNOH_483
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _08A0
	CompareVarToValue 0x8008, 31
	GoToIf 1, _08BE
	CompareVarToValue 0x8008, 32
	GoToIf 1, _08DC
	Return

_08A0:
	MovePerson 6, 31, 40
	ShowPerson 6
	ApplyMovement 6, mv_SD05R0114_0A80
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 3]: no HeartGold mapping yet
	Return

_08BE:
	MovePerson 6, 30, 40
	ShowPerson 6
	ApplyMovement 6, mv_SD05R0114_0A80
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 2]: no HeartGold mapping yet
	Return

_08DC:
	MovePerson 6, 31, 40
	ShowPerson 6
	ApplyMovement 6, mv_SD05R0114_0A80
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 2]: no HeartGold mapping yet
	Return

_08FA:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _092F
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0949
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0963
	Return

_092F:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 2]: no HeartGold mapping yet
	ApplyMovement 4, mv_SD05R0114_0980
	ApplyMovement 2, mv_SD05R0114_0988
	WaitMovement
	Return

_0949:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 3]: no HeartGold mapping yet
	ApplyMovement 4, mv_SD05R0114_0990
	ApplyMovement 2, mv_SD05R0114_0998
	WaitMovement
	Return

_0963:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 3]: no HeartGold mapping yet
	ApplyMovement 4, mv_SD05R0114_09A0
	ApplyMovement 2, mv_SD05R0114_09A8
	WaitMovement
	Return

_09B0:
	GetStarterChoice 0x800C
	SetVar 0x8004, 620
	CompareVarToValue 0x800C, 390
	GoToIf 1, _09E0
	SetVar 0x8004, 619
	CompareVarToValue 0x800C, 387
	GoToIf 1, _09E0
	SetVar 0x8004, 607

_09E0:
	Return

_09E2:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _0A17
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0A25
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0A33
	Return

_0A17:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 3]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 2]: no HeartGold mapping yet
	Return

_0A25:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 2]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 3]: no HeartGold mapping yet
	Return

_0A33:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 2]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [6, 3]: no HeartGold mapping yet
	Return

_0A94:
	LockAll
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 0]: no HeartGold mapping yet
	GetPlayerCoords 0x8004, 0x8005
	// Diamond ScrCmd_LockCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	Call _0C35
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [3, 32780]: no HeartGold mapping yet
	ClearFlag FLAG_SINNOH_190
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [4, 32780]: no HeartGold mapping yet
	Wait 30, 0x800C
	PlayFanfare SEQ_SE_DP_W025
	Wait 90, 0x800C
	SetVar 0x8005, 23
	SetVar 0x8006, 24
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	CloseMsg
	Wait 60, 0x800C
	PlayBGM SEQ_GS_E_LUGIA
	Wait 90, 0x800C
	NPCMsg msg_1131_SD05R0114_00025
	Wait 60, 0x800C
	ClearFlag FLAG_SINNOH_492
	ShowPerson 9
	PlayCry 480, 0
	NPCMsg msg_1131_SD05R0114_00026
	WaitCry
	ClearFlag FLAG_SINNOH_493
	ShowPerson 10
	PlayCry 481, 0
	NPCMsg msg_1131_SD05R0114_00027
	WaitCry
	ClearFlag FLAG_SINNOH_494
	ShowPerson 11
	PlayCry 482, 0
	NPCMsg msg_1131_SD05R0114_00028
	WaitCry
	CloseMsg
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [5, 32780]: no HeartGold mapping yet
	Wait 30, 0x800C
	PlayFanfare SEQ_SE_DP_W060C

_0B47:
	// TODO Diamond ScrCmd_SpearPillarSequence 0x20d args [6, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0B47
	Wait 60, 0x800C
	HidePerson 9
	Wait 30, 0x800C
	HidePerson 11
	Wait 30, 0x800C
	HidePerson 10
	Wait 30, 0x800C
	Call _0CBC
	GetPlayerCoords 0x8004, 0x8005
	MovePerson 10, 0x8004, 31
	ClearFlag FLAG_SINNOH_493
	ShowPerson 10
	PlayCry 481, 0
	WaitCry
	Wait 60, 0x800C
	HidePerson 10
	FadeOutBGM 0, 60
	Wait 30, 0x800C
	ResetBGM
	NPCMsg msg_1131_SD05R0114_00029
	WaitButton
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GALACTIC_BOSS_CYRUS_2, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C29
	ResetBGM
	SetVar 0x8005, 30
	SetVar 0x8006, 31
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 0
	HidePerson 3
	HidePerson 4
	HidePerson 2
	HidePerson 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	SetFlag FLAG_SINNOH_2438
	GoTo _0D44

_0C29:
	SetVar VAR_SINNOH_4098, 1
	WhiteOut
	ReleaseAll
	End

_0C35:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _0C6A
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0C76
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0C82
	Return

_0C6A:
	ApplyMovement 241, mv_SD05R0114_0C90
	WaitMovement
	Return

_0C76:
	ApplyMovement 241, mv_SD05R0114_0CA0
	WaitMovement
	Return

_0C82:
	ApplyMovement 241, mv_SD05R0114_0CAC
	WaitMovement
	Return

_0CBC:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _0CF1
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0CFD
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0D09
	Return

_0CF1:
	ApplyMovement 241, mv_SD05R0114_0D18
	WaitMovement
	Return

_0CFD:
	ApplyMovement 241, mv_SD05R0114_0D28
	WaitMovement
	Return

_0D09:
	ApplyMovement 241, mv_SD05R0114_0D34
	WaitMovement
	Return

_0D44:
	Wait 90, 0x800C
	Call _0DB7
	ClearFlag FLAG_SINNOH_484
	ShowPerson 7
	ClearFlag FLAG_SINNOH_485
	ShowPerson 8
	ApplyMovement 7, mv_SD05R0114_0E44
	ApplyMovement 8, mv_SD05R0114_0E4C
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 1]: no HeartGold mapping yet
	BufferPlayersName 0
	SetVar 0x8005, 36
	SetVar 0x8006, 37
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	BufferPlayersName 0
	BufferRivalsName 1
	Call _0E22
	WaitButton
	CloseMsg
	ApplyMovement obj_player, mv_SD05R0114_0E3C
	WaitMovement
	SetVar VAR_SINNOH_4098, 3
	ReleaseAll
	End

_0DB7:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _0DEC
	CompareVarToValue 0x8008, 31
	GoToIf 1, _0DFE
	CompareVarToValue 0x8008, 32
	GoToIf 1, _0E10
	Return

_0DEC:
	MovePerson 7, 30, 40
	MovePerson 8, 31, 40
	Return

_0DFE:
	MovePerson 7, 30, 40
	MovePerson 8, 32, 40
	Return

_0E10:
	MovePerson 7, 31, 40
	MovePerson 8, 32, 40
	Return

_0E22:
	SetVar 0x8005, 40
	SetVar 0x8006, 39
	Call _0207
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	Return

scr_seq_SD05R0114_008:
	LockAll
	BufferPlayersName 0
	SetVar 0x8005, 38
	SetVar 0x8006, 38
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	CloseMsg
	ApplyMovement obj_player, mv_SD05R0114_0E84
	WaitMovement
	ReleaseAll
	End

scr_seq_SD05R0114_009:
	LockAll
	Call _1014
	WaitMovement
	SetVar 0x8005, 483
	SetVar 0x8006, 484
	Call _01E8
	PlayCry 0x8004, 0
	SetVar 0x8005, 32
	SetVar 0x8006, 33
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	WaitCry
	CloseMsg
	SetVar 0x8005, 483
	SetVar 0x8006, 484
	Call _01E8
	SetFlag FLAG_SINNOH_142
	WildBattle 0x8004, 47
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _100E
	// TODO Diamond ScrCmd_Unk02BC 0x2bc args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0F16
	SetFlag FLAG_SINNOH_351
	GoTo _0F30

_0F16:
	SetVar 0x8005, 34
	SetVar 0x8006, 35
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	CloseMsg

_0F30:
	Call _1088
	ApplyMovement 8, mv_SD05R0114_111C
	ApplyMovement 7, mv_SD05R0114_1114
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [255, 1]: no HeartGold mapping yet
	BufferPlayersName 1
	NPCMsg msg_1131_SD05R0114_00041
	BufferPlayersName 1
	SetVar 0x8005, 43
	SetVar 0x8006, 42
	Call _0207
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	// Diamond ScrCmd_LockCamera dropped: scripted camera moves need a HeartGold port (library cutscene)
	ApplyMovement 7, mv_SD05R0114_1128
	WaitMovement
	ApplyMovement 7, mv_SD05R0114_1130
	ApplyMovement obj_player, mv_SD05R0114_1130
	WaitMovement
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [8, 1]: no HeartGold mapping yet
	NPCMsg msg_1131_SD05R0114_00044
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_MOUNT_CORONET_SPEAR_PILLAR, 0, 31, 52, 1
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	ClearFlag FLAG_SINNOH_509
	ClearFlag FLAG_SINNOH_510
	ClearFlag FLAG_SINNOH_511
	SetFlag FLAG_SINNOH_2433
	SetFlag FLAG_SINNOH_491
	ClearFlag FLAG_SINNOH_688
	SetFlag FLAG_SINNOH_350
	SetFlag FLAG_SINNOH_691
	SetFlag FLAG_SINNOH_685
	SetVar VAR_SINNOH_4098, 4
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_100E:
	WhiteOut
	ReleaseAll
	End

_1014:
	GetPlayerCoords 0x8004, 0x8005
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _1049
	CompareVarToValue 0x8008, 31
	GoToIf 1, _1053
	CompareVarToValue 0x8008, 32
	GoToIf 1, _105D
	Return

_1049:
	ApplyMovement obj_player, mv_SD05R0114_1068
	Return

_1053:
	ApplyMovement obj_player, mv_SD05R0114_1074
	Return

_105D:
	ApplyMovement obj_player, mv_SD05R0114_107C
	Return

_1088:
	GetPlayerCoords 0x8004, 0x8005
	AddVar 0x8005, 8
	CopyVar 0x8008, 0x8004
	CompareVarToValue 0x8008, 30
	GoToIf 1, _10C3
	CompareVarToValue 0x8008, 31
	GoToIf 1, _10DD
	CompareVarToValue 0x8008, 32
	GoToIf 1, _10F7
	Return

_10C3:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	Return

_10DD:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	Return

_10F7:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	Return

scr_seq_SD05R0114_006:
	CompareVarToValue VAR_SINNOH_4098, 3
	GoToIf 5, _1161
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	BufferRivalsName 1
	Call _0E22
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1161:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1194
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1181
	End

_1181:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1131_SD05R0114_00047
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1194:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1131_SD05R0114_00046
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD05R0114_007:
	CompareVarToValue VAR_SINNOH_4098, 3
	GoToIf 5, _11DD
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	SetVar 0x8005, 36
	SetVar 0x8006, 37
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11DD:
	BufferPlayersName 0
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1131_SD05R0114_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD05R0114_013:
	LockAll
	Call _1014
	WaitMovement
	SetVar 0x8005, 483
	SetVar 0x8006, 484
	Call _01E8
	PlayCry 0x8004, 0
	SetVar 0x8005, 32
	SetVar 0x8006, 33
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	WaitCry
	CloseMsg
	SetVar 0x8005, 483
	SetVar 0x8006, 484
	Call _01E8
	SetFlag FLAG_SINNOH_142
	WildBattle 0x8004, 47
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _129F
	SetVar VAR_SINNOH_4098, 4
	// TODO Diamond ScrCmd_Unk02BC 0x2bc args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1281
	SetFlag FLAG_SINNOH_351
	ReleaseAll
	End

_1281:
	SetVar 0x8005, 34
	SetVar 0x8006, 35
	Call _01E8
	// TODO Diamond ScrCmd_Unk002D 0x02d args [32772]: no HeartGold mapping yet
	WaitButton
	CloseMsg
	ReleaseAll
	End

_129F:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SD05R0114_0270:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0278:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0280:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0288:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0290:
	.short 62, 5
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0504:
	.short 63, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0594:
	.short 63, 1
	.short 12, 6
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_SD05R0114_05A4:
	.short 63, 1
	.short 12, 6
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_05B4:
	.short 63, 1
	.short 12, 6
	EndMovement

	.balign 4, 0
mv_SD05R0114_05C0:
	.short 63, 1
	.short 12, 6
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_05D0:
	.short 63, 1
	.short 12, 6
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_SD05R0114_069C:
	.short 63, 1
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_SD05R0114_06A8:
	.short 63, 1
	.short 13, 7
	EndMovement

	.balign 4, 0
mv_SD05R0114_0748:
	.short 63, 1
	.short 13, 6
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_SD05R0114_0758:
	.short 63, 1
	.short 13, 6
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0768:
	.short 63, 1
	.short 13, 6
	EndMovement

	.balign 4, 0
mv_SD05R0114_0774:
	.short 63, 1
	.short 13, 6
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0784:
	.short 63, 1
	.short 13, 6
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_SD05R0114_07D0:
	.short 62, 1
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0980:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0988:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0990:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0998:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_09A0:
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_09A8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_0A80:
	.short 62, 2
	.short 16, 8
	EndMovement

	.balign 4, 0
mv_SD05R0114_0A8C:
	.short 17, 8
	EndMovement

	.balign 4, 0
mv_SD05R0114_0C90:
	.short 62, 1
	.short 19, 1
	.short 16, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0CA0:
	.short 62, 1
	.short 16, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0CAC:
	.short 62, 1
	.short 18, 1
	.short 16, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0D18:
	.short 62, 1
	.short 18, 1
	.short 17, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0D28:
	.short 62, 1
	.short 17, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0D34:
	.short 62, 1
	.short 19, 1
	.short 17, 12
	EndMovement

	.balign 4, 0
mv_SD05R0114_0E3C:
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_SD05R0114_0E44:
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_SD05R0114_0E4C:
	.short 63, 3
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_SD05R0114_0E84:
	.short 16, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_1068:
	.short 15, 1
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_SD05R0114_1074:
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_SD05R0114_107C:
	.short 14, 1
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_SD05R0114_1114:
	.short 12, 6
	EndMovement

	.balign 4, 0
mv_SD05R0114_111C:
	.short 61, 1
	.short 12, 6
	EndMovement

	.balign 4, 0
mv_SD05R0114_1128:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SD05R0114_1130:
	.short 13, 8
	EndMovement

scr_seq_SD05R0114_014:
	SetVar VAR_SPECIAL_x8008, 135
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD05R0114_015:
	SetVar VAR_SPECIAL_x8008, 136
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
