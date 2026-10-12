#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04.h"
#include "msgdata/msg/msg_0944_C04.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04_000
	ScrDef scr_seq_C04_001
	ScrDef scr_seq_C04_002
	ScrDef scr_seq_C04_003
	ScrDef scr_seq_C04_004
	ScrDef scr_seq_C04_005
	ScrDef scr_seq_C04_006
	ScrDef scr_seq_C04_007
	ScrDef scr_seq_C04_008
	ScrDef scr_seq_C04_009
	ScrDef scr_seq_C04_010
	ScrDef scr_seq_C04_011
	ScrDef scr_seq_C04_012
	ScrDef scr_seq_C04_013
	ScrDef scr_seq_C04_014
	ScrDef scr_seq_C04_015
	ScrDef scr_seq_C04_016
	ScrDef scr_seq_C04_017
	ScrDef scr_seq_C04_018
	ScrDef scr_seq_C04_019
	ScrDef scr_seq_C04_020
	ScrDef scr_seq_C04_021
	ScrDef scr_seq_C04_022
	ScrDefEnd

scr_seq_C04_020:
	HasItem 450, 1, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0090
	HasItem 428, 1, 0x4000
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0090
	SetVar VAR_SINNOH_4114, 0
	End

_0090:
	SetVar VAR_SINNOH_4114, 1
	End

scr_seq_C04_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_129
	GoToIf 1, _00DC
	NPCMsg msg_0944_C04_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DC:
	NPCMsg msg_0944_C04_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_129
	GoToIf 1, _0105
	NPCMsg msg_0944_C04_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0105:
	NPCMsg msg_0944_C04_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_011:
	DirectionSignpost msg_0944_C04_00021, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C04_012:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0944_C04_00022, 0x800C
	CallStd std_signpost
	End

scr_seq_C04_013:
	DirectionSignpost msg_0944_C04_00023, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C04_014:
	DirectionSignpost msg_0944_C04_00024, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C04_015:
	DirectionSignpost msg_0944_C04_00025, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C04_016:
	DirectionSignpost msg_0944_C04_00026, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C04_000:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 523
	GoToIf 1, _01C9
	CompareVarToValue 0x8005, 524
	GoToIf 1, _01D9
	CompareVarToValue 0x8005, 525
	GoToIf 1, _01E9
	End

_01C9:
	MovePerson 12, 312, 523
	GoTo _01F9

_01D9:
	MovePerson 12, 312, 524
	GoTo _01F9

_01E9:
	MovePerson 12, 312, 525
	GoTo _01F9

_01F9:
	ClearFlag FLAG_SINNOH_414
	ShowPerson 12
	ApplyMovement 12, mv_C04_02C0
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0944_C04_00000
	CloseMsg
	ApplyMovement 12, mv_C04_02D0
	WaitMovement
	NPCMsg msg_0944_C04_00001
	SetVar 0x8004, 420
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	NPCMsg msg_0944_C04_00002
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 523
	GoToIf 1, _0264
	CompareVarToValue 0x8005, 524
	GoToIf 1, _027E
	CompareVarToValue 0x8005, 525
	GoToIf 1, _0298
	End

_0264:
	ApplyMovement 12, mv_C04_02E0
	ApplyMovement obj_player, mv_C04_0300
	WaitMovement
	GoTo _02B2

_027E:
	ApplyMovement 12, mv_C04_02E0
	ApplyMovement obj_player, mv_C04_0300
	WaitMovement
	GoTo _02B2

_0298:
	ApplyMovement 12, mv_C04_02F0
	ApplyMovement obj_player, mv_C04_0314
	WaitMovement
	GoTo _02B2

_02B2:
	HidePerson 12
	SetVar VAR_SINNOH_407A, 1
	ReleaseAll
	End

scr_seq_C04_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_017:
	// TODO Diamond ScrCmd_GetGameVersion 0x246 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 10
	GoToIf 1, _03BC
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0944_C04_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03BC:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0944_C04_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_018:
	CompareVarToValue VAR_SINNOH_4114, 0
	GoToIf 1, _03ED
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03ED:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0944_C04_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04_019:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 303
	CallIf 1, _04A7
	CompareVarToValue 0x8004, 304
	CallIf 1, _04B3
	CompareVarToValue 0x8004, 305
	CallIf 1, _04BF
	CompareVarToValue 0x8004, 306
	CallIf 1, _04CB
	CompareVarToValue 0x8004, 307
	CallIf 1, _04D7
	ApplyMovement obj_player, mv_C04_05B0
	WaitMovement
	NPCMsg msg_0944_C04_00015
	CloseMsg
	CompareVarToValue 0x8004, 303
	CallIf 1, _04E3
	CompareVarToValue 0x8004, 304
	CallIf 1, _04E5
	CompareVarToValue 0x8004, 305
	CallIf 1, _04F1
	CompareVarToValue 0x8004, 306
	CallIf 1, _04FD
	CompareVarToValue 0x8004, 307
	CallIf 1, _0509
	ApplyMovement obj_player, mv_C04_05B8
	WaitMovement
	ReleaseAll
	End

_04A7:
	ApplyMovement 28, mv_C04_0518
	WaitMovement
	Return

_04B3:
	ApplyMovement 28, mv_C04_0528
	WaitMovement
	Return

_04BF:
	ApplyMovement 28, mv_C04_053C
	WaitMovement
	Return

_04CB:
	ApplyMovement 28, mv_C04_0550
	WaitMovement
	Return

_04D7:
	ApplyMovement 28, mv_C04_0564
	WaitMovement
	Return

_04E3:
	Return

_04E5:
	ApplyMovement 28, mv_C04_0580
	WaitMovement
	Return

_04F1:
	ApplyMovement 28, mv_C04_058C
	WaitMovement
	Return

_04FD:
	ApplyMovement 28, mv_C04_0598
	WaitMovement
	Return

_0509:
	ApplyMovement 28, mv_C04_05A4
	WaitMovement
	Return

scr_seq_C04_021:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_130
	GoToIf 0, _05F5
	CompareVarToValue VAR_SINNOH_408C, 1
	GoToIf 4, _05F5
	NPCMsg msg_0944_C04_00019
	WaitButton
	CloseMsg
	ApplyMovement 30, mv_C04_06E8
	WaitMovement
	ReleaseAll
	End

_05F5:
	NPCMsg msg_0944_C04_00020
	WaitButton
	CloseMsg
	ApplyMovement 30, mv_C04_06E8
	WaitMovement
	ReleaseAll
	End

scr_seq_C04_022:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 532
	CallIf 1, _0673
	CompareVarToValue 0x8005, 533
	CallIf 1, _067F
	CompareVarToValue 0x8005, 534
	CallIf 1, _068B
	ApplyMovement obj_player, mv_C04_06E0
	WaitMovement
	NPCMsg msg_0944_C04_00018
	CloseMsg
	CompareVarToValue 0x8005, 532
	CallIf 1, _0697
	CompareVarToValue 0x8005, 533
	CallIf 1, _06AB
	CompareVarToValue 0x8005, 534
	CallIf 1, _06BF
	ReleaseAll
	End

_0673:
	ApplyMovement 30, mv_C04_06F0
	WaitMovement
	Return

_067F:
	ApplyMovement 30, mv_C04_06FC
	WaitMovement
	Return

_068B:
	ApplyMovement 30, mv_C04_070C
	WaitMovement
	Return

_0697:
	ApplyMovement 30, mv_C04_071C
	ApplyMovement obj_player, mv_C04_06D4
	WaitMovement
	Return

_06AB:
	ApplyMovement 30, mv_C04_072C
	ApplyMovement obj_player, mv_C04_06D4
	WaitMovement
	Return

_06BF:
	ApplyMovement 30, mv_C04_073C
	ApplyMovement obj_player, mv_C04_06D4
	WaitMovement
	Return

	.balign 4, 0
mv_C04_02C0:
	.short 14, 2
	.short 75, 1
	.short 14, 6
	EndMovement

	.balign 4, 0
mv_C04_02D0:
	.short 35, 1
	.short 63, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C04_02E0:
	.short 13, 1
	.short 14, 5
	.short 13, 8
	EndMovement

	.balign 4, 0
mv_C04_02F0:
	.short 12, 1
	.short 14, 5
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_C04_0300:
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C04_0314:
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C04_0518:
	.short 39, 1
	.short 75, 1
	.short 62, 1
	EndMovement

	.balign 4, 0
mv_C04_0528:
	.short 39, 1
	.short 75, 1
	.short 62, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_C04_053C:
	.short 39, 1
	.short 75, 1
	.short 62, 1
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_C04_0550:
	.short 39, 1
	.short 75, 1
	.short 62, 1
	.short 15, 3
	EndMovement

	.balign 4, 0
mv_C04_0564:
	.short 39, 1
	.short 75, 1
	.short 62, 1
	.short 15, 4
	EndMovement

	.balign 4, 0
mv_C04_0580:
	.short 14, 1
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_C04_058C:
	.short 14, 2
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_C04_0598:
	.short 14, 3
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_C04_05A4:
	.short 14, 4
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_C04_05B0:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C04_05B8:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_C04_06D4:
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C04_06E0:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_C04_06E8:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_C04_06F0:
	.short 1, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_C04_06FC:
	.short 1, 1
	.short 75, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_C04_070C:
	.short 1, 1
	.short 75, 1
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_C04_071C:
	.short 13, 1
	.short 12, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_C04_072C:
	.short 13, 1
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_C04_073C:
	.short 13, 1
	.short 12, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
