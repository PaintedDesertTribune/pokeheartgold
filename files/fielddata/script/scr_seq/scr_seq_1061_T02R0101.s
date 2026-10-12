#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T02R0101.h"
#include "msgdata/msg/msg_0877_T02R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T02R0101_000
	ScrDef scr_seq_T02R0101_001
	ScrDef scr_seq_T02R0101_002
	ScrDef scr_seq_T02R0101_003
	ScrDef scr_seq_T02R0101_004
	ScrDef scr_seq_T02R0101_005
	ScrDef scr_seq_T02R0101_006
	ScrDef scr_seq_T02R0101_007
	ScrDef scr_seq_T02R0101_008
	ScrDef scr_seq_T02R0101_009
	ScrDef scr_seq_T02R0101_010
	ScrDef scr_seq_T02R0101_011
	ScrDef scr_seq_T02R0101_012
	ScrDef scr_seq_T02R0101_013
	ScrDefEnd

scr_seq_T02R0101_000:
	End

scr_seq_T02R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0621
	CheckFlag FLAG_SINNOH_2490
	GoToIf 0, _0072
	// TODO Diamond ScrCmd_CheckSinnohDexComplete 0x1e8 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0487

_0072:
	CompareVarToValue VAR_SINNOH_4071, 2
	GoToIf 4, _008D
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008D:
	CallStd 9950 /* TODO Diamond std script */
	End

scr_seq_T02R0101_003:
	End

scr_seq_T02R0101_001:
	LockAll
	ApplyMovement 3, mv_T02R0101_0338
	ApplyMovement obj_player, mv_T02R0101_035C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00000
	ApplyMovement 0, mv_T02R0101_0328
	WaitMovement
	SetVar 0x8004, 0
	GetPartyMonSpecies 0x8004, 0x800C
	// TODO unknown Diamond command cmd_8008 (0x8008); script truncated here
	End

scr_seq_T02R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _03BC
	BufferFriendsName 0
	NPCMsg msg_0877_T02R0101_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03BC:
	BufferFriendsName 0
	NPCMsg msg_0877_T02R0101_00050
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _03EF
	NPCMsg msg_0877_T02R0101_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03EF:
	NPCMsg msg_0877_T02R0101_00051
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0877_T02R0101_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_007:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_008:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_009:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_010:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_011:
	BufferPlayersName 0
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00047
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_012:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00048
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02R0101_013:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0877_T02R0101_00049
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0487:
	CheckFlag FLAG_SINNOH_272
	GoToIf 1, _049A
	GoTo _04AA

_049A:
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00032
	CloseMsg
	GoTo _04F0

_04AA:
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00028
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04C9
	GoTo _04D4

_04C9:
	NPCMsg msg_0877_T02R0101_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04D4:
	// TODO Diamond ScrCmd_CountSinnohDexSeen 0x11e args [32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 32780]: no HeartGold mapping yet
	NPCMsg msg_0877_T02R0101_00029
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00031
	CloseMsg
	GoTo _04F0

_04F0:
	GetPlayerFacing 0x8007
	CompareVarToValue 0x8007, 0
	CallIf 1, _062C
	CompareVarToValue 0x8007, 1
	CallIf 1, _062E
	CompareVarToValue 0x8007, 2
	CallIf 1, _0642
	CompareVarToValue 0x8007, 3
	CallIf 1, _0656
	ClearFlag FLAG_SINNOH_584
	ShowPerson 4
	ApplyMovement obj_player, mv_T02R0101_06CC
	ApplyMovement 4, mv_T02R0101_06F8
	ApplyMovement 0, mv_T02R0101_0678
	WaitMovement
	NPCMsg msg_0877_T02R0101_00033
	NPCMsg msg_0877_T02R0101_00034
	CloseMsg
	ApplyMovement 0, mv_T02R0101_0680
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_0877_T02R0101_00035
	CloseMsg
	ApplyMovement 4, mv_T02R0101_0700
	ApplyMovement obj_player, mv_T02R0101_06E0
	WaitMovement
	NPCMsg msg_0877_T02R0101_00036
	CheckFlag FLAG_SINNOH_2404
	CallIf 1, _0610
	ClearFlag FLAG_SINNOH_538
	SetFlag FLAG_SINNOH_690
	NatDexFlagAction 1, 0x800C
	BufferPlayersName 0
	PlaySE 1158
	NPCMsg msg_0877_T02R0101_00037
	// Diamond ScrCmd_PlaySoundWait dropped: waits for the current sound effect; HeartGold's WaitSE needs the effect id
	NPCMsg msg_0877_T02R0101_00038
	NPCMsg msg_0877_T02R0101_00039
	NPCMsg msg_0877_T02R0101_00040
	BufferPlayersName 0
	GetPlayerGender 0x8004
	CompareVarToValue 0x8004, 0
	CallIf 1, _0617
	CompareVarToValue 0x8004, 1
	CallIf 1, _061C
	CloseMsg
	ApplyMovement 4, mv_T02R0101_070C
	WaitMovement
	HidePerson 4
	NPCMsg msg_0877_T02R0101_00043
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement obj_player, mv_T02R0101_06EC
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0877_T02R0101_00044
	SetVar 0x8004, 431
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	NPCMsg msg_0877_T02R0101_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0610:
	// TODO Diamond ScrCmd_Unk0270 0x270 args [2, 1]: no HeartGold mapping yet
	Return

_0617:
	NPCMsg msg_0877_T02R0101_00041
	Return

_061C:
	NPCMsg msg_0877_T02R0101_00042
	Return

_0621:
	NPCMsg msg_0877_T02R0101_00046
	WaitButton
	CloseMsg
	ReleaseAll
	End

_062C:
	Return

_062E:
	ApplyMovement obj_player, mv_T02R0101_0698
	ApplyMovement 0, mv_T02R0101_066C
	WaitMovement
	Return

_0642:
	ApplyMovement obj_player, mv_T02R0101_06AC
	ApplyMovement 0, mv_T02R0101_066C
	WaitMovement
	Return

_0656:
	ApplyMovement obj_player, mv_T02R0101_06BC
	ApplyMovement 0, mv_T02R0101_066C
	WaitMovement
	Return

	.balign 4, 0
mv_T02R0101_0328:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_0338:
	.short 65, 1
	.short 12, 8
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_035C:
	.short 65, 1
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_T02R0101_066C:
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_0678:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_0680:
	.short 34, 1
	.short 63, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_0698:
	.short 14, 1
	.short 13, 2
	.short 15, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06AC:
	.short 13, 1
	.short 14, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06BC:
	.short 13, 1
	.short 15, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06CC:
	.short 33, 1
	.short 63, 5
	.short 14, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06E0:
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06EC:
	.short 15, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_06F8:
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_T02R0101_0700:
	.short 14, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_T02R0101_070C:
	.short 13, 9
	EndMovement

	.balign 4, 0
