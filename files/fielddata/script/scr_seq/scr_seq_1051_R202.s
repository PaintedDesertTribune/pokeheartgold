#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R202.h"
#include "msgdata/msg/msg_0872_R202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R202_000
	ScrDef scr_seq_R202_001
	ScrDef scr_seq_R202_002
	ScrDef scr_seq_R202_003
	ScrDef scr_seq_R202_004
	ScrDef scr_seq_R202_005
	ScrDefEnd

scr_seq_R202_000:
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _003A
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0042
	End

_003A:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_0042:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_R202_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0872_R202_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R202_002:
	DirectionSignpost msg_0872_R202_00011, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R202_003:
	DirectionSignpost msg_0872_R202_00012, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R202_004:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0872_R202_00013, 0x800C
	CallStd std_signpost
	End

scr_seq_R202_005:
	LockAll
	ApplyMovement 3, mv_R202_039C
	ApplyMovement obj_player, mv_R202_0478
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 825
	GoToIf 1, _00FD
	CompareVarToValue 0x8005, 826
	GoToIf 1, _010D
	CompareVarToValue 0x8005, 827
	GoToIf 1, _011D
	CompareVarToValue 0x8005, 828
	GoToIf 1, _012D
	CompareVarToValue 0x8005, 829
	GoToIf 1, _013D
	End

_00FD:
	ApplyMovement 3, mv_R202_03AC
	WaitMovement
	GoTo _014D

_010D:
	ApplyMovement 3, mv_R202_03BC
	WaitMovement
	GoTo _014D

_011D:
	ApplyMovement 3, mv_R202_03CC
	WaitMovement
	GoTo _014D

_012D:
	ApplyMovement 3, mv_R202_03D8
	WaitMovement
	GoTo _014D

_013D:
	ApplyMovement 3, mv_R202_03E8
	WaitMovement
	GoTo _014D

_014D:
	CheckFlag FLAG_SINNOH_143
	GoToIf 0, _0255
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0178
	CompareVarToValue 0x800C, 1
	GoToIf 1, _018B
	End

_0178:
	CallStd 2040 /* TODO Diamond std script */
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0872_R202_00002
	GoTo _019E

_018B:
	CallStd 2040 /* TODO Diamond std script */
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0872_R202_00007
	GoTo _019E

_019E:
	CloseMsg
	ApplyMovement 3, mv_R202_0460
	ApplyMovement obj_player, mv_R202_0494
	WaitMovement
	// TODO Diamond ScrCmd_CatchTutorial 0x126 args []: no HeartGold mapping yet
	ApplyMovement 3, mv_R202_0468
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01DE
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01EA
	End

_01DE:
	BufferPlayersName 0
	NPCMsg msg_0872_R202_00003
	GoTo _01F6

_01EA:
	BufferPlayersName 0
	NPCMsg msg_0872_R202_00008
	GoTo _01F6

_01F6:
	SetVar 0x8004, 4
	SetVar 0x8005, 5
	CallStd std_obtain_item_verbose
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0226
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0232
	End

_0226:
	BufferPlayersName 0
	NPCMsg msg_0872_R202_00004
	GoTo _023B

_0232:
	NPCMsg msg_0872_R202_00009
	GoTo _023B

_023B:
	CloseMsg
	ApplyMovement 3, mv_R202_0470
	WaitMovement
	HidePerson 3
	SetVar VAR_SINNOH_4087, 1
	ReleaseAll
	End

_0255:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0275
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02A1
	End

_0275:
	BufferFriendsName 0
	BufferPlayersName 1
	CheckFlag FLAG_SINNOH_277
	CallIf 0, _0297
	CheckFlag FLAG_SINNOH_277
	CallIf 1, _029C
	GoTo _02CD

_0297:
	NPCMsg msg_0872_R202_00000
	Return

_029C:
	NPCMsg msg_0872_R202_00001
	Return

_02A1:
	BufferFriendsName 0
	BufferPlayersName 1
	CheckFlag FLAG_SINNOH_277
	CallIf 0, _02C3
	CheckFlag FLAG_SINNOH_277
	CallIf 1, _02C8
	GoTo _02CD

_02C3:
	NPCMsg msg_0872_R202_00005
	Return

_02C8:
	NPCMsg msg_0872_R202_00006
	Return

_02CD:
	CloseMsg
	CompareVarToValue 0x8005, 825
	GoToIf 1, _0312
	CompareVarToValue 0x8005, 826
	GoToIf 1, _032A
	CompareVarToValue 0x8005, 827
	GoToIf 1, _0342
	CompareVarToValue 0x8005, 828
	GoToIf 1, _035A
	CompareVarToValue 0x8005, 829
	GoToIf 1, _0372
	End

_0312:
	ApplyMovement 3, mv_R202_03F8
	ApplyMovement obj_player, mv_R202_0484
	WaitMovement
	GoTo _038A

_032A:
	ApplyMovement 3, mv_R202_040C
	ApplyMovement obj_player, mv_R202_0484
	WaitMovement
	GoTo _038A

_0342:
	ApplyMovement 3, mv_R202_0420
	ApplyMovement obj_player, mv_R202_0484
	WaitMovement
	GoTo _038A

_035A:
	ApplyMovement 3, mv_R202_0430
	ApplyMovement obj_player, mv_R202_0484
	WaitMovement
	GoTo _038A

_0372:
	ApplyMovement 3, mv_R202_0444
	ApplyMovement obj_player, mv_R202_0484
	WaitMovement
	GoTo _038A

_038A:
	ApplyMovement 3, mv_R202_0458
	WaitMovement
	SetFlag FLAG_SINNOH_277
	ReleaseAll
	End

	.balign 4, 0
mv_R202_039C:
	.short 35, 1
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_R202_03AC:
	.short 15, 4
	.short 12, 2
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R202_03BC:
	.short 15, 4
	.short 12, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R202_03CC:
	.short 15, 4
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R202_03D8:
	.short 15, 4
	.short 13, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R202_03E8:
	.short 15, 4
	.short 13, 2
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_R202_03F8:
	.short 15, 1
	.short 14, 4
	.short 14, 2
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_R202_040C:
	.short 15, 1
	.short 14, 4
	.short 14, 2
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_R202_0420:
	.short 15, 1
	.short 14, 4
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_R202_0430:
	.short 15, 1
	.short 14, 4
	.short 14, 2
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_R202_0444:
	.short 15, 1
	.short 14, 4
	.short 14, 2
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_R202_0458:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_R202_0460:
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_R202_0468:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_R202_0470:
	.short 14, 12
	EndMovement

	.balign 4, 0
mv_R202_0478:
	.short 63, 1
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_R202_0484:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_R202_0494:
	.short 14, 2
	EndMovement

	.balign 4, 0
