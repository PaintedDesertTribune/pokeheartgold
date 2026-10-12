#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05.h"
#include "msgdata/msg/msg_0977_SC05.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05_000
	ScrDef scr_seq_SC05_001
	ScrDef scr_seq_SC05_002
	ScrDef scr_seq_SC05_003
	ScrDef scr_seq_SC05_004
	ScrDef scr_seq_SC05_005
	ScrDef scr_seq_SC05_006
	ScrDef scr_seq_SC05_007
	ScrDef scr_seq_SC05_008
	ScrDef scr_seq_SC05_009
	ScrDef scr_seq_SC05_010
	ScrDef scr_seq_SC05_011
	ScrDef scr_seq_SC05_012
	ScrDef scr_seq_SC05_013
	ScrDef scr_seq_SC05_014
	ScrDef scr_seq_SC05_015
	ScrDef scr_seq_SC05_016
	ScrDef scr_seq_SC05_017
	ScrDef scr_seq_SC05_018
	ScrDef scr_seq_SC05_019
	ScrDef scr_seq_SC05_020
	ScrDef scr_seq_SC05_021
	ScrDef scr_seq_SC05_022
	ScrDef scr_seq_SC05_023
	ScrDef scr_seq_SC05_024
	ScrDef scr_seq_SC05_025
	ScrDef scr_seq_SC05_026
	ScrDef scr_seq_SC05_027
	ScrDef scr_seq_SC05_028
	ScrDef scr_seq_SC05_029
	ScrDef scr_seq_SC05_030
	ScrDef scr_seq_SC05_031
	ScrDef scr_seq_SC05_032
	ScrDefEnd

scr_seq_SC05_000:
	End

scr_seq_SC05_001:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	MovePerson 23, 0x8004, 726
	ClearFlag FLAG_SINNOH_549
	ShowPerson 23
	Lock 23
	CallStd std_play_rival_intro_music
	ApplyMovement 23, mv_SC05_0150
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0977_SC05_00004
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _00EF
	CompareVarToValue 0x800C, 390
	GoToIf 1, _00FD
	GoTo _00E1

_00E1:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_4, 0, 0, 0
	GoTo _010B

_00EF:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_5, 0, 0, 0
	GoTo _010B

_00FD:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_6, 0, 0, 0
	GoTo _010B

_010B:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0145
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0977_SC05_00005
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 23, mv_SC05_0160
	WaitMovement
	HidePerson 23
	SetVar VAR_SINNOH_407B, 2
	ReleaseAll
	End

_0145:
	SetFlag FLAG_SINNOH_549
	WhiteOut
	ReleaseAll
	End

scr_seq_SC05_032:
	LockAll
	MovePerson 23, 463, 726
	ClearFlag FLAG_SINNOH_549
	CallStd std_play_rival_intro_music
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 724
	CallIf 1, _02B1
	CompareVarToValue 0x8005, 725
	CallIf 1, _02D9
	CompareVarToValue 0x8005, 726
	CallIf 1, _0301
	CompareVarToValue 0x8005, 727
	CallIf 1, _0321
	CompareVarToValue 0x8005, 728
	CallIf 1, _0349
	CompareVarToValue 0x8005, 729
	CallIf 1, _0371
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0977_SC05_00004
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _0211
	CompareVarToValue 0x800C, 390
	GoToIf 1, _021F
	GoTo _0203

_0203:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_4, 0, 0, 0
	GoTo _022D

_0211:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_5, 0, 0, 0
	GoTo _022D

_021F:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_6, 0, 0, 0
	GoTo _022D

_022D:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0145
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0977_SC05_00005
	CloseMsg
	Wait 15, 0x800C
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 724
	CallIf 1, _0399
	CompareVarToValue 0x8005, 725
	CallIf 1, _03AD
	CompareVarToValue 0x8005, 726
	CallIf 1, _03C1
	CompareVarToValue 0x8005, 727
	CallIf 1, _03CD
	CompareVarToValue 0x8005, 728
	CallIf 1, _03E1
	CompareVarToValue 0x8005, 729
	CallIf 1, _03F5
	HidePerson 23
	SetVar VAR_SINNOH_407B, 2
	ReleaseAll
	End

_02B1:
	SetObjectMovementType 23, 14
	SetObjectFacing 23, 0
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_0448
	ApplyMovement obj_player, mv_SC05_040C
	WaitMovement
	Return

_02D9:
	SetObjectMovementType 23, 14
	SetObjectFacing 23, 0
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_045C
	ApplyMovement obj_player, mv_SC05_040C
	WaitMovement
	Return

_0301:
	SetObjectMovementType 23, 16
	SetObjectFacing 23, 2
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_0470
	WaitMovement
	Return

_0321:
	SetObjectMovementType 23, 15
	SetObjectFacing 23, 1
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_0480
	ApplyMovement obj_player, mv_SC05_0418
	WaitMovement
	Return

_0349:
	SetObjectMovementType 23, 15
	SetObjectFacing 23, 1
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_0494
	ApplyMovement obj_player, mv_SC05_0418
	WaitMovement
	Return

_0371:
	SetObjectMovementType 23, 15
	SetObjectFacing 23, 1
	ShowPerson 23
	Lock 23
	ApplyMovement 23, mv_SC05_04A8
	ApplyMovement obj_player, mv_SC05_0418
	WaitMovement
	Return

_0399:
	ApplyMovement 23, mv_SC05_04BC
	ApplyMovement obj_player, mv_SC05_0424
	WaitMovement
	Return

_03AD:
	ApplyMovement 23, mv_SC05_04C4
	ApplyMovement obj_player, mv_SC05_0424
	WaitMovement
	Return

_03C1:
	ApplyMovement 23, mv_SC05_04CC
	WaitMovement
	Return

_03CD:
	ApplyMovement 23, mv_SC05_04D4
	ApplyMovement obj_player, mv_SC05_0430
	WaitMovement
	Return

_03E1:
	ApplyMovement 23, mv_SC05_04DC
	ApplyMovement obj_player, mv_SC05_0430
	WaitMovement
	Return

_03F5:
	ApplyMovement 23, mv_SC05_04E4
	ApplyMovement obj_player, mv_SC05_0430
	WaitMovement
	Return

scr_seq_SC05_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_251
	GoToIf 1, _0578
	NPCMsg msg_0977_SC05_00026
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _054C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0583
	End

_054C:
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _058E
	PlaySE 1158
	NPCMsg msg_0977_SC05_00027
	WaitSE 1158
	// TODO Diamond ScrCmd_GiveEgg 0x097 args [440, 9]: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_251
	GoTo _0578

_0578:
	NPCMsg msg_0977_SC05_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0583:
	NPCMsg msg_0977_SC05_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_058E:
	NPCMsg msg_0977_SC05_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_005:
	LockAll
	ApplyMovement 19, mv_SC05_05EC
	WaitMovement
	NPCMsg msg_0977_SC05_00008
	CloseMsg
	ApplyMovement 19, mv_SC05_05FC
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_0977_SC05_00009
	CloseMsg
	ApplyMovement 19, mv_SC05_0604
	WaitMovement
	NPCMsg msg_0977_SC05_00010
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 19, mv_SC05_060C
	WaitMovement
	HidePerson 19
	SetVar VAR_SINNOH_40D1, 2
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC05_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_0977_SC05_00025
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _06FE
	NPCMsg msg_0977_SC05_00017
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0709
	NPCMsg msg_0977_SC05_00018
	CloseMsg
	Wait 15, 0x800C
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 0
	GoToIf 1, _0714
	CompareVarToValue 0x8004, 1
	GoToIf 1, _072E
	CompareVarToValue 0x8004, 2
	GoToIf 1, _0748
	CompareVarToValue 0x8004, 3
	GoToIf 1, _0762
	End

_06FE:
	NPCMsg msg_0977_SC05_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0709:
	NPCMsg msg_0977_SC05_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0714:
	ApplyMovement 0, mv_SC05_0798
	ApplyMovement obj_player, mv_SC05_07D4
	WaitMovement
	GoTo _077C

_072E:
	ApplyMovement 0, mv_SC05_0798
	ApplyMovement obj_player, mv_SC05_07EC
	WaitMovement
	GoTo _077C

_0748:
	ApplyMovement 0, mv_SC05_0798
	ApplyMovement obj_player, mv_SC05_0804
	WaitMovement
	GoTo _077C

_0762:
	ApplyMovement 0, mv_SC05_07B0
	ApplyMovement obj_player, mv_SC05_081C
	WaitMovement
	GoTo _077C

_077C:
	SetFlag FLAG_SINNOH_1
	NPCMsg msg_0977_SC05_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_014:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_015:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0977_SC05_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_016:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00031
	NPCMsg msg_0977_SC05_00032
	CheckFlag FLAG_SINNOH_330
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_331
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_332
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_333
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_334
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_335
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_336
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_337
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_338
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_339
	GoToIf 0, _0904
	CheckFlag FLAG_SINNOH_340
	GoToIf 0, _0904
	SetFlag FLAG_SINNOH_347
	GoTo _0C40

_0904:
	CheckFlag FLAG_SINNOH_330
	GoToIf 1, _094C
	CheckFlag FLAG_SINNOH_2444
	GoToIf 0, _094C
	NPCMsg msg_0977_SC05_00040
	SetVar 0x8004, 46
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_330
	CloseMsg
	ReleaseAll
	End

_094C:
	CheckFlag FLAG_SINNOH_331
	GoToIf 1, _099A
	CountBadges 0x800C
	CompareVarToValue 0x800C, 8
	GoToIf 0, _099A
	NPCMsg msg_0977_SC05_00041
	SetVar 0x8004, 47
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_331
	CloseMsg
	ReleaseAll
	End

_099A:
	CheckFlag FLAG_SINNOH_332
	GoToIf 1, _09E2
	CheckFlag FLAG_SINNOH_2410
	GoToIf 0, _09E2
	NPCMsg msg_0977_SC05_00042
	SetVar 0x8004, 72
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_332
	CloseMsg
	ReleaseAll
	End

_09E2:
	CheckFlag FLAG_SINNOH_333
	GoToIf 1, _0A2A
	CheckFlag FLAG_SINNOH_2408
	GoToIf 0, _0A2A
	NPCMsg msg_0977_SC05_00043
	SetVar 0x8004, 73
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_333
	CloseMsg
	ReleaseAll
	End

_0A2A:
	CheckFlag FLAG_SINNOH_334
	GoToIf 1, _0A72
	CheckFlag FLAG_SINNOH_2409
	GoToIf 0, _0A72
	NPCMsg msg_0977_SC05_00044
	SetVar 0x8004, 74
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_334
	CloseMsg
	ReleaseAll
	End

_0A72:
	CheckFlag FLAG_SINNOH_335
	GoToIf 1, _0ABA
	CheckFlag FLAG_SINNOH_2412
	GoToIf 0, _0ABA
	NPCMsg msg_0977_SC05_00045
	SetVar 0x8004, 75
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_335
	CloseMsg
	ReleaseAll
	End

_0ABA:
	CheckFlag FLAG_SINNOH_336
	GoToIf 1, _0B02
	CheckFlag FLAG_SINNOH_2411
	GoToIf 0, _0B02
	NPCMsg msg_0977_SC05_00046
	SetVar 0x8004, 76
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_336
	CloseMsg
	ReleaseAll
	End

_0B02:
	CheckFlag FLAG_SINNOH_337
	GoToIf 1, _0B50
	// TODO Diamond ScrCmd_Unk0293 0x293 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 100
	GoToIf 0, _0B50
	NPCMsg msg_0977_SC05_00047
	SetVar 0x8004, 77
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_337
	CloseMsg
	ReleaseAll
	End

_0B50:
	CheckFlag FLAG_SINNOH_338
	GoToIf 1, _0B9E
	// TODO Diamond ScrCmd_Unk0286 0x286 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 100
	GoToIf 0, _0B9E
	NPCMsg msg_0977_SC05_00048
	SetVar 0x8004, 78
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_338
	CloseMsg
	ReleaseAll
	End

_0B9E:
	CheckFlag FLAG_SINNOH_339
	GoToIf 1, _0BEC
	// TODO Diamond ScrCmd_Unk0287 0x287 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 100
	GoToIf 0, _0BEC
	NPCMsg msg_0977_SC05_00049
	SetVar 0x8004, 79
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_339
	CloseMsg
	ReleaseAll
	End

_0BEC:
	CheckFlag FLAG_SINNOH_340
	GoToIf 1, _0C3A
	// TODO Diamond ScrCmd_Unk0288 0x288 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 100
	GoToIf 0, _0C3A
	NPCMsg msg_0977_SC05_00050
	SetVar 0x8004, 80
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C4B
	CallStd 2012 /* TODO Diamond std script */
	SetFlag FLAG_SINNOH_340
	CloseMsg
	ReleaseAll
	End

_0C3A:
	GoTo _0C56

_0C40:
	NPCMsg msg_0977_SC05_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C4B:
	NPCMsg msg_0977_SC05_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C56:
	NPCMsg msg_0977_SC05_00039
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_017:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00054
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_018:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0977_SC05_00055
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_019:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00056
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_020:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00057
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05_021:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0977_SC05_00003
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0CDA
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _0CFA
	GoTo _0CEA

_0CDA:
	ApplyMovement 35, mv_SC05_0D14
	WaitMovement
	GoTo _0D0A

_0CEA:
	ApplyMovement 35, mv_SC05_0D20
	WaitMovement
	GoTo _0D0A

_0CFA:
	ApplyMovement 35, mv_SC05_0D28
	WaitMovement
	GoTo _0D0A

_0D0A:
	HidePerson 35
	ReleaseAll
	End

scr_seq_SC05_022:
	LockAll
	ApplyMovement obj_player, mv_SC05_0E60
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 725
	GoToIf 1, _0D8D
	CompareVarToValue 0x8005, 726
	GoToIf 1, _0DA5
	CompareVarToValue 0x8005, 727
	GoToIf 1, _0DBD
	CompareVarToValue 0x8005, 728
	GoToIf 1, _0DD5
	CompareVarToValue 0x8005, 729
	GoToIf 1, _0DED
	End

_0D8D:
	MovePerson 34, 471, 725
	MovePerson 33, 471, 725
	GoTo _0E05

_0DA5:
	MovePerson 34, 471, 726
	MovePerson 33, 471, 726
	GoTo _0E05

_0DBD:
	MovePerson 34, 471, 727
	MovePerson 33, 471, 727
	GoTo _0E05

_0DD5:
	MovePerson 34, 471, 728
	MovePerson 33, 471, 728
	GoTo _0E05

_0DED:
	MovePerson 34, 471, 729
	MovePerson 33, 471, 729
	GoTo _0E05

_0E05:
	ClearFlag FLAG_SINNOH_602
	ClearFlag FLAG_SINNOH_603
	ShowPerson 34
	ShowPerson 33
	ApplyMovement 33, mv_SC05_0E68
	WaitMovement
	PlayCry 427, 0
	WaitCry
	ApplyMovement 34, mv_SC05_0E78
	WaitMovement
	NPCMsg msg_0977_SC05_00000
	NPCMsg msg_0977_SC05_00001
	PlayCry 427, 0
	WaitCry
	HidePerson 33
	NPCMsg msg_0977_SC05_00002
	CloseMsg
	ApplyMovement 34, mv_SC05_0E80
	WaitMovement
	HidePerson 34
	SetVar VAR_SINNOH_40F6, 1
	ReleaseAll
	End

scr_seq_SC05_023:
	DirectionSignpost msg_0977_SC05_00058, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_024:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0977_SC05_00059, 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_025:
	DirectionSignpost msg_0977_SC05_00060, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_026:
	DirectionSignpost msg_0977_SC05_00061, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_027:
	DirectionSignpost msg_0977_SC05_00062, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_028:
	DirectionSignpost msg_0977_SC05_00063, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_029:
	DirectionSignpost msg_0977_SC05_00064, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_030:
	DirectionSignpost msg_0977_SC05_00065, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC05_031:
	DirectionSignpost msg_0977_SC05_00066, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SC05_0150:
	.short 16, 4
	.short 75, 1
	.short 16, 3
	EndMovement

	.balign 4, 0
mv_SC05_0160:
	.short 17, 7
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SC05_040C:
	.short 62, 15
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC05_0418:
	.short 62, 15
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC05_0424:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC05_0430:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC05_0448:
	.short 18, 4
	.short 75, 1
	.short 18, 4
	.short 16, 1
	EndMovement

	.balign 4, 0
mv_SC05_045C:
	.short 18, 4
	.short 75, 1
	.short 18, 4
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SC05_0470:
	.short 18, 4
	.short 75, 1
	.short 18, 3
	EndMovement

	.balign 4, 0
mv_SC05_0480:
	.short 18, 4
	.short 75, 1
	.short 18, 4
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SC05_0494:
	.short 18, 4
	.short 75, 1
	.short 18, 4
	.short 17, 1
	EndMovement

	.balign 4, 0
mv_SC05_04A8:
	.short 18, 4
	.short 75, 1
	.short 18, 4
	.short 17, 2
	EndMovement

	.balign 4, 0
mv_SC05_04BC:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_04C4:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_04CC:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_04D4:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_04DC:
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_04E4:
	.short 16, 1
	.short 19, 9
	EndMovement

	.balign 4, 0
mv_SC05_05EC:
	.short 75, 1
	.short 15, 5
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC05_05FC:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC05_0604:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC05_060C:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC05_0798:
	.short 14, 20
	.short 12, 13
	.short 15, 12
	.short 12, 4
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC05_07B0:
	.short 12, 1
	.short 14, 2
	.short 13, 1
	.short 14, 18
	.short 12, 13
	.short 15, 12
	.short 12, 4
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC05_07D4:
	.short 12, 1
	.short 14, 20
	.short 12, 13
	.short 15, 12
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_SC05_07EC:
	.short 13, 1
	.short 14, 20
	.short 12, 13
	.short 15, 12
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_SC05_0804:
	.short 14, 1
	.short 14, 20
	.short 12, 13
	.short 15, 12
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_SC05_081C:
	.short 63, 2
	.short 62, 1
	.short 34, 1
	.short 14, 19
	.short 12, 13
	.short 15, 12
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_SC05_0D14:
	.short 14, 1
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC05_0D20:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC05_0D28:
	.short 13, 2
	.short 14, 1
	.short 13, 7
	EndMovement

	.balign 4, 0
mv_SC05_0E60:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC05_0E68:
	.short 18, 9
	EndMovement

	.balign 4, 0
mv_SC05_0E78:
	.short 18, 8
	EndMovement

	.balign 4, 0
mv_SC05_0E80:
	.short 15, 8
	EndMovement


	.balign 4, 0
