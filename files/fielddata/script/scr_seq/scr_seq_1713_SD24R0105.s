#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD24R0105.h"
#include "msgdata/msg/msg_1203_SD24R0105.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD24R0105_000
	ScrDef scr_seq_SD24R0105_001
	ScrDef scr_seq_SD24R0105_002
	ScrDef scr_seq_SD24R0105_003
	ScrDef scr_seq_SD24R0105_004
	ScrDef scr_seq_SD24R0105_005
	ScrDef scr_seq_SD24R0105_006
	ScrDef scr_seq_SD24R0105_007
	ScrDef scr_seq_SD24R0105_008
	ScrDef scr_seq_SD24R0105_009
	ScrDef scr_seq_SD24R0105_010
	ScrDef scr_seq_SD24R0105_011
	ScrDef scr_seq_SD24R0105_012
	ScrDefEnd

scr_seq_SD24R0105_000:
	// Diamond ScrCmd_Unk025B dropped: Great Marsh observatory binoculars
	CheckFlag FLAG_SINNOH_229
	GoToIf 0, _0035
	End

_0035:
	CompareVarToValue VAR_SINNOH_4092, 2
	GoToIf 1, _004A
	SetVar VAR_SINNOH_4092, 0
	End

_004A:
	MovePerson 4, 19, 41
	SetObjectMovementType 4, 17
	SetObjectFacing 4, 3
	End

scr_seq_SD24R0105_001:
	// Diamond ScrCmd_Unk025C dropped: Great Marsh observatory binoculars
	End

scr_seq_SD24R0105_002:
	LockAll
	PlayerOnBikeSet 0
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 2
	CallIf 1, _00D1
	CompareVarToValue 0x8005, 3
	CallIf 1, _00DD
	BufferPlayersName 0
	CheckFlag FLAG_SINNOH_225
	CallIf 0, _00E9
	CheckFlag FLAG_SINNOH_225
	CallIf 1, _00EE
	BufferPlayersName 0
	PlaySE SEQ_ME_HYOUKA2
	NPCMsg msg_1203_SD24R0105_00001
	WaitSE SEQ_ME_HYOUKA2
	SetFlag FLAG_SINNOH_225
	SetVar VAR_SINNOH_4092, 1
	NPCMsg msg_1203_SD24R0105_00002
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_403F, 609
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 4, 48
	ReleaseAll
	End

_00D1:
	ApplyMovement 4, mv_SD24R0105_0170
	WaitMovement
	Return

_00DD:
	ApplyMovement 4, mv_SD24R0105_0184
	WaitMovement
	Return

_00E9:
	NPCMsg msg_1203_SD24R0105_00000
	Return

_00EE:
	NPCMsg msg_1203_SD24R0105_00003
	Return

scr_seq_SD24R0105_003:
	LockAll
	ApplyMovement obj_player, mv_SD24R0105_0158
	ApplyMovement 4, mv_SD24R0105_0160
	WaitMovement
	NPCMsg msg_1203_SD24R0105_00004
	CloseMsg
	SetVar VAR_SINNOH_4092, 0
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 4, 16
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 2
	CallIf 1, _013E
	CompareVarToValue 0x8005, 3
	CallIf 1, _014A
	ReleaseAll
	End

_013E:
	ApplyMovement 4, mv_SD24R0105_0190
	WaitMovement
	Return

_014A:
	ApplyMovement 4, mv_SD24R0105_01A0
	WaitMovement
	Return

scr_seq_SD24R0105_004:
	End

scr_seq_SD24R0105_008:
	LockAll
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 4, 16
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 40
	CallIf 1, _0291
	CompareVarToValue 0x8005, 41
	CallIf 1, _02A5
	NPCMsg msg_1203_SD24R0105_00005
	CloseMsg
	ApplyMovement 5, mv_SD24R0105_0380
	WaitMovement
	NPCMsg msg_1203_SD24R0105_00006
	CloseMsg
	ApplyMovement 6, mv_SD24R0105_0388
	WaitMovement
	NPCMsg msg_1203_SD24R0105_00007
	CloseMsg
	ApplyMovement 4, mv_SD24R0105_0408
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_1203_SD24R0105_00008
	CloseMsg
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_33, TRAINER_SINNOH_GALACTIC_GRUNT_34, 0, 0
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0377
	ApplyMovement 5, mv_SD24R0105_0390
	WaitMovement
	NPCMsg msg_1203_SD24R0105_00009
	CloseMsg
	ApplyMovement 6, mv_SD24R0105_0398
	WaitMovement
	NPCMsg msg_1203_SD24R0105_00010
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 5
	HidePerson 6
	FadeScreen 6, 1, 1, 0
	WaitFade
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 40
	CallIf 1, _02D1
	CompareVarToValue 0x8005, 41
	CallIf 1, _02E5
	Call _02F9
	// TODO Diamond ScrCmd_Unk02B6 0x2b6 args [4, 1]: no HeartGold mapping yet
	ReleaseAll
	End

_0291:
	ApplyMovement 4, mv_SD24R0105_03D0
	ApplyMovement obj_player, mv_SD24R0105_0430
	WaitMovement
	Return

_02A5:
	ApplyMovement 4, mv_SD24R0105_03E0
	ApplyMovement obj_player, mv_SD24R0105_0448
	WaitMovement
	Return

_02D1:
	ApplyMovement 4, mv_SD24R0105_0410
	ApplyMovement obj_player, mv_SD24R0105_0420
	WaitMovement
	Return

_02E5:
	ApplyMovement 4, mv_SD24R0105_0418
	ApplyMovement obj_player, mv_SD24R0105_0428
	WaitMovement
	Return

_02F9:
	NPCMsg msg_1203_SD24R0105_00011
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _031C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0360
	End

_031C:
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _034D
	NPCMsg msg_1203_SD24R0105_00012
	// TODO Diamond ScrCmd_GiveEgg 0x097 args [447, 10]: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_515
	ClearFlag FLAG_SINNOH_226
	Call _036B
	NPCMsg msg_1203_SD24R0105_00015
	WaitButton
	CloseMsg
	Return

_034D:
	SetFlag FLAG_SINNOH_226
	SetVar VAR_SINNOH_4092, 2
	NPCMsg msg_1203_SD24R0105_00013
	WaitButton
	CloseMsg
	Return

_0360:
	NPCMsg msg_1203_SD24R0105_00014
	GoTo _02F9

_036B:
	SetFlag FLAG_SINNOH_229
	SetVar VAR_SINNOH_4092, 2
	Return

_0377:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD24R0105_005:
	End

scr_seq_SD24R0105_006:
	End

scr_seq_SD24R0105_007:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_226
	GoToIf 1, _0500
	CompareVarToValue VAR_SINNOH_4092, 2
	GoToIf 1, _050F
	CompareVarToValue VAR_SINNOH_40E3, 4
	GoToIf 4, _04E7
	CompareVarToValue VAR_SINNOH_40E3, 3
	GoToIf 1, _04DC
	CompareVarToValue VAR_SINNOH_40E3, 2
	GoToIf 1, _04D1
	CompareVarToValue VAR_SINNOH_40E3, 1
	GoToIf 1, _04C6
	BufferPlayersName 0
	NPCMsg msg_1203_SD24R0105_00018
	GoTo _04F2

_04C6:
	NPCMsg msg_1203_SD24R0105_00019
	GoTo _04F2

_04D1:
	NPCMsg msg_1203_SD24R0105_00020
	GoTo _04F2

_04DC:
	NPCMsg msg_1203_SD24R0105_00021
	GoTo _04F2

_04E7:
	NPCMsg msg_1203_SD24R0105_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04F2:
	AddVar VAR_SINNOH_40E3, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0500:
	Call _02F9
	// TODO Diamond ScrCmd_Unk02B6 0x2b6 args [4, 1]: no HeartGold mapping yet
	ReleaseAll
	End

_050F:
	NPCMsg msg_1203_SD24R0105_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD24R0105_0158:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0160:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0170:
	.short 35, 1
	.short 75, 1
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0184:
	.short 35, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0190:
	.short 14, 1
	.short 13, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_01A0:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0380:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0388:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0390:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0398:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_03D0:
	.short 34, 1
	.short 13, 1
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_SD24R0105_03E0:
	.short 34, 1
	.short 12, 1
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_SD24R0105_0408:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0410:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0418:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0420:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0428:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0430:
	.short 63, 2
	.short 33, 1
	.short 63, 1
	.short 61, 1
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD24R0105_0448:
	.short 63, 2
	.short 32, 1
	.short 63, 1
	.short 61, 1
	.short 14, 1
	EndMovement

scr_seq_SD24R0105_009:
	SetVar VAR_SPECIAL_x8008, 242
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD24R0105_010:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD24R0105_011:
	SetVar VAR_SPECIAL_x8008, 24
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD24R0105_012:
	SetVar VAR_SPECIAL_x8008, 45
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
