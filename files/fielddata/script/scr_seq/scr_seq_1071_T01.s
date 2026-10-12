#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T01.h"
#include "msgdata/msg/msg_0882_T01.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T01_000
	ScrDef scr_seq_T01_001
	ScrDef scr_seq_T01_002
	ScrDef scr_seq_T01_003
	ScrDef scr_seq_T01_004
	ScrDef scr_seq_T01_005
	ScrDef scr_seq_T01_006
	ScrDef scr_seq_T01_007
	ScrDef scr_seq_T01_008
	ScrDefEnd

scr_seq_T01_000:
	CompareVarToValue VAR_SINNOH_40F4, 1
	CallIf 1, _004F
	CompareVarToValue VAR_SINNOH_40A4, 4
	CallIf 1, _005F
	CompareVarToValue VAR_SINNOH_40A4, 6
	CallIf 1, _0057
	End

_004F:
	SetVar VAR_SINNOH_40F4, 2
	Return

_0057:
	SetVar VAR_SINNOH_40A4, 7
	Return

_005F:
	SetVar VAR_SINNOH_40A4, 5
	Return

scr_seq_T01_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _00A3
	CompareVarToValue VAR_SINNOH_4095, 1
	GoToIf 4, _00AE
	CheckFlag FLAG_SINNOH_234
	GoToIf 1, _00BC
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0882_T01_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A3:
	NPCMsg msg_0882_T01_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00AE:
	BufferRivalsName 0
	NPCMsg msg_0882_T01_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BC:
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0882_T01_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01_003:
	LockAll
	ApplyMovement 3, mv_T01_03B0
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 108
	GoToIf 1, _0140
	CompareVarToValue 0x8004, 109
	GoToIf 1, _0158
	CompareVarToValue 0x8004, 110
	GoToIf 1, _0170
	CompareVarToValue 0x8004, 111
	GoToIf 1, _0188
	CompareVarToValue 0x8004, 112
	GoToIf 1, _01A0
	CompareVarToValue 0x8004, 113
	GoToIf 1, _01B8
	CompareVarToValue 0x8004, 114
	GoToIf 1, _01D0
	GoTo _01E8

_0140:
	ApplyMovement obj_player, mv_T01_02F0
	ApplyMovement 3, mv_T01_03C4
	WaitMovement
	GoTo _0200

_0158:
	ApplyMovement obj_player, mv_T01_0308
	ApplyMovement 3, mv_T01_03E0
	WaitMovement
	GoTo _0200

_0170:
	ApplyMovement obj_player, mv_T01_0320
	ApplyMovement 3, mv_T01_03F4
	WaitMovement
	GoTo _0200

_0188:
	ApplyMovement obj_player, mv_T01_0338
	ApplyMovement 3, mv_T01_0408
	WaitMovement
	GoTo _0200

_01A0:
	ApplyMovement obj_player, mv_T01_0350
	ApplyMovement 3, mv_T01_041C
	WaitMovement
	GoTo _0200

_01B8:
	ApplyMovement obj_player, mv_T01_0368
	ApplyMovement 3, mv_T01_0430
	WaitMovement
	GoTo _0200

_01D0:
	ApplyMovement obj_player, mv_T01_0380
	ApplyMovement 3, mv_T01_0444
	WaitMovement
	GoTo _0200

_01E8:
	ApplyMovement obj_player, mv_T01_0398
	ApplyMovement 3, mv_T01_0458
	WaitMovement
	GoTo _0200

_0200:
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0882_T01_00003
	CloseMsg
	CompareVarToValue 0x8004, 108
	GoToIf 1, _026C
	CompareVarToValue 0x8004, 109
	GoToIf 1, _027C
	CompareVarToValue 0x8004, 110
	GoToIf 1, _028C
	CompareVarToValue 0x8004, 111
	GoToIf 1, _029C
	CompareVarToValue 0x8004, 112
	GoToIf 1, _02AC
	CompareVarToValue 0x8004, 113
	GoToIf 1, _02BC
	CompareVarToValue 0x8004, 114
	GoToIf 1, _02CC
	GoTo _02DC

_026C:
	ApplyMovement 3, mv_T01_046C
	WaitMovement
	GoTo _02EC

_027C:
	ApplyMovement 3, mv_T01_047C
	WaitMovement
	GoTo _02EC

_028C:
	ApplyMovement 3, mv_T01_0488
	WaitMovement
	GoTo _02EC

_029C:
	ApplyMovement 3, mv_T01_0494
	WaitMovement
	GoTo _02EC

_02AC:
	ApplyMovement 3, mv_T01_04A0
	WaitMovement
	GoTo _02EC

_02BC:
	ApplyMovement 3, mv_T01_04AC
	WaitMovement
	GoTo _02EC

_02CC:
	ApplyMovement 3, mv_T01_04B8
	WaitMovement
	GoTo _02EC

_02DC:
	ApplyMovement 3, mv_T01_04C4
	WaitMovement
	GoTo _02EC

_02EC:
	ReleaseAll
	End

scr_seq_T01_001:
	LockAll
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	ClearFlag FLAG_SINNOH_402
	ShowPerson 2
	ApplyMovement 2, mv_T01_05A4
	ApplyMovement obj_player, mv_T01_0588
	WaitMovement
	PlayFanfare 1538
	NPCMsg msg_0882_T01_00000
	Wait 30, 0x800C
	CallStd std_play_rival_intro_music
	ApplyMovement 2, mv_T01_059C
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0882_T01_00001
	CloseMsg
	ApplyMovement obj_player, mv_T01_0570
	ApplyMovement 2, mv_T01_05B0
	WaitMovement
	Wait 15, 0x800C
	BufferRivalsName 0
	NPCMsg msg_0882_T01_00002
	CloseMsg
	ApplyMovement 2, mv_T01_05C8
	WaitMovement
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	HidePerson 2
	CallStd 2043 /* TODO Diamond std script */
	SetVar VAR_SINNOH_4070, 1
	SetVar VAR_SINNOH_40E6, 1
	ReleaseAll
	End

scr_seq_T01_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0882_T01_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _0612
	CompareVarToValue VAR_SINNOH_4095, 1
	GoToIf 4, _061D
	NPCMsg msg_0882_T01_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0612:
	NPCMsg msg_0882_T01_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_061D:
	NPCMsg msg_0882_T01_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T01_006:
	DirectionSignpost msg_0882_T01_00012, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_T01_007:
	BufferPlayersName 0
	DirectionSignpost msg_0882_T01_00013, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_T01_008:
	BufferRivalsName 0
	DirectionSignpost msg_0882_T01_00014, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_T01_02F0:
	.short 62, 6
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0308:
	.short 62, 5
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0320:
	.short 62, 6
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0338:
	.short 62, 7
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0350:
	.short 62, 8
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0368:
	.short 62, 9
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0380:
	.short 62, 10
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_0398:
	.short 62, 11
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_03B0:
	.short 36, 1
	.short 75, 1
	.short 63, 1
	.short 62, 1
	EndMovement

	.balign 4, 0
mv_T01_03C4:
	.short 16, 1
	.short 19, 1
	.short 16, 2
	.short 18, 1
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_03E0:
	.short 16, 3
	.short 19, 1
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_03F4:
	.short 16, 3
	.short 19, 2
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_0408:
	.short 16, 3
	.short 19, 3
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_041C:
	.short 16, 3
	.short 19, 4
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_0430:
	.short 16, 3
	.short 19, 5
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_0444:
	.short 16, 3
	.short 19, 6
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_0458:
	.short 16, 3
	.short 19, 7
	.short 37, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_T01_046C:
	.short 15, 1
	.short 13, 2
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_T01_047C:
	.short 14, 1
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_0488:
	.short 14, 2
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_0494:
	.short 14, 3
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_04A0:
	.short 14, 4
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_04AC:
	.short 14, 5
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_04B8:
	.short 14, 6
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_04C4:
	.short 14, 7
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_T01_0570:
	.short 63, 1
	.short 62, 1
	.short 35, 1
	.short 63, 5
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T01_0588:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_T01_059C:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_T01_05A4:
	.short 17, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_T01_05B0:
	.short 19, 4
	.short 75, 1
	.short 63, 1
	.short 18, 4
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_T01_05C8:
	.short 12, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
