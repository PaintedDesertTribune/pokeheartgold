#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R213R0201.h"
#include "msgdata/msg/msg_1089_R213R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R213R0201_000
	ScrDef scr_seq_R213R0201_001
	ScrDefEnd

scr_seq_R213R0201_000:
	SetFlag FLAG_SINNOH_2541
	End

scr_seq_R213R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x8002
	// TODO Diamond ScrCmd_GetPokemonName 0x0d0 args [0, 32770]: no HeartGold mapping yet
	BufferPlayersName 1
	BufferPartyMonNick 2, 0x8002
	// TODO Diamond ScrCmd_GetPokemonFootprint 0x23a args [32768, 32769, 32770]: no HeartGold mapping yet
	CheckFlag FLAG_SINNOH_249
	GoToIf 1, _004B
	SetFlag FLAG_SINNOH_249
	NPCMsg msg_1089_R213R0201_00000
	CloseMsg
	GoTo _0056

_004B:
	NPCMsg msg_1089_R213R0201_00001
	CloseMsg
	GoTo _0056

_0056:
	FadeScreen 6, 1, 0, 0
	WaitFade
	Wait 40, 0x800C
	FadeScreen 6, 1, 1, 0
	WaitFade
	Call _0086
	Wait 20, 0x800C
	GoTo _014C

_0086:
	GetPlayerCoords 0x8005, 0x8006
	CompareVarToValue 0x8005, 4
	GoToIf 1, _00B9
	CompareVarToValue 0x8005, 6
	GoToIf 1, _00C5
	CompareVarToValue 0x8006, 5
	GoToIf 1, _00D1
	GoTo _00DD

_00B9:
	ApplyMovement 0, mv_R213R0201_0694
	WaitMovement
	Return

_00C5:
	ApplyMovement 0, mv_R213R0201_06A4
	WaitMovement
	Return

_00D1:
	ApplyMovement 0, mv_R213R0201_06B4
	WaitMovement
	Return

_00DD:
	ApplyMovement 0, mv_R213R0201_06C4
	WaitMovement
	Return

_00E9:
	GetPlayerCoords 0x8005, 0x8006
	CompareVarToValue 0x8005, 4
	GoToIf 1, _011C
	CompareVarToValue 0x8005, 6
	GoToIf 1, _0128
	CompareVarToValue 0x8006, 5
	GoToIf 1, _0134
	GoTo _0140

_011C:
	ApplyMovement 0, mv_R213R0201_06D4
	WaitMovement
	Return

_0128:
	ApplyMovement 0, mv_R213R0201_06DC
	WaitMovement
	Return

_0134:
	ApplyMovement 0, mv_R213R0201_06E4
	WaitMovement
	Return

_0140:
	ApplyMovement 0, mv_R213R0201_06EC
	WaitMovement
	Return

_014C:
	CompareVarToValue 0x8001, 1
	GoToIf 1, _0186
	CompareVarToValue 0x8001, 2
	GoToIf 1, _0199
	CompareVarToValue 0x8001, 3
	GoToIf 1, _01AC
	CompareVarToValue 0x8001, 4
	GoToIf 1, _01BF
	GoTo _0570

_0186:
	CompareVarToValue 0x8000, 1
	GoToIf 1, _01D2
	GoTo _0212

_0199:
	CompareVarToValue 0x8000, 1
	GoToIf 1, _0252
	GoTo _0292

_01AC:
	CompareVarToValue 0x8000, 1
	GoToIf 1, _02D2
	GoTo _0312

_01BF:
	CompareVarToValue 0x8000, 1
	GoToIf 1, _0352
	GoTo _0392

_01D2:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _03F6
	CompareVarToValue 0x800C, 200
	GoToIf 4, _03ED
	CompareVarToValue 0x800C, 150
	GoToIf 4, _03E4
	CompareVarToValue 0x800C, 70
	GoToIf 4, _03DB
	GoTo _03D2

_0212:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _0423
	CompareVarToValue 0x800C, 200
	GoToIf 4, _041A
	CompareVarToValue 0x800C, 150
	GoToIf 4, _0411
	CompareVarToValue 0x800C, 70
	GoToIf 4, _0408
	GoTo _03FF

_0252:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _0450
	CompareVarToValue 0x800C, 200
	GoToIf 4, _0447
	CompareVarToValue 0x800C, 150
	GoToIf 4, _043E
	CompareVarToValue 0x800C, 70
	GoToIf 4, _0435
	GoTo _042C

_0292:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _047D
	CompareVarToValue 0x800C, 200
	GoToIf 4, _0474
	CompareVarToValue 0x800C, 150
	GoToIf 4, _046B
	CompareVarToValue 0x800C, 70
	GoToIf 4, _0462
	GoTo _0459

_02D2:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _04AA
	CompareVarToValue 0x800C, 200
	GoToIf 4, _04A1
	CompareVarToValue 0x800C, 150
	GoToIf 4, _0498
	CompareVarToValue 0x800C, 70
	GoToIf 4, _048F
	GoTo _0486

_0312:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _04D7
	CompareVarToValue 0x800C, 200
	GoToIf 4, _04CE
	CompareVarToValue 0x800C, 150
	GoToIf 4, _04C5
	CompareVarToValue 0x800C, 70
	GoToIf 4, _04BC
	GoTo _04B3

_0352:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _0504
	CompareVarToValue 0x800C, 200
	GoToIf 4, _04FB
	CompareVarToValue 0x800C, 150
	GoToIf 4, _04F2
	CompareVarToValue 0x800C, 70
	GoToIf 4, _04E9
	GoTo _04E0

_0392:
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 4, _0531
	CompareVarToValue 0x800C, 200
	GoToIf 4, _0528
	CompareVarToValue 0x800C, 150
	GoToIf 4, _051F
	CompareVarToValue 0x800C, 70
	GoToIf 4, _0516
	GoTo _050D

_03D2:
	NPCMsg msg_1089_R213R0201_00010
	GoTo _05A1

_03DB:
	NPCMsg msg_1089_R213R0201_00011
	GoTo _05A1

_03E4:
	NPCMsg msg_1089_R213R0201_00012
	GoTo _05A1

_03ED:
	NPCMsg msg_1089_R213R0201_00013
	GoTo _05A1

_03F6:
	NPCMsg msg_1089_R213R0201_00014
	GoTo _053A

_03FF:
	NPCMsg msg_1089_R213R0201_00015
	GoTo _05C0

_0408:
	NPCMsg msg_1089_R213R0201_00016
	GoTo _05C0

_0411:
	NPCMsg msg_1089_R213R0201_00017
	GoTo _05C0

_041A:
	NPCMsg msg_1089_R213R0201_00018
	GoTo _05C0

_0423:
	NPCMsg msg_1089_R213R0201_00019
	GoTo _0555

_042C:
	NPCMsg msg_1089_R213R0201_00020
	GoTo _05A1

_0435:
	NPCMsg msg_1089_R213R0201_00021
	GoTo _05A1

_043E:
	NPCMsg msg_1089_R213R0201_00022
	GoTo _05A1

_0447:
	NPCMsg msg_1089_R213R0201_00023
	GoTo _05A1

_0450:
	NPCMsg msg_1089_R213R0201_00024
	GoTo _053A

_0459:
	NPCMsg msg_1089_R213R0201_00025
	GoTo _05C0

_0462:
	NPCMsg msg_1089_R213R0201_00026
	GoTo _05C0

_046B:
	NPCMsg msg_1089_R213R0201_00027
	GoTo _05C0

_0474:
	NPCMsg msg_1089_R213R0201_00028
	GoTo _05C0

_047D:
	NPCMsg msg_1089_R213R0201_00029
	GoTo _0555

_0486:
	NPCMsg msg_1089_R213R0201_00030
	GoTo _05A1

_048F:
	NPCMsg msg_1089_R213R0201_00031
	GoTo _05A1

_0498:
	NPCMsg msg_1089_R213R0201_00032
	GoTo _05A1

_04A1:
	NPCMsg msg_1089_R213R0201_00033
	GoTo _05A1

_04AA:
	NPCMsg msg_1089_R213R0201_00034
	GoTo _053A

_04B3:
	NPCMsg msg_1089_R213R0201_00035
	GoTo _05C0

_04BC:
	NPCMsg msg_1089_R213R0201_00036
	GoTo _05C0

_04C5:
	NPCMsg msg_1089_R213R0201_00037
	GoTo _05C0

_04CE:
	NPCMsg msg_1089_R213R0201_00038
	GoTo _05C0

_04D7:
	NPCMsg msg_1089_R213R0201_00039
	GoTo _0555

_04E0:
	NPCMsg msg_1089_R213R0201_00040
	GoTo _05A1

_04E9:
	NPCMsg msg_1089_R213R0201_00041
	GoTo _05A1

_04F2:
	NPCMsg msg_1089_R213R0201_00042
	GoTo _05A1

_04FB:
	NPCMsg msg_1089_R213R0201_00043
	GoTo _05A1

_0504:
	NPCMsg msg_1089_R213R0201_00044
	GoTo _053A

_050D:
	NPCMsg msg_1089_R213R0201_00045
	GoTo _05C0

_0516:
	NPCMsg msg_1089_R213R0201_00046
	GoTo _05C0

_051F:
	NPCMsg msg_1089_R213R0201_00047
	GoTo _05C0

_0528:
	NPCMsg msg_1089_R213R0201_00048
	GoTo _05C0

_0531:
	NPCMsg msg_1089_R213R0201_00049
	GoTo _0555

_053A:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 69]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _05FE
	GoTo _05A1

_0555:
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 69]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _062F
	GoTo _05C0

_0570:
	NPCMsg msg_1089_R213R0201_00050
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32770]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 255
	GoToIf 0, _05DF
	// TODO Diamond ScrCmd_PartyMonHasRibbon 0x230 args [32780, 32770, 69]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0660
	GoTo _05DF

_05A1:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05C0:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05DF:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05FE:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00005
	PlaySE 1155
	NPCMsg msg_1089_R213R0201_00008
	WaitSE 1155
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 69]: no HeartGold mapping yet
	NPCMsg msg_1089_R213R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_062F:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00006
	PlaySE 1155
	NPCMsg msg_1089_R213R0201_00008
	WaitSE 1155
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 69]: no HeartGold mapping yet
	NPCMsg msg_1089_R213R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0660:
	CloseMsg
	Wait 20, 0x800C
	Call _00E9
	Wait 10, 0x800C
	NPCMsg msg_1089_R213R0201_00007
	PlaySE 1155
	NPCMsg msg_1089_R213R0201_00008
	WaitSE 1155
	// TODO Diamond ScrCmd_GivePartyMonRibbon 0x231 args [32770, 69]: no HeartGold mapping yet
	NPCMsg msg_1089_R213R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_R213R0201_0694:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06A4:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06B4:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06C4:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06D4:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06DC:
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06E4:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_R213R0201_06EC:
	.short 13, 1
	EndMovement

	.balign 4, 0
