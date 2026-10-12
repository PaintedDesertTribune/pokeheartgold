#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL02R0101.h"
#include "msgdata/msg/msg_1085_SL02R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL02R0101_000
	ScrDef scr_seq_SL02R0101_001
	ScrDef scr_seq_SL02R0101_002
	ScrDef scr_seq_SL02R0101_003
	ScrDef scr_seq_SL02R0101_004
	ScrDef scr_seq_SL02R0101_005
	ScrDef scr_seq_SL02R0101_006
	ScrDef scr_seq_SL02R0101_007
	ScrDef scr_seq_SL02R0101_008
	ScrDef scr_seq_SL02R0101_009
	ScrDef scr_seq_SL02R0101_010
	ScrDef scr_seq_SL02R0101_011
	ScrDef scr_seq_SL02R0101_012
	ScrDef scr_seq_SL02R0101_013
	ScrDef scr_seq_SL02R0101_014
	ScrDef scr_seq_SL02R0101_015
	ScrDef scr_seq_SL02R0101_016
	ScrDef scr_seq_SL02R0101_017
	ScrDef scr_seq_SL02R0101_018
	ScrDef scr_seq_SL02R0101_019
	ScrDef scr_seq_SL02R0101_020
	ScrDefEnd

scr_seq_SL02R0101_001:
	SetFlag FLAG_SINNOH_2542
	SetVar 0x4000, 12   // Diamond ScrCmd_GetHour: result fixed
	CompareVarToValue 0x4000, 9
	GoToIf 0, _0087
	CompareVarToValue 0x4000, 23
	GoToIf 4, _0087
	CheckFlag FLAG_SINNOH_2731
	GoToIf 0, _00B3
	End

_0087:
	SetFlag FLAG_SINNOH_610
	SetFlag FLAG_SINNOH_611
	SetFlag FLAG_SINNOH_612
	SetFlag FLAG_SINNOH_613
	SetFlag FLAG_SINNOH_614
	SetFlag FLAG_SINNOH_615
	SetFlag FLAG_SINNOH_616
	SetFlag FLAG_SINNOH_617
	SetFlag FLAG_SINNOH_618
	SetVar VAR_SINNOH_4104, 1
	End

_00B3:
	SetFlag FLAG_SINNOH_610
	SetFlag FLAG_SINNOH_611
	SetFlag FLAG_SINNOH_612
	SetFlag FLAG_SINNOH_613
	SetFlag FLAG_SINNOH_614
	SetFlag FLAG_SINNOH_615
	SetFlag FLAG_SINNOH_616
	SetFlag FLAG_SINNOH_617
	SetFlag FLAG_SINNOH_618
	ClearTrainerFlag TRAINER_SINNOH_ARTIST_ISMAEL
	ClearTrainerFlag TRAINER_SINNOH_BEAUTY_HARLEY
	ClearTrainerFlag TRAINER_SINNOH_RICH_BOY_ROMAN
	ClearTrainerFlag TRAINER_SINNOH_LADY_KYLIE
	ClearTrainerFlag TRAINER_SINNOH_GENTLEMAN_LEONARDO
	ClearTrainerFlag TRAINER_SINNOH_SOCIALITE_REBECCA
	ClearTrainerFlag TRAINER_SINNOH_COLLECTOR_EUGENE
	ClearTrainerFlag TRAINER_SINNOH_AROMA_LADY_ALISON
	ClearTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN
	ClearTrainerFlag TRAINER_SINNOH_POKEFAN_F_MEREDITH
	ClearTrainerFlag TRAINER_SINNOH_VETERAN_EMANUEL
	ClearTrainerFlag TRAINER_SINNOH_LASS_BLYTHE
	ClearTrainerFlag TRAINER_SINNOH_CAMERAMAN_DARRYL
	ClearTrainerFlag TRAINER_SINNOH_REPORTER_VALERIE
	ClearTrainerFlag TRAINER_SINNOH_PI_KENDRICK
	ClearTrainerFlag TRAINER_SINNOH_BEAUTY_GABRIELLA
	ClearTrainerFlag TRAINER_SINNOH_SCIENTIST_EMILIO
	ClearTrainerFlag TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE
	SetVar VAR_SINNOH_4104, 0
	Random 0x4001, 1
	SetVar 0x4000, 5
	SetVar 0x400A, 10000

_0137:
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16385, 9]: no HeartGold mapping yet
	CompareVarToValue 0x4001, 0
	CallIf 1, _01D8
	CompareVarToValue 0x4001, 1
	CallIf 1, _01F5
	CompareVarToValue 0x4001, 2
	CallIf 1, _0212
	CompareVarToValue 0x4001, 3
	CallIf 1, _022F
	CompareVarToValue 0x4001, 4
	CallIf 1, _024C
	CompareVarToValue 0x4001, 5
	CallIf 1, _0269
	CompareVarToValue 0x4001, 6
	CallIf 1, _0286
	CompareVarToValue 0x4001, 7
	CallIf 1, _02A3
	CompareVarToValue 0x4001, 8
	CallIf 1, _02C0
	SubVar 0x400A, 1
	CompareVarToValue 0x400A, 0
	GoToIf 1, _01D2
	CompareVarToValue 0x4000, 0
	GoToIf 5, _0137

_01D2:
	SetFlag FLAG_SINNOH_2731
	End

_01D8:
	CheckFlag FLAG_SINNOH_610
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_610
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16635, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_01F5:
	CheckFlag FLAG_SINNOH_611
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_611
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16636, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_0212:
	CheckFlag FLAG_SINNOH_612
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_612
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16637, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_022F:
	CheckFlag FLAG_SINNOH_613
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_613
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16638, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_024C:
	CheckFlag FLAG_SINNOH_614
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_614
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16639, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_0269:
	CheckFlag FLAG_SINNOH_615
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_615
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16640, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_0286:
	CheckFlag FLAG_SINNOH_616
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_616
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16641, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_02A3:
	CheckFlag FLAG_SINNOH_617
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_617
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16642, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_02C0:
	CheckFlag FLAG_SINNOH_618
	GoToIf 0, _02DD
	ClearFlag FLAG_SINNOH_618
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [16643, 3]: no HeartGold mapping yet
	SubVar 0x4000, 1
	Return

_02DD:
	Return

scr_seq_SL02R0101_002:
	LockAll
	ApplyMovement obj_player, mv_SL02R0101_212C
	WaitMovement
	Wait 20, 0x800C
	NPCMsg msg_1085_SL02R0101_00001
	CloseMsg
	ReleaseAll
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_VALOR_LAKEFRONT, 0, 706, 791, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SL02R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL02R0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_ARTIST_ISMAEL
	CheckTrainerFlag TRAINER_SINNOH_ARTIST_ISMAEL
	GoToIf 1, _046C
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04BC
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _038A
	CompareVarToValue 0x8008, 1
	GoToIf 1, _03A9
	CompareVarToValue 0x8008, 2
	GoToIf 1, _03C8
	ReleaseAll
	End

_038A:
	NPCMsg msg_1085_SL02R0101_00004
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03E7
	GoTo _0460

_03A9:
	NPCMsg msg_1085_SL02R0101_00012
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00013
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03E7
	GoTo _0460

_03C8:
	NPCMsg msg_1085_SL02R0101_00020
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00021
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03E7
	GoTo _0460

_03E7:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_ARTIST_ISMAEL, TRAINER_SINNOH_BEAUTY_HARLEY, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_ARTIST_ISMAEL
	SetTrainerFlag TRAINER_SINNOH_BEAUTY_HARLEY
	Call _04CF
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _043F
	CompareVarToValue 0x8008, 1
	GoToIf 1, _044A
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0455
	ReleaseAll
	End

_043F:
	NPCMsg msg_1085_SL02R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_044A:
	NPCMsg msg_1085_SL02R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0455:
	NPCMsg msg_1085_SL02R0101_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0460:
	CloseMsg
	Call _04CF
	ReleaseAll
	End

_046C:
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _049B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04A6
	CompareVarToValue 0x8008, 2
	GoToIf 1, _04B1
	End

_049B:
	NPCMsg msg_1085_SL02R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04A6:
	NPCMsg msg_1085_SL02R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04B1:
	NPCMsg msg_1085_SL02R0101_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04BC:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00002
	WaitButton
	CloseMsg
	Call _04CF
	ReleaseAll
	End

_04CF:
	ApplyMovement 6, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_BEAUTY_HARLEY
	CheckTrainerFlag TRAINER_SINNOH_BEAUTY_HARLEY
	GoToIf 1, _0616
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0666
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0534
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0553
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0572
	ReleaseAll
	End

_0534:
	NPCMsg msg_1085_SL02R0101_00008
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0591
	GoTo _060A

_0553:
	NPCMsg msg_1085_SL02R0101_00016
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00017
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0591
	GoTo _060A

_0572:
	NPCMsg msg_1085_SL02R0101_00024
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00025
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0591
	GoTo _060A

_0591:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_ARTIST_ISMAEL, TRAINER_SINNOH_BEAUTY_HARLEY, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_ARTIST_ISMAEL
	SetTrainerFlag TRAINER_SINNOH_BEAUTY_HARLEY
	Call _0679
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _05E9
	CompareVarToValue 0x8008, 1
	GoToIf 1, _05F4
	CompareVarToValue 0x8008, 2
	GoToIf 1, _05FF
	ReleaseAll
	End

_05E9:
	NPCMsg msg_1085_SL02R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05F4:
	NPCMsg msg_1085_SL02R0101_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05FF:
	NPCMsg msg_1085_SL02R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_060A:
	CloseMsg
	Call _0679
	ReleaseAll
	End

_0616:
	CopyVar 0x8008, VAR_SINNOH_40FB
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0645
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0650
	CompareVarToValue 0x8008, 2
	GoToIf 1, _065B
	End

_0645:
	NPCMsg msg_1085_SL02R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0650:
	NPCMsg msg_1085_SL02R0101_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_065B:
	NPCMsg msg_1085_SL02R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0666:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00003
	WaitButton
	CloseMsg
	Call _0679
	ReleaseAll
	End

_0679:
	ApplyMovement 9, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_RICH_BOY_ROMAN
	CheckTrainerFlag TRAINER_SINNOH_RICH_BOY_ROMAN
	GoToIf 1, _07C0
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0810
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _06DE
	CompareVarToValue 0x8008, 1
	GoToIf 1, _06FD
	CompareVarToValue 0x8008, 2
	GoToIf 1, _071C
	ReleaseAll
	End

_06DE:
	NPCMsg msg_1085_SL02R0101_00030
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00031
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _073B
	GoTo _07B4

_06FD:
	NPCMsg msg_1085_SL02R0101_00038
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00039
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _073B
	GoTo _07B4

_071C:
	NPCMsg msg_1085_SL02R0101_00046
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00047
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _073B
	GoTo _07B4

_073B:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_RICH_BOY_ROMAN, TRAINER_SINNOH_LADY_KYLIE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_RICH_BOY_ROMAN
	SetTrainerFlag TRAINER_SINNOH_LADY_KYLIE
	Call _0823
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0793
	CompareVarToValue 0x8008, 1
	GoToIf 1, _079E
	CompareVarToValue 0x8008, 2
	GoToIf 1, _07A9
	ReleaseAll
	End

_0793:
	NPCMsg msg_1085_SL02R0101_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_079E:
	NPCMsg msg_1085_SL02R0101_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07A9:
	NPCMsg msg_1085_SL02R0101_00049
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07B4:
	CloseMsg
	Call _0823
	ReleaseAll
	End

_07C0:
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _07EF
	CompareVarToValue 0x8008, 1
	GoToIf 1, _07FA
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0805
	End

_07EF:
	NPCMsg msg_1085_SL02R0101_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_07FA:
	NPCMsg msg_1085_SL02R0101_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0805:
	NPCMsg msg_1085_SL02R0101_00049
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0810:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00028
	WaitButton
	CloseMsg
	Call _0823
	ReleaseAll
	End

_0823:
	ApplyMovement 2, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_LADY_KYLIE
	CheckTrainerFlag TRAINER_SINNOH_LADY_KYLIE
	GoToIf 1, _096A
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _09BA
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0888
	CompareVarToValue 0x8008, 1
	GoToIf 1, _08A7
	CompareVarToValue 0x8008, 2
	GoToIf 1, _08C6
	ReleaseAll
	End

_0888:
	NPCMsg msg_1085_SL02R0101_00034
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00035
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08E5
	GoTo _095E

_08A7:
	NPCMsg msg_1085_SL02R0101_00042
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00043
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08E5
	GoTo _095E

_08C6:
	NPCMsg msg_1085_SL02R0101_00050
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00051
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08E5
	GoTo _095E

_08E5:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_RICH_BOY_ROMAN, TRAINER_SINNOH_LADY_KYLIE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_RICH_BOY_ROMAN
	SetTrainerFlag TRAINER_SINNOH_LADY_KYLIE
	Call _09CD
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _093D
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0948
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0953
	ReleaseAll
	End

_093D:
	NPCMsg msg_1085_SL02R0101_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0948:
	NPCMsg msg_1085_SL02R0101_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0953:
	NPCMsg msg_1085_SL02R0101_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

_095E:
	CloseMsg
	Call _09CD
	ReleaseAll
	End

_096A:
	CopyVar 0x8008, VAR_SINNOH_40FC
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0999
	CompareVarToValue 0x8008, 1
	GoToIf 1, _09A4
	CompareVarToValue 0x8008, 2
	GoToIf 1, _09AF
	End

_0999:
	NPCMsg msg_1085_SL02R0101_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09A4:
	NPCMsg msg_1085_SL02R0101_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09AF:
	NPCMsg msg_1085_SL02R0101_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

_09BA:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00029
	WaitButton
	CloseMsg
	Call _09CD
	ReleaseAll
	End

_09CD:
	ApplyMovement 3, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_007:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_GENTLEMAN_LEONARDO
	CheckTrainerFlag TRAINER_SINNOH_GENTLEMAN_LEONARDO
	GoToIf 1, _0B14
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0B64
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0A32
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0A51
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0A70
	ReleaseAll
	End

_0A32:
	NPCMsg msg_1085_SL02R0101_00056
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00057
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0A8F
	GoTo _0B08

_0A51:
	NPCMsg msg_1085_SL02R0101_00064
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00065
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0A8F
	GoTo _0B08

_0A70:
	NPCMsg msg_1085_SL02R0101_00072
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00073
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0A8F
	GoTo _0B08

_0A8F:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GENTLEMAN_LEONARDO, TRAINER_SINNOH_SOCIALITE_REBECCA, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_GENTLEMAN_LEONARDO
	SetTrainerFlag TRAINER_SINNOH_SOCIALITE_REBECCA
	Call _0B77
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0AE7
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0AF2
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0AFD
	ReleaseAll
	End

_0AE7:
	NPCMsg msg_1085_SL02R0101_00059
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0AF2:
	NPCMsg msg_1085_SL02R0101_00067
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0AFD:
	NPCMsg msg_1085_SL02R0101_00075
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B08:
	CloseMsg
	Call _0B77
	ReleaseAll
	End

_0B14:
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0B43
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0B4E
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0B59
	End

_0B43:
	NPCMsg msg_1085_SL02R0101_00059
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B4E:
	NPCMsg msg_1085_SL02R0101_00067
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B59:
	NPCMsg msg_1085_SL02R0101_00075
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B64:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00054
	WaitButton
	CloseMsg
	Call _0B77
	ReleaseAll
	End

_0B77:
	ApplyMovement 0, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_SOCIALITE_REBECCA
	CheckTrainerFlag TRAINER_SINNOH_SOCIALITE_REBECCA
	GoToIf 1, _0CBE
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0D0E
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0BDC
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0BFB
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0C1A
	ReleaseAll
	End

_0BDC:
	NPCMsg msg_1085_SL02R0101_00060
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00061
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C39
	GoTo _0CB2

_0BFB:
	NPCMsg msg_1085_SL02R0101_00068
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00069
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C39
	GoTo _0CB2

_0C1A:
	NPCMsg msg_1085_SL02R0101_00076
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00077
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0C39
	GoTo _0CB2

_0C39:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GENTLEMAN_LEONARDO, TRAINER_SINNOH_SOCIALITE_REBECCA, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_GENTLEMAN_LEONARDO
	SetTrainerFlag TRAINER_SINNOH_SOCIALITE_REBECCA
	Call _0D21
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0C91
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0C9C
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0CA7
	ReleaseAll
	End

_0C91:
	NPCMsg msg_1085_SL02R0101_00063
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0C9C:
	NPCMsg msg_1085_SL02R0101_00071
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CA7:
	NPCMsg msg_1085_SL02R0101_00079
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CB2:
	CloseMsg
	Call _0D21
	ReleaseAll
	End

_0CBE:
	CopyVar 0x8008, VAR_SINNOH_40FD
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0CED
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0CF8
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0D03
	End

_0CED:
	NPCMsg msg_1085_SL02R0101_00063
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CF8:
	NPCMsg msg_1085_SL02R0101_00071
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0D03:
	NPCMsg msg_1085_SL02R0101_00079
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0D0E:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00055
	WaitButton
	CloseMsg
	Call _0D21
	ReleaseAll
	End

_0D21:
	ApplyMovement 1, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_COLLECTOR_EUGENE
	CheckTrainerFlag TRAINER_SINNOH_COLLECTOR_EUGENE
	GoToIf 1, _0E68
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0EB8
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0D86
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0DA5
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0DC4
	ReleaseAll
	End

_0D86:
	NPCMsg msg_1085_SL02R0101_00082
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00083
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0DE3
	GoTo _0E5C

_0DA5:
	NPCMsg msg_1085_SL02R0101_00090
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00091
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0DE3
	GoTo _0E5C

_0DC4:
	NPCMsg msg_1085_SL02R0101_00098
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00099
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0DE3
	GoTo _0E5C

_0DE3:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COLLECTOR_EUGENE, TRAINER_SINNOH_AROMA_LADY_ALISON, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_COLLECTOR_EUGENE
	SetTrainerFlag TRAINER_SINNOH_AROMA_LADY_ALISON
	Call _0ECB
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0E3B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0E46
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0E51
	ReleaseAll
	End

_0E3B:
	NPCMsg msg_1085_SL02R0101_00085
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E46:
	NPCMsg msg_1085_SL02R0101_00093
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E51:
	NPCMsg msg_1085_SL02R0101_00101
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0E5C:
	CloseMsg
	Call _0ECB
	ReleaseAll
	End

_0E68:
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0E97
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0EA2
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0EAD
	End

_0E97:
	NPCMsg msg_1085_SL02R0101_00085
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0EA2:
	NPCMsg msg_1085_SL02R0101_00093
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0EAD:
	NPCMsg msg_1085_SL02R0101_00101
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0EB8:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00080
	WaitButton
	CloseMsg
	Call _0ECB
	ReleaseAll
	End

_0ECB:
	ApplyMovement 17, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_AROMA_LADY_ALISON
	CheckTrainerFlag TRAINER_SINNOH_AROMA_LADY_ALISON
	GoToIf 1, _1012
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1062
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0F30
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0F4F
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0F6E
	ReleaseAll
	End

_0F30:
	NPCMsg msg_1085_SL02R0101_00086
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00087
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0F8D
	GoTo _1006

_0F4F:
	NPCMsg msg_1085_SL02R0101_00094
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00095
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0F8D
	GoTo _1006

_0F6E:
	NPCMsg msg_1085_SL02R0101_00102
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00103
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0F8D
	GoTo _1006

_0F8D:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COLLECTOR_EUGENE, TRAINER_SINNOH_AROMA_LADY_ALISON, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_COLLECTOR_EUGENE
	SetTrainerFlag TRAINER_SINNOH_AROMA_LADY_ALISON
	Call _1075
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0FE5
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0FF0
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0FFB
	ReleaseAll
	End

_0FE5:
	NPCMsg msg_1085_SL02R0101_00089
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0FF0:
	NPCMsg msg_1085_SL02R0101_00097
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0FFB:
	NPCMsg msg_1085_SL02R0101_00105
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1006:
	CloseMsg
	Call _1075
	ReleaseAll
	End

_1012:
	CopyVar 0x8008, VAR_SINNOH_40FE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1041
	CompareVarToValue 0x8008, 1
	GoToIf 1, _104C
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1057
	End

_1041:
	NPCMsg msg_1085_SL02R0101_00089
	WaitButton
	CloseMsg
	ReleaseAll
	End

_104C:
	NPCMsg msg_1085_SL02R0101_00097
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1057:
	NPCMsg msg_1085_SL02R0101_00105
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1062:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00081
	WaitButton
	CloseMsg
	Call _1075
	ReleaseAll
	End

_1075:
	ApplyMovement 10, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN
	CheckTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN
	GoToIf 1, _11BC
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _120C
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _10DA
	CompareVarToValue 0x8008, 1
	GoToIf 1, _10F9
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1118
	ReleaseAll
	End

_10DA:
	NPCMsg msg_1085_SL02R0101_00108
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00109
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1137
	GoTo _11B0

_10F9:
	NPCMsg msg_1085_SL02R0101_00116
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00117
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1137
	GoTo _11B0

_1118:
	NPCMsg msg_1085_SL02R0101_00124
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00125
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1137
	GoTo _11B0

_1137:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN, TRAINER_SINNOH_POKEFAN_F_MEREDITH, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN
	SetTrainerFlag TRAINER_SINNOH_POKEFAN_F_MEREDITH
	Call _121F
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _118F
	CompareVarToValue 0x8008, 1
	GoToIf 1, _119A
	CompareVarToValue 0x8008, 2
	GoToIf 1, _11A5
	ReleaseAll
	End

_118F:
	NPCMsg msg_1085_SL02R0101_00111
	WaitButton
	CloseMsg
	ReleaseAll
	End

_119A:
	NPCMsg msg_1085_SL02R0101_00119
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11A5:
	NPCMsg msg_1085_SL02R0101_00127
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11B0:
	CloseMsg
	Call _121F
	ReleaseAll
	End

_11BC:
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _11EB
	CompareVarToValue 0x8008, 1
	GoToIf 1, _11F6
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1201
	End

_11EB:
	NPCMsg msg_1085_SL02R0101_00111
	WaitButton
	CloseMsg
	ReleaseAll
	End

_11F6:
	NPCMsg msg_1085_SL02R0101_00119
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1201:
	NPCMsg msg_1085_SL02R0101_00127
	WaitButton
	CloseMsg
	ReleaseAll
	End

_120C:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00106
	WaitButton
	CloseMsg
	Call _121F
	ReleaseAll
	End

_121F:
	ApplyMovement 15, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_012:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_POKEFAN_F_MEREDITH
	CheckTrainerFlag TRAINER_SINNOH_POKEFAN_F_MEREDITH
	GoToIf 1, _1366
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _13B6
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1284
	CompareVarToValue 0x8008, 1
	GoToIf 1, _12A3
	CompareVarToValue 0x8008, 2
	GoToIf 1, _12C2
	ReleaseAll
	End

_1284:
	NPCMsg msg_1085_SL02R0101_00112
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00113
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _12E1
	GoTo _135A

_12A3:
	NPCMsg msg_1085_SL02R0101_00120
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00121
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _12E1
	GoTo _135A

_12C2:
	NPCMsg msg_1085_SL02R0101_00128
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00129
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _12E1
	GoTo _135A

_12E1:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN, TRAINER_SINNOH_POKEFAN_F_MEREDITH, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_SCHOOL_KID_M_ESTEBAN
	SetTrainerFlag TRAINER_SINNOH_POKEFAN_F_MEREDITH
	Call _13C9
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1339
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1344
	CompareVarToValue 0x8008, 2
	GoToIf 1, _134F
	ReleaseAll
	End

_1339:
	NPCMsg msg_1085_SL02R0101_00115
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1344:
	NPCMsg msg_1085_SL02R0101_00123
	WaitButton
	CloseMsg
	ReleaseAll
	End

_134F:
	NPCMsg msg_1085_SL02R0101_00131
	WaitButton
	CloseMsg
	ReleaseAll
	End

_135A:
	CloseMsg
	Call _13C9
	ReleaseAll
	End

_1366:
	CopyVar 0x8008, VAR_SINNOH_40FF
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1395
	CompareVarToValue 0x8008, 1
	GoToIf 1, _13A0
	CompareVarToValue 0x8008, 2
	GoToIf 1, _13AB
	End

_1395:
	NPCMsg msg_1085_SL02R0101_00115
	WaitButton
	CloseMsg
	ReleaseAll
	End

_13A0:
	NPCMsg msg_1085_SL02R0101_00123
	WaitButton
	CloseMsg
	ReleaseAll
	End

_13AB:
	NPCMsg msg_1085_SL02R0101_00131
	WaitButton
	CloseMsg
	ReleaseAll
	End

_13B6:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00107
	WaitButton
	CloseMsg
	Call _13C9
	ReleaseAll
	End

_13C9:
	ApplyMovement 13, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_013:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_VETERAN_EMANUEL
	CheckTrainerFlag TRAINER_SINNOH_VETERAN_EMANUEL
	GoToIf 1, _1510
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1560
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _142E
	CompareVarToValue 0x8008, 1
	GoToIf 1, _144D
	CompareVarToValue 0x8008, 2
	GoToIf 1, _146C
	ReleaseAll
	End

_142E:
	NPCMsg msg_1085_SL02R0101_00134
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00135
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _148B
	GoTo _1504

_144D:
	NPCMsg msg_1085_SL02R0101_00142
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00143
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _148B
	GoTo _1504

_146C:
	NPCMsg msg_1085_SL02R0101_00150
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00151
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _148B
	GoTo _1504

_148B:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_VETERAN_EMANUEL, TRAINER_SINNOH_LASS_BLYTHE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_VETERAN_EMANUEL
	SetTrainerFlag TRAINER_SINNOH_LASS_BLYTHE
	Call _1573
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _14E3
	CompareVarToValue 0x8008, 1
	GoToIf 1, _14EE
	CompareVarToValue 0x8008, 2
	GoToIf 1, _14F9
	ReleaseAll
	End

_14E3:
	NPCMsg msg_1085_SL02R0101_00137
	WaitButton
	CloseMsg
	ReleaseAll
	End

_14EE:
	NPCMsg msg_1085_SL02R0101_00145
	WaitButton
	CloseMsg
	ReleaseAll
	End

_14F9:
	NPCMsg msg_1085_SL02R0101_00153
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1504:
	CloseMsg
	Call _1573
	ReleaseAll
	End

_1510:
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _153F
	CompareVarToValue 0x8008, 1
	GoToIf 1, _154A
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1555
	End

_153F:
	NPCMsg msg_1085_SL02R0101_00137
	WaitButton
	CloseMsg
	ReleaseAll
	End

_154A:
	NPCMsg msg_1085_SL02R0101_00145
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1555:
	NPCMsg msg_1085_SL02R0101_00153
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1560:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00132
	WaitButton
	CloseMsg
	Call _1573
	ReleaseAll
	End

_1573:
	ApplyMovement 11, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_014:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_LASS_BLYTHE
	CheckTrainerFlag TRAINER_SINNOH_LASS_BLYTHE
	GoToIf 1, _16BA
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _170A
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _15D8
	CompareVarToValue 0x8008, 1
	GoToIf 1, _15F7
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1616
	ReleaseAll
	End

_15D8:
	NPCMsg msg_1085_SL02R0101_00138
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00139
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1635
	GoTo _16AE

_15F7:
	NPCMsg msg_1085_SL02R0101_00146
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00147
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1635
	GoTo _16AE

_1616:
	NPCMsg msg_1085_SL02R0101_00154
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00155
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1635
	GoTo _16AE

_1635:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_VETERAN_EMANUEL, TRAINER_SINNOH_LASS_BLYTHE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_VETERAN_EMANUEL
	SetTrainerFlag TRAINER_SINNOH_LASS_BLYTHE
	Call _171D
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _168D
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1698
	CompareVarToValue 0x8008, 2
	GoToIf 1, _16A3
	ReleaseAll
	End

_168D:
	NPCMsg msg_1085_SL02R0101_00141
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1698:
	NPCMsg msg_1085_SL02R0101_00149
	WaitButton
	CloseMsg
	ReleaseAll
	End

_16A3:
	NPCMsg msg_1085_SL02R0101_00157
	WaitButton
	CloseMsg
	ReleaseAll
	End

_16AE:
	CloseMsg
	Call _171D
	ReleaseAll
	End

_16BA:
	CopyVar 0x8008, VAR_SINNOH_4100
	CompareVarToValue 0x8008, 0
	GoToIf 1, _16E9
	CompareVarToValue 0x8008, 1
	GoToIf 1, _16F4
	CompareVarToValue 0x8008, 2
	GoToIf 1, _16FF
	End

_16E9:
	NPCMsg msg_1085_SL02R0101_00141
	WaitButton
	CloseMsg
	ReleaseAll
	End

_16F4:
	NPCMsg msg_1085_SL02R0101_00149
	WaitButton
	CloseMsg
	ReleaseAll
	End

_16FF:
	NPCMsg msg_1085_SL02R0101_00157
	WaitButton
	CloseMsg
	ReleaseAll
	End

_170A:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00133
	WaitButton
	CloseMsg
	Call _171D
	ReleaseAll
	End

_171D:
	ApplyMovement 12, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_015:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_CAMERAMAN_DARRYL
	CheckTrainerFlag TRAINER_SINNOH_CAMERAMAN_DARRYL
	GoToIf 1, _1864
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _18B4
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1782
	CompareVarToValue 0x8008, 1
	GoToIf 1, _17A1
	CompareVarToValue 0x8008, 2
	GoToIf 1, _17C0
	ReleaseAll
	End

_1782:
	NPCMsg msg_1085_SL02R0101_00160
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00161
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _17DF
	GoTo _1858

_17A1:
	NPCMsg msg_1085_SL02R0101_00168
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00169
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _17DF
	GoTo _1858

_17C0:
	NPCMsg msg_1085_SL02R0101_00176
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00177
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _17DF
	GoTo _1858

_17DF:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_CAMERAMAN_DARRYL, TRAINER_SINNOH_REPORTER_VALERIE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_CAMERAMAN_DARRYL
	SetTrainerFlag TRAINER_SINNOH_REPORTER_VALERIE
	Call _18C7
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1837
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1842
	CompareVarToValue 0x8008, 2
	GoToIf 1, _184D
	ReleaseAll
	End

_1837:
	NPCMsg msg_1085_SL02R0101_00163
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1842:
	NPCMsg msg_1085_SL02R0101_00171
	WaitButton
	CloseMsg
	ReleaseAll
	End

_184D:
	NPCMsg msg_1085_SL02R0101_00179
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1858:
	CloseMsg
	Call _18C7
	ReleaseAll
	End

_1864:
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1893
	CompareVarToValue 0x8008, 1
	GoToIf 1, _189E
	CompareVarToValue 0x8008, 2
	GoToIf 1, _18A9
	End

_1893:
	NPCMsg msg_1085_SL02R0101_00163
	WaitButton
	CloseMsg
	ReleaseAll
	End

_189E:
	NPCMsg msg_1085_SL02R0101_00171
	WaitButton
	CloseMsg
	ReleaseAll
	End

_18A9:
	NPCMsg msg_1085_SL02R0101_00179
	WaitButton
	CloseMsg
	ReleaseAll
	End

_18B4:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00158
	WaitButton
	CloseMsg
	Call _18C7
	ReleaseAll
	End

_18C7:
	ApplyMovement 5, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_016:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_REPORTER_VALERIE
	CheckTrainerFlag TRAINER_SINNOH_REPORTER_VALERIE
	GoToIf 1, _1A0E
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1A5E
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _192C
	CompareVarToValue 0x8008, 1
	GoToIf 1, _194B
	CompareVarToValue 0x8008, 2
	GoToIf 1, _196A
	ReleaseAll
	End

_192C:
	NPCMsg msg_1085_SL02R0101_00164
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00165
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1989
	GoTo _1A02

_194B:
	NPCMsg msg_1085_SL02R0101_00172
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00173
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1989
	GoTo _1A02

_196A:
	NPCMsg msg_1085_SL02R0101_00180
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00181
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1989
	GoTo _1A02

_1989:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_CAMERAMAN_DARRYL, TRAINER_SINNOH_REPORTER_VALERIE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_CAMERAMAN_DARRYL
	SetTrainerFlag TRAINER_SINNOH_REPORTER_VALERIE
	Call _1A71
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _19E1
	CompareVarToValue 0x8008, 1
	GoToIf 1, _19EC
	CompareVarToValue 0x8008, 2
	GoToIf 1, _19F7
	ReleaseAll
	End

_19E1:
	NPCMsg msg_1085_SL02R0101_00167
	WaitButton
	CloseMsg
	ReleaseAll
	End

_19EC:
	NPCMsg msg_1085_SL02R0101_00175
	WaitButton
	CloseMsg
	ReleaseAll
	End

_19F7:
	NPCMsg msg_1085_SL02R0101_00183
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1A02:
	CloseMsg
	Call _1A71
	ReleaseAll
	End

_1A0E:
	CopyVar 0x8008, VAR_SINNOH_4101
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1A3D
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1A48
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1A53
	End

_1A3D:
	NPCMsg msg_1085_SL02R0101_00167
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1A48:
	NPCMsg msg_1085_SL02R0101_00175
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1A53:
	NPCMsg msg_1085_SL02R0101_00183
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1A5E:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00159
	WaitButton
	CloseMsg
	Call _1A71
	ReleaseAll
	End

_1A71:
	ApplyMovement 4, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_017:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_PI_KENDRICK
	CheckTrainerFlag TRAINER_SINNOH_PI_KENDRICK
	GoToIf 1, _1BB8
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1C08
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1AD6
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1AF5
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1B14
	ReleaseAll
	End

_1AD6:
	NPCMsg msg_1085_SL02R0101_00186
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00187
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1B33
	GoTo _1BAC

_1AF5:
	NPCMsg msg_1085_SL02R0101_00194
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00195
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1B33
	GoTo _1BAC

_1B14:
	NPCMsg msg_1085_SL02R0101_00202
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00203
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1B33
	GoTo _1BAC

_1B33:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_PI_KENDRICK, TRAINER_SINNOH_BEAUTY_GABRIELLA, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_PI_KENDRICK
	SetTrainerFlag TRAINER_SINNOH_BEAUTY_GABRIELLA
	Call _1C1B
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1B8B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1B96
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1BA1
	ReleaseAll
	End

_1B8B:
	NPCMsg msg_1085_SL02R0101_00189
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1B96:
	NPCMsg msg_1085_SL02R0101_00197
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1BA1:
	NPCMsg msg_1085_SL02R0101_00205
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1BAC:
	CloseMsg
	Call _1C1B
	ReleaseAll
	End

_1BB8:
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1BE7
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1BF2
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1BFD
	End

_1BE7:
	NPCMsg msg_1085_SL02R0101_00189
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1BF2:
	NPCMsg msg_1085_SL02R0101_00197
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1BFD:
	NPCMsg msg_1085_SL02R0101_00205
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1C08:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00184
	WaitButton
	CloseMsg
	Call _1C1B
	ReleaseAll
	End

_1C1B:
	ApplyMovement 7, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_018:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_BEAUTY_GABRIELLA
	CheckTrainerFlag TRAINER_SINNOH_BEAUTY_GABRIELLA
	GoToIf 1, _1D62
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1DB2
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1C80
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1C9F
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1CBE
	ReleaseAll
	End

_1C80:
	NPCMsg msg_1085_SL02R0101_00190
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00191
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1CDD
	GoTo _1D56

_1C9F:
	NPCMsg msg_1085_SL02R0101_00198
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00199
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1CDD
	GoTo _1D56

_1CBE:
	NPCMsg msg_1085_SL02R0101_00206
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00207
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1CDD
	GoTo _1D56

_1CDD:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_PI_KENDRICK, TRAINER_SINNOH_BEAUTY_GABRIELLA, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_PI_KENDRICK
	SetTrainerFlag TRAINER_SINNOH_BEAUTY_GABRIELLA
	Call _1DC5
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1D35
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1D40
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1D4B
	ReleaseAll
	End

_1D35:
	NPCMsg msg_1085_SL02R0101_00193
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1D40:
	NPCMsg msg_1085_SL02R0101_00201
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1D4B:
	NPCMsg msg_1085_SL02R0101_00209
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1D56:
	CloseMsg
	Call _1DC5
	ReleaseAll
	End

_1D62:
	CopyVar 0x8008, VAR_SINNOH_4102
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1D91
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1D9C
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1DA7
	End

_1D91:
	NPCMsg msg_1085_SL02R0101_00193
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1D9C:
	NPCMsg msg_1085_SL02R0101_00201
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1DA7:
	NPCMsg msg_1085_SL02R0101_00209
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1DB2:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00185
	WaitButton
	CloseMsg
	Call _1DC5
	ReleaseAll
	End

_1DC5:
	ApplyMovement 8, mv_SL02R0101_2134
	WaitMovement
	Return

scr_seq_SL02R0101_019:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_SCIENTIST_EMILIO
	CheckTrainerFlag TRAINER_SINNOH_SCIENTIST_EMILIO
	GoToIf 1, _1F0C
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1F5C
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1E2A
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1E49
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1E68
	ReleaseAll
	End

_1E2A:
	NPCMsg msg_1085_SL02R0101_00212
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00213
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1E87
	GoTo _1F00

_1E49:
	NPCMsg msg_1085_SL02R0101_00220
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00221
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1E87
	GoTo _1F00

_1E68:
	NPCMsg msg_1085_SL02R0101_00228
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00229
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _1E87
	GoTo _1F00

_1E87:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCIENTIST_EMILIO, TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_SCIENTIST_EMILIO
	SetTrainerFlag TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE
	Call _1F6F
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1EDF
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1EEA
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1EF5
	ReleaseAll
	End

_1EDF:
	NPCMsg msg_1085_SL02R0101_00215
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1EEA:
	NPCMsg msg_1085_SL02R0101_00223
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1EF5:
	NPCMsg msg_1085_SL02R0101_00231
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1F00:
	CloseMsg
	Call _1F6F
	ReleaseAll
	End

_1F0C:
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1F3B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1F46
	CompareVarToValue 0x8008, 2
	GoToIf 1, _1F51
	End

_1F3B:
	NPCMsg msg_1085_SL02R0101_00215
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1F46:
	NPCMsg msg_1085_SL02R0101_00223
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1F51:
	NPCMsg msg_1085_SL02R0101_00231
	WaitButton
	CloseMsg
	ReleaseAll
	End

_1F5C:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00210
	WaitButton
	CloseMsg
	Call _1F6F
	ReleaseAll
	End

_1F6F:
	ApplyMovement 14, mv_SL02R0101_212C
	WaitMovement
	Return

scr_seq_SL02R0101_020:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckTrainerFlag TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE
	CheckTrainerFlag TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE
	GoToIf 1, _20B6
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _2106
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _1FD4
	CompareVarToValue 0x8008, 1
	GoToIf 1, _1FF3
	CompareVarToValue 0x8008, 2
	GoToIf 1, _2012
	ReleaseAll
	End

_1FD4:
	NPCMsg msg_1085_SL02R0101_00216
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00217
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2031
	GoTo _20AA

_1FF3:
	NPCMsg msg_1085_SL02R0101_00224
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00225
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2031
	GoTo _20AA

_2012:
	NPCMsg msg_1085_SL02R0101_00232
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00233
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2031
	GoTo _20AA

_2031:
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCIENTIST_EMILIO, TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _2125
	SetTrainerFlag TRAINER_SINNOH_SCIENTIST_EMILIO
	SetTrainerFlag TRAINER_SINNOH_PKMN_BREEDER_F_KAYLEE
	Call _2119
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _2089
	CompareVarToValue 0x8008, 1
	GoToIf 1, _2094
	CompareVarToValue 0x8008, 2
	GoToIf 1, _209F
	ReleaseAll
	End

_2089:
	NPCMsg msg_1085_SL02R0101_00219
	WaitButton
	CloseMsg
	ReleaseAll
	End

_2094:
	NPCMsg msg_1085_SL02R0101_00227
	WaitButton
	CloseMsg
	ReleaseAll
	End

_209F:
	NPCMsg msg_1085_SL02R0101_00235
	WaitButton
	CloseMsg
	ReleaseAll
	End

_20AA:
	CloseMsg
	Call _2119
	ReleaseAll
	End

_20B6:
	CopyVar 0x8008, VAR_SINNOH_4103
	CompareVarToValue 0x8008, 0
	GoToIf 1, _20E5
	CompareVarToValue 0x8008, 1
	GoToIf 1, _20F0
	CompareVarToValue 0x8008, 2
	GoToIf 1, _20FB
	End

_20E5:
	NPCMsg msg_1085_SL02R0101_00219
	WaitButton
	CloseMsg
	ReleaseAll
	End

_20F0:
	NPCMsg msg_1085_SL02R0101_00227
	WaitButton
	CloseMsg
	ReleaseAll
	End

_20FB:
	NPCMsg msg_1085_SL02R0101_00235
	WaitButton
	CloseMsg
	ReleaseAll
	End

_2106:
	FacePlayer
	NPCMsg msg_1085_SL02R0101_00211
	WaitButton
	CloseMsg
	Call _2119
	ReleaseAll
	End

_2119:
	ApplyMovement 16, mv_SL02R0101_2134
	WaitMovement
	Return

_2125:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SL02R0101_212C:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SL02R0101_2134:
	.short 2, 1
	EndMovement


	.balign 4, 0
