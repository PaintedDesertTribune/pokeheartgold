#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07.h"
#include "msgdata/msg/msg_1056_SC07.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07_000
	ScrDef scr_seq_SC07_001
	ScrDef scr_seq_SC07_002
	ScrDef scr_seq_SC07_003
	ScrDef scr_seq_SC07_004
	ScrDef scr_seq_SC07_005
	ScrDef scr_seq_SC07_006
	ScrDef scr_seq_SC07_007
	ScrDef scr_seq_SC07_008
	ScrDef scr_seq_SC07_009
	ScrDef scr_seq_SC07_010
	ScrDef scr_seq_SC07_011
	ScrDef scr_seq_SC07_012
	ScrDef scr_seq_SC07_013
	ScrDef scr_seq_SC07_014
	ScrDef scr_seq_SC07_015
	ScrDef scr_seq_SC07_016
	ScrDef scr_seq_SC07_017
	ScrDef scr_seq_SC07_018
	ScrDef scr_seq_SC07_019
	ScrDef scr_seq_SC07_020
	ScrDef scr_seq_SC07_021
	ScrDef scr_seq_SC07_022
	ScrDef scr_seq_SC07_023
	ScrDef scr_seq_SC07_024
	ScrDef scr_seq_SC07_025
	ScrDef scr_seq_SC07_026
	ScrDef scr_seq_SC07_027
	ScrDef scr_seq_SC07_028
	ScrDef scr_seq_SC07_029
	ScrDef scr_seq_SC07_030
	ScrDef scr_seq_SC07_031
	ScrDef scr_seq_SC07_032
	ScrDefEnd

scr_seq_SC07_000:
	CompareVarToValue VAR_SINNOH_411A, 2
	CallIf 4, _00A7
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _00BD
	CompareVarToValue 0x4000, 1
	GoToIf 1, _00C5
	End

_00A7:
	MovePerson 6, 696, 596
	SetObjectMovementType 6, 17
	SetObjectFacing 6, 3
	Return

_00BD:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_00C5:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_SC07_015:
	LockAll
	ApplyMovement 6, mv_SC07_0214
	WaitMovement
	CallStd std_sinnoh_partner_theme
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 681
	CallIf 1, _0193
	CompareVarToValue 0x8004, 682
	CallIf 1, _019F
	CompareVarToValue 0x8004, 683
	CallIf 1, _01AB
	CompareVarToValue 0x8004, 684
	CallIf 1, _01B7
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0183
	CompareVarToValue 0x8004, 1
	CallIf 1, _018B
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 681
	CallIf 1, _01C3
	CompareVarToValue 0x8004, 682
	CallIf 1, _01D7
	CompareVarToValue 0x8004, 683
	CallIf 1, _01EB
	CompareVarToValue 0x8004, 684
	CallIf 1, _01FF
	HidePerson 6
	CallStd std_sinnoh_default_bgm
	SetVar VAR_SINNOH_40F5, 1
	ReleaseAll
	End

_0183:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00002
	Return

_018B:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00003
	Return

_0193:
	ApplyMovement 6, mv_SC07_0220
	WaitMovement
	Return

_019F:
	ApplyMovement 6, mv_SC07_022C
	WaitMovement
	Return

_01AB:
	ApplyMovement 6, mv_SC07_0234
	WaitMovement
	Return

_01B7:
	ApplyMovement 6, mv_SC07_0240
	WaitMovement
	Return

_01C3:
	ApplyMovement 6, mv_SC07_024C
	ApplyMovement obj_player, mv_SC07_0264
	WaitMovement
	Return

_01D7:
	ApplyMovement 6, mv_SC07_024C
	ApplyMovement obj_player, mv_SC07_0264
	WaitMovement
	Return

_01EB:
	ApplyMovement 6, mv_SC07_0258
	ApplyMovement obj_player, mv_SC07_0274
	WaitMovement
	Return

_01FF:
	ApplyMovement 6, mv_SC07_0258
	ApplyMovement obj_player, mv_SC07_0274
	WaitMovement
	Return

scr_seq_SC07_016:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	GoToIf 1, _02AC
	CompareVarToValue 0x8004, 1
	GoToIf 1, _02DD
	End

_02AC:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00012
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02C9
	GoTo _02D2

_02C9:
	NPCMsg msg_1056_SC07_00013
	GoTo _030E

_02D2:
	NPCMsg msg_1056_SC07_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02DD:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00017
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02FA
	GoTo _0303

_02FA:
	NPCMsg msg_1056_SC07_00018
	GoTo _030E

_0303:
	NPCMsg msg_1056_SC07_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_030E:
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 3
	CallIf 1, _04E2
	CompareVarToValue 0x800C, 1
	CallIf 1, _04F6
	CompareVarToValue 0x800C, 0
	CallIf 1, _050A
	Call _045C
	MultiBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_19, TRAINER_SINNOH_GALACTIC_GRUNT_37, TRAINER_SINNOH_GALACTIC_GRUNT_38, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _05AE
	NPCMsg msg_1056_SC07_00009
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 595
	CallIf 1, _051E
	CompareVarToValue 0x8005, 597
	CallIf 1, _052A
	NPCMsg msg_1056_SC07_00010
	CloseMsg
	Wait 15, 0x800C
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 595
	CallIf 1, _0536
	CompareVarToValue 0x8005, 597
	CallIf 1, _0542
	HidePerson 7
	NPCMsg msg_1056_SC07_00011
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 595
	CallIf 1, _054E
	CompareVarToValue 0x8005, 597
	CallIf 1, _055A
	HidePerson 20
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0566
	CompareVarToValue 0x8004, 1
	CallIf 1, _056B
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 595
	CallIf 1, _057A
	CompareVarToValue 0x8005, 597
	CallIf 1, _058E
	Wait 10, 0x800C
	BufferPlayersName 0
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0570
	CompareVarToValue 0x8004, 1
	CallIf 1, _0575
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 6, mv_SC07_0634
	ApplyMovement obj_player, mv_SC07_068C
	WaitMovement
	GoTo _05A2

_045C:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _047C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04AE
	End

_047C:
	GetStarterChoice 0x800C
	SetVar 0x8004, 625
	CompareVarToValue 0x800C, 390
	GoToIf 1, _04E0
	SetVar 0x8004, 626
	CompareVarToValue 0x800C, 393
	GoToIf 1, _04E0
	SetVar 0x8004, 624
	Return

_04AE:
	GetStarterChoice 0x800C
	SetVar 0x8004, 622
	CompareVarToValue 0x800C, 390
	GoToIf 1, _04E0
	SetVar 0x8004, 623
	CompareVarToValue 0x800C, 393
	GoToIf 1, _04E0
	SetVar 0x8004, 621
	Return

_04E0:
	Return

_04E2:
	ApplyMovement 6, mv_SC07_05B4
	ApplyMovement obj_player, mv_SC07_0640
	WaitMovement
	Return

_04F6:
	ApplyMovement 6, mv_SC07_05C0
	ApplyMovement obj_player, mv_SC07_064C
	WaitMovement
	Return

_050A:
	ApplyMovement 6, mv_SC07_05CC
	ApplyMovement obj_player, mv_SC07_0654
	WaitMovement
	Return

_051E:
	ApplyMovement 20, mv_SC07_0698
	WaitMovement
	Return

_052A:
	ApplyMovement 7, mv_SC07_0698
	WaitMovement
	Return

_0536:
	ApplyMovement 7, mv_SC07_06A0
	WaitMovement
	Return

_0542:
	ApplyMovement 7, mv_SC07_06A0
	WaitMovement
	Return

_054E:
	ApplyMovement 20, mv_SC07_06B0
	WaitMovement
	Return

_055A:
	ApplyMovement 20, mv_SC07_06B0
	WaitMovement
	Return

_0566:
	NPCMsg msg_1056_SC07_00015
	Return

_056B:
	NPCMsg msg_1056_SC07_00020
	Return

_0570:
	NPCMsg msg_1056_SC07_00016
	Return

_0575:
	NPCMsg msg_1056_SC07_00021
	Return

_057A:
	ApplyMovement 6, mv_SC07_0624
	ApplyMovement obj_player, mv_SC07_067C
	WaitMovement
	Return

_058E:
	ApplyMovement 6, mv_SC07_062C
	ApplyMovement obj_player, mv_SC07_0684
	WaitMovement
	Return

_05A2:
	SetFlag FLAG_SINNOH_257
	HidePerson 6
	ReleaseAll
	End

_05AE:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC07_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_007:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_204
	GoToIf 1, _0777
	NPCMsg msg_1056_SC07_00034
	SetVar 0x8004, 390
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0782
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_204
	GoTo _0777

_0777:
	NPCMsg msg_1056_SC07_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0782:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_010:
	LockAll
	ApplyMovement 7, mv_SC07_07EC
	ApplyMovement obj_player, mv_SC07_07E4
	WaitMovement
	NPCMsg msg_1056_SC07_00004
	CloseMsg
	ApplyMovement 7, mv_SC07_07F8
	ApplyMovement obj_player, mv_SC07_0810
	WaitMovement
	ReleaseAll
	End

scr_seq_SC07_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _083E
	NPCMsg msg_1056_SC07_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_083E:
	NPCMsg msg_1056_SC07_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_012:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _086F
	NPCMsg msg_1056_SC07_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_086F:
	NPCMsg msg_1056_SC07_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_013:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1056_SC07_00022
	CloseMsg
	FacePlayer
	ApplyMovement 24, mv_SC07_0938
	WaitMovement
	NPCMsg msg_1056_SC07_00023
	CloseMsg
	ClearFlag FLAG_SINNOH_1224
	ShowPerson 23
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08D8
	CompareVarToValue 0x800C, 1
	GoToIf 1, _08F0
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0918
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0900
	End

_08D8:
	ApplyMovement obj_player, mv_SC07_0964
	ApplyMovement 24, mv_SC07_0940
	WaitMovement
	GoTo _0930

_08F0:
	ApplyMovement 24, mv_SC07_0940
	WaitMovement
	GoTo _0930

_0900:
	ApplyMovement obj_player, mv_SC07_0978
	ApplyMovement 24, mv_SC07_0940
	WaitMovement
	GoTo _0930

_0918:
	ApplyMovement obj_player, mv_SC07_0984
	ApplyMovement 24, mv_SC07_0954
	WaitMovement
	GoTo _0930

_0930:
	HidePerson 24
	ReleaseAll
	End

scr_seq_SC07_014:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1056_SC07_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_017:
	DirectionSignpost msg_1056_SC07_00041, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_018:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1056_SC07_00042, 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_019:
	DirectionSignpost msg_1056_SC07_00043, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_020:
	DirectionSignpost msg_1056_SC07_00044, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_021:
	DirectionSignpost msg_1056_SC07_00045, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_022:
	DirectionSignpost msg_1056_SC07_00046, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_023:
	DirectionSignpost msg_1056_SC07_00047, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_024:
	DirectionSignpost msg_1056_SC07_00048, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC07_025:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_CheckPokemonInParty 0x262 args [386, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0B19
	// TODO Diamond ScrCmd_SetDeoxysForm 0x263 args [3]: no HeartGold mapping yet
	PlayCry 386, 0
	NPCMsg msg_1056_SC07_00037
	WaitButton
	WaitCry
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_026:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_CheckPokemonInParty 0x262 args [386, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0B19
	// TODO Diamond ScrCmd_SetDeoxysForm 0x263 args [2]: no HeartGold mapping yet
	PlayCry 386, 0
	NPCMsg msg_1056_SC07_00038
	WaitButton
	WaitCry
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_027:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_CheckPokemonInParty 0x262 args [386, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0B19
	// TODO Diamond ScrCmd_SetDeoxysForm 0x263 args [1]: no HeartGold mapping yet
	PlayCry 386, 0
	NPCMsg msg_1056_SC07_00039
	WaitButton
	WaitCry
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_028:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_CheckPokemonInParty 0x262 args [386, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0B19
	// TODO Diamond ScrCmd_SetDeoxysForm 0x263 args [0]: no HeartGold mapping yet
	PlayCry 386, 0
	NPCMsg msg_1056_SC07_00040
	WaitButton
	WaitCry
	CloseMsg
	ReleaseAll
	End

_0B19:
	NPCMsg msg_1056_SC07_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07_029:
	LockAll
	ApplyMovement 6, mv_SC07_0B88
	WaitMovement
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0B76
	CompareVarToValue 0x8004, 1
	CallIf 1, _0B7E
	CloseMsg
	ApplyMovement 6, mv_SC07_0B9C
	WaitMovement
	HidePerson 6
	Call _00A7
	ClearFlag FLAG_SINNOH_454
	ShowPerson 6
	SetVar VAR_SINNOH_411A, 2
	ReleaseAll
	ReleaseAll
	End

_0B76:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00000
	Return

_0B7E:
	BufferPlayersName 0
	NPCMsg msg_1056_SC07_00001
	Return

	.balign 4, 0
mv_SC07_0214:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC07_0220:
	.short 14, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC07_022C:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC07_0234:
	.short 15, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC07_0240:
	.short 15, 2
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC07_024C:
	.short 15, 1
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC07_0258:
	.short 14, 1
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC07_0264:
	.short 63, 2
	.short 35, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0274:
	.short 63, 2
	.short 34, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_05B4:
	.short 13, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC07_05C0:
	.short 13, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC07_05CC:
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC07_0624:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC07_062C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0634:
	.short 14, 3
	.short 13, 10
	EndMovement

	.balign 4, 0
mv_SC07_0640:
	.short 12, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC07_064C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC07_0654:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC07_067C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0684:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC07_068C:
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC07_0698:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC07_06A0:
	.short 19, 4
	.short 16, 4
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SC07_06B0:
	.short 19, 4
	.short 16, 6
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SC07_07E4:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC07_07EC:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC07_07F8:
	.short 17, 1
	.short 34, 1
	.short 63, 2
	.short 12, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC07_0810:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SC07_0938:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC07_0940:
	.short 19, 1
	.short 17, 1
	.short 19, 1
	.short 17, 9
	EndMovement

	.balign 4, 0
mv_SC07_0954:
	.short 17, 1
	.short 19, 2
	.short 17, 9
	EndMovement

	.balign 4, 0
mv_SC07_0964:
	.short 63, 1
	.short 35, 1
	.short 63, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0978:
	.short 63, 4
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0984:
	.short 63, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC07_0B88:
	.short 32, 1
	.short 75, 1
	.short 15, 2
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SC07_0B9C:
	.short 13, 9
	EndMovement

scr_seq_SC07_030:
	SetVar VAR_SPECIAL_x8008, 316
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SC07_031:
	SetVar VAR_SPECIAL_x8008, 51
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SC07_032:
	SetVar VAR_SPECIAL_x8008, 463
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
