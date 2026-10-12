#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR201.h"
#include "msgdata/msg/msg_0881_SR201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR201_000
	ScrDef scr_seq_SR201_001
	ScrDef scr_seq_SR201_002
	ScrDef scr_seq_SR201_003
	ScrDef scr_seq_SR201_004
	ScrDef scr_seq_SR201_005
	ScrDef scr_seq_SR201_006
	ScrDef scr_seq_SR201_007
	ScrDef scr_seq_SR201_008
	ScrDef scr_seq_SR201_009
	ScrDef scr_seq_SR201_010
	ScrDef scr_seq_SR201_011
	ScrDefEnd

scr_seq_SR201_000:
	CompareVarToValue VAR_SINNOH_4086, 2
	CallIf 1, _006F
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _005F
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0067
	End

_005F:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_0067:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

_006F:
	SetFlag FLAG_SINNOH_435
	Return

scr_seq_SR201_001:
	LockAll
	ApplyMovement 2, mv_SR201_0140
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 110
	GoToIf 1, _00D7
	CompareVarToValue 0x8004, 111
	GoToIf 1, _00E7
	CompareVarToValue 0x8004, 112
	GoToIf 1, _00F7
	CompareVarToValue 0x8004, 113
	GoToIf 1, _0107
	CompareVarToValue 0x8004, 114
	GoToIf 1, _0107
	CompareVarToValue 0x8004, 115
	GoToIf 1, _0107
	End

_00D7:
	ApplyMovement 2, mv_SR201_014C
	WaitMovement
	GoTo _0117

_00E7:
	ApplyMovement 2, mv_SR201_015C
	WaitMovement
	GoTo _0117

_00F7:
	ApplyMovement 2, mv_SR201_016C
	WaitMovement
	GoTo _0117

_0107:
	ApplyMovement 2, mv_SR201_0174
	WaitMovement
	GoTo _0117

_0117:
	BufferRivalsName 0
	NPCMsg msg_0881_SR201_00000
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_Unk0164 0x164 args []: no HeartGold mapping yet
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 2, 48
	// TODO Diamond ScrCmd_KeepEvent 0x06c args [2, 1]: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_400
	SetVar VAR_SINNOH_4086, 1
	ReleaseAll
	End

scr_seq_SR201_002:
	LockAll
	ApplyMovement obj_player, mv_SR201_0240
	ApplyMovement 2, mv_SR201_0230
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0881_SR201_00001
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 110
	GoToIf 1, _01F6
	CompareVarToValue 0x8004, 111
	GoToIf 1, _01F6
	CompareVarToValue 0x8004, 112
	GoToIf 1, _01F6
	CompareVarToValue 0x8004, 113
	GoToIf 1, _01F6
	CompareVarToValue 0x8004, 114
	GoToIf 1, _01F6
	CompareVarToValue 0x8004, 115
	GoToIf 1, _01F6
	End

_01F6:
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 2, 15
	ApplyMovement obj_player, mv_SR201_0238
	ApplyMovement 2, mv_SR201_0224
	WaitMovement
	GoTo _0216

_0216:
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 2, 48
	ReleaseAll
	End

scr_seq_SR201_003:
	LockAll
	BufferPlayersName 0
	NPCMsg msg_0881_SR201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR201_004:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 853
	GoToIf 1, _02E5
	CompareVarToValue 0x8005, 854
	GoToIf 1, _0319
	CompareVarToValue 0x8005, 855
	GoToIf 1, _034B
	End

_02E5:
	ApplyMovement 254, mv_SR201_0598
	ApplyMovement 5, mv_SR201_0524
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0881_SR201_00003
	CloseMsg
	ApplyMovement 5, mv_SR201_052C
	ApplyMovement 6, mv_SR201_055C
	WaitMovement
	GoTo _0385

_0319:
	ApplyMovement 254, mv_SR201_0598
	ApplyMovement 5, mv_SR201_0524
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0881_SR201_00003
	CloseMsg
	ApplyMovement 5, mv_SR201_0538
	ApplyMovement 6, mv_SR201_055C
	WaitMovement
	GoTo _0385

_034B:
	ApplyMovement obj_player, mv_SR201_05B8
	ApplyMovement 254, mv_SR201_05A8
	ApplyMovement 5, mv_SR201_0524
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0881_SR201_00003
	CloseMsg
	ApplyMovement 5, mv_SR201_0538
	ApplyMovement 6, mv_SR201_055C
	WaitMovement
	GoTo _0385

_0385:
	BufferFriendsName 0
	// TODO Diamond ScrCmd_GetPlayerStarterName 0x0db args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetRivalStarterName 0x0dc args [2]: no HeartGold mapping yet
	NPCMsg msg_0881_SR201_00004
	CloseMsg
	ApplyMovement 5, mv_SR201_054C
	WaitMovement
	BufferFriendsName 0
	NPCMsg msg_0881_SR201_00005
	CloseMsg
	CompareVarToValue 0x8005, 853
	GoToIf 1, _03DB
	CompareVarToValue 0x8005, 854
	GoToIf 1, _03F3
	CompareVarToValue 0x8005, 855
	GoToIf 1, _040B
	CompareVarToValue 0x8005, 856
	GoToIf 1, _040B
	End

_03DB:
	ApplyMovement 5, mv_SR201_0554
	ApplyMovement 6, mv_SR201_0570
	WaitMovement
	GoTo _0423

_03F3:
	ApplyMovement 5, mv_SR201_0554
	ApplyMovement 6, mv_SR201_057C
	WaitMovement
	GoTo _0423

_040B:
	ApplyMovement 5, mv_SR201_0554
	ApplyMovement 6, mv_SR201_057C
	WaitMovement
	GoTo _0423

_0423:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _043A
	GoTo _045B

_043A:
	BufferFriendsName 0
	NPCMsg msg_0881_SR201_00006
	CloseMsg
	ApplyMovement 6, mv_SR201_0568
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_0881_SR201_00007
	GoTo _047C

_045B:
	BufferFriendsName 0
	NPCMsg msg_0881_SR201_00008
	CloseMsg
	ApplyMovement 6, mv_SR201_0568
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_0881_SR201_00009
	GoTo _047C

_047C:
	CloseMsg
	CompareVarToValue 0x8005, 853
	GoToIf 1, _04B4
	CompareVarToValue 0x8005, 854
	GoToIf 1, _04B4
	CompareVarToValue 0x8005, 855
	GoToIf 1, _04B4
	CompareVarToValue 0x8005, 856
	GoToIf 1, _04B4
	End

_04B4:
	ApplyMovement 6, mv_SR201_0590
	WaitMovement
	GoTo _04C4

_04C4:
	HidePerson 6
	HidePerson 5
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0881_SR201_00010
	CloseMsg
	SetVar VAR_SINNOH_4086, 3
	// TODO Diamond ScrCmd_KeepEvent 0x06c args [254, 0]: no HeartGold mapping yet
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetFlag FLAG_SINNOH_400
	SetFlag FLAG_SINNOH_435
	SetVar VAR_SINNOH_4082, 4
	SetFlag FLAG_SINNOH_436
	Wait 30, 0x800C
	FadeScreen 6, 3, 0, 0
	WaitFade
	Warp MAP_SINNOH_TWINLEAF_RIVAL_HOUSE_1F, 0, 2, 6, 0
	FadeScreen 6, 3, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SR201_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0881_SR201_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR201_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0881_SR201_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR201_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _061A
	NPCMsg msg_0881_SR201_00015
	GoTo _0612

_0612:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_061A:
	NPCMsg msg_0881_SR201_00016
	GoTo _0612

scr_seq_SR201_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_108
	GoToIf 1, _0668
	NPCMsg msg_0881_SR201_00012
	SetVar 0x8004, 17
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0673
	SetFlag FLAG_SINNOH_108
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0668:
	NPCMsg msg_0881_SR201_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0673:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR201_005:
	DirectionSignpost msg_0881_SR201_00017, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR201_006:
	DirectionSignpost msg_0881_SR201_00018, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR201_007:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0881_SR201_00019, 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SR201_0140:
	.short 37, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR201_014C:
	.short 13, 1
	.short 14, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR201_015C:
	.short 13, 1
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR201_016C:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SR201_0174:
	.short 13, 1
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR201_0224:
	.short 12, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR201_0230:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SR201_0238:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SR201_0240:
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SR201_0524:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR201_052C:
	.short 63, 4
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_SR201_0538:
	.short 63, 4
	.short 14, 1
	.short 13, 1
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SR201_054C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR201_0554:
	.short 15, 8
	EndMovement

	.balign 4, 0
mv_SR201_055C:
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR201_0568:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR201_0570:
	.short 63, 3
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR201_057C:
	.short 62, 1
	.short 12, 1
	.short 33, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR201_0590:
	.short 19, 8
	EndMovement

	.balign 4, 0
mv_SR201_0598:
	.short 35, 1
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR201_05A8:
	.short 12, 1
	.short 35, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR201_05B8:
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 12, 1
	.short 35, 1
	EndMovement


	.balign 4, 0
