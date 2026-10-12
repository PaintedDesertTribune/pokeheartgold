#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C03.h"
#include "msgdata/msg/msg_0894_C03.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C03_000
	ScrDef scr_seq_C03_001
	ScrDef scr_seq_C03_002
	ScrDef scr_seq_C03_003
	ScrDef scr_seq_C03_004
	ScrDef scr_seq_C03_005
	ScrDef scr_seq_C03_006
	ScrDef scr_seq_C03_007
	ScrDef scr_seq_C03_008
	ScrDef scr_seq_C03_009
	ScrDef scr_seq_C03_010
	ScrDef scr_seq_C03_011
	ScrDef scr_seq_C03_012
	ScrDef scr_seq_C03_013
	ScrDef scr_seq_C03_014
	ScrDef scr_seq_C03_015
	ScrDef scr_seq_C03_016
	ScrDef scr_seq_C03_017
	ScrDef scr_seq_C03_018
	ScrDefEnd

scr_seq_C03_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_138
	GoToIf 1, _0076
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0894_C03_00000
	WaitButton
	SetFlag FLAG_SINNOH_138
	CloseMsg
	ReleaseAll
	End

_0076:
	BufferRivalsName 0
	NPCMsg msg_0894_C03_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00B5
	CheckFlag FLAG_SINNOH_122
	GoToIf 1, _00C0
	NPCMsg msg_0894_C03_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B5:
	NPCMsg msg_0894_C03_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C0:
	NPCMsg msg_0894_C03_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_003:
	LockAll
	ClearFlag FLAG_SINNOH_410
	SetObjectMovementType 3, 16
	SetObjectFacing 3, 2
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 748
	GoToIf 1, _0112
	CompareVarToValue 0x8005, 749
	GoToIf 1, _0138
	CompareVarToValue 0x8005, 750
	GoToIf 1, _015E
	GoTo _0184

_0112:
	MovePerson 3, 271, 748
	ShowPerson 3
	ApplyMovement obj_player, mv_C03_0294
	ApplyMovement 3, mv_C03_02AC
	WaitMovement
	GoTo _01AA

_0138:
	MovePerson 3, 271, 749
	ShowPerson 3
	ApplyMovement obj_player, mv_C03_0294
	ApplyMovement 3, mv_C03_02AC
	WaitMovement
	GoTo _01AA

_015E:
	MovePerson 3, 271, 750
	ShowPerson 3
	ApplyMovement obj_player, mv_C03_0294
	ApplyMovement 3, mv_C03_02AC
	WaitMovement
	GoTo _01AA

_0184:
	MovePerson 3, 271, 751
	ShowPerson 3
	ApplyMovement obj_player, mv_C03_0294
	ApplyMovement 3, mv_C03_02AC
	WaitMovement
	GoTo _01AA

_01AA:
	PlayFanfare 1538
	NPCMsg msg_0894_C03_00002
	CloseMsg
	CallStd std_play_rival_intro_music
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0894_C03_00003
	CloseMsg
	ApplyMovement 3, mv_C03_0334
	WaitMovement
	NPCMsg msg_0894_C03_00004
	ApplyMovement 3, mv_C03_033C
	WaitMovement
	NPCMsg msg_0894_C03_00005
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 748
	GoToIf 1, _0213
	CompareVarToValue 0x8005, 749
	GoToIf 1, _022D
	CompareVarToValue 0x8005, 750
	GoToIf 1, _0247
	GoTo _0261

_0213:
	ApplyMovement obj_player, mv_C03_0304
	ApplyMovement 3, mv_C03_02B4
	WaitMovement
	GoTo _027B

_022D:
	ApplyMovement obj_player, mv_C03_0310
	ApplyMovement 3, mv_C03_02C4
	WaitMovement
	GoTo _027B

_0247:
	ApplyMovement obj_player, mv_C03_031C
	ApplyMovement 3, mv_C03_02DC
	WaitMovement
	GoTo _027B

_0261:
	ApplyMovement obj_player, mv_C03_0328
	ApplyMovement 3, mv_C03_02EC
	WaitMovement
	GoTo _027B

_027B:
	PlayFanfare 1539
	HidePerson 3
	CallStd 2043 /* TODO Diamond std script */
	SetVar VAR_SINNOH_4079, 3
	ReleaseAll
	End

scr_seq_C03_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_265
	GoToIf 1, _03B1
	NPCMsg msg_0894_C03_00021
	SetVar 0x8004, 26
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03BC
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_265
	GoTo _03B1

_03B1:
	NPCMsg msg_0894_C03_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03BC:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_002:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 748
	GoToIf 1, _0423
	CompareVarToValue 0x8005, 749
	GoToIf 1, _043D
	CompareVarToValue 0x8005, 750
	GoToIf 1, _0457
	GoTo _0471

_0423:
	ApplyMovement obj_player, mv_C03_0550
	ApplyMovement 4, mv_C03_05F8
	WaitMovement
	GoTo _048B

_043D:
	ApplyMovement obj_player, mv_C03_0550
	ApplyMovement 4, mv_C03_0600
	WaitMovement
	GoTo _048B

_0457:
	ApplyMovement obj_player, mv_C03_0550
	ApplyMovement 4, mv_C03_0608
	WaitMovement
	GoTo _048B

_0471:
	ApplyMovement obj_player, mv_C03_0550
	ApplyMovement 4, mv_C03_0610
	WaitMovement
	GoTo _048B

_048B:
	NPCMsg msg_0894_C03_00006
	CloseMsg
	CallStd 2048 /* TODO Diamond std script */
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 748
	GoToIf 1, _04D0
	CompareVarToValue 0x8005, 749
	GoToIf 1, _04EA
	CompareVarToValue 0x8005, 750
	GoToIf 1, _0504
	CompareVarToValue 0x8005, 751
	GoToIf 1, _051E
	End

_04D0:
	ApplyMovement obj_player, mv_C03_0558
	ApplyMovement 4, mv_C03_05A8
	WaitMovement
	GoTo _0538

_04EA:
	ApplyMovement obj_player, mv_C03_056C
	ApplyMovement 4, mv_C03_05BC
	WaitMovement
	GoTo _0538

_0504:
	ApplyMovement obj_player, mv_C03_0580
	ApplyMovement 4, mv_C03_05D0
	WaitMovement
	GoTo _0538

_051E:
	ApplyMovement obj_player, mv_C03_0594
	ApplyMovement 4, mv_C03_05E4
	WaitMovement
	GoTo _0538

_0538:
	NPCMsg msg_0894_C03_00007
	WaitButton
	CloseMsg
	CallStd 2049 /* TODO Diamond std script */
	SetVar VAR_SINNOH_4079, 1
	ReleaseAll
	End

scr_seq_C03_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_122
	GoToIf 1, _0649
	NPCMsg msg_0894_C03_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0649:
	NPCMsg msg_0894_C03_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0894_C03_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C03_014:
	DirectionSignpost msg_0894_C03_00028, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C03_015:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0894_C03_00029, 0x800C
	CallStd std_signpost
	End

scr_seq_C03_016:
	DirectionSignpost msg_0894_C03_00030, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C03_017:
	DirectionSignpost msg_0894_C03_00031, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_C03_018:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 66, 0
	NPCMsg msg_0894_C03_00027
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_C03_0294:
	.short 62, 8
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_C03_02AC:
	.short 18, 9
	EndMovement

	.balign 4, 0
mv_C03_02B4:
	.short 17, 1
	.short 18, 4
	.short 38, 1
	EndMovement

	.balign 4, 0
mv_C03_02C4:
	.short 17, 1
	.short 18, 3
	.short 16, 1
	.short 18, 1
	.short 38, 1
	EndMovement

	.balign 4, 0
mv_C03_02DC:
	.short 16, 1
	.short 18, 4
	.short 38, 1
	EndMovement

	.balign 4, 0
mv_C03_02EC:
	.short 16, 1
	.short 18, 3
	.short 16, 1
	.short 18, 1
	.short 38, 1
	EndMovement

	.balign 4, 0
mv_C03_0304:
	.short 33, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_0310:
	.short 33, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_031C:
	.short 32, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_0328:
	.short 32, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_0334:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_C03_033C:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_0550:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_C03_0558:
	.short 13, 1
	.short 15, 1
	.short 13, 10
	.short 15, 12
	EndMovement

	.balign 4, 0
mv_C03_056C:
	.short 13, 1
	.short 15, 1
	.short 13, 9
	.short 15, 12
	EndMovement

	.balign 4, 0
mv_C03_0580:
	.short 13, 1
	.short 15, 1
	.short 13, 8
	.short 15, 12
	EndMovement

	.balign 4, 0
mv_C03_0594:
	.short 13, 1
	.short 15, 1
	.short 13, 7
	.short 15, 12
	EndMovement

	.balign 4, 0
mv_C03_05A8:
	.short 15, 1
	.short 13, 10
	.short 15, 13
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_05BC:
	.short 15, 1
	.short 13, 9
	.short 15, 13
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_05D0:
	.short 15, 1
	.short 13, 8
	.short 15, 13
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_05E4:
	.short 15, 1
	.short 13, 7
	.short 15, 13
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_C03_05F8:
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_C03_0600:
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_C03_0608:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_C03_0610:
	.short 32, 1
	EndMovement

	.balign 4, 0
