#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD02R0101.h"
#include "msgdata/msg/msg_0931_SD02R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD02R0101_000
	ScrDef scr_seq_SD02R0101_001
	ScrDef scr_seq_SD02R0101_002
	ScrDef scr_seq_SD02R0101_003
	ScrDef scr_seq_SD02R0101_004
	ScrDef scr_seq_SD02R0101_005
	ScrDefEnd

scr_seq_SD02R0101_000:
	SetFlag FLAG_SINNOH_2499
	CompareVarToValue VAR_SINNOH_4089, 2
	GoToIf 4, _002D
	End

_002D:
	MovePerson 5, 21, 5
	SetObjectFacing 5, 2
	SetObjectMovementType 5, 16
	MovePerson 2, 18, 4
	SetObjectFacing 2, 1
	SetObjectMovementType 2, 15
	End

scr_seq_SD02R0101_001:
	LockAll
	NPCMsg msg_0931_SD02R0101_00000
	CloseMsg
	ApplyMovement 0, mv_SD02R0101_0078
	WaitMovement
	HidePerson 0
	SetVar VAR_SINNOH_40CF, 1
	ReleaseAll
	ReleaseAll
	End

scr_seq_SD02R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0931_SD02R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD02R0101_003:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 6
	GoToIf 1, _00B7
	CompareVarToValue 0x8005, 7
	GoToIf 1, _00C9
	End

_00B7:
	ApplyMovement 1, mv_SD02R0101_02E0
	WaitMovement
	GoTo _00DB

_00C9:
	ApplyMovement 1, mv_SD02R0101_02F0
	WaitMovement
	GoTo _00DB

_00DB:
	NPCMsg msg_0931_SD02R0101_00002
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COMMANDER_MARS_MARS, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0250
	NPCMsg msg_0931_SD02R0101_00003
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 1
	HidePerson 6
	HidePerson 3
	HidePerson 4
	SetFlag FLAG_SINNOH_452
	SetFlag FLAG_SINNOH_448
	SetVar VAR_SINNOH_4089, 2
	SetFlag FLAG_SINNOH_2728
	FadeScreen 6, 1, 1, 0
	WaitFade
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 6
	GoToIf 1, _0158
	CompareVarToValue 0x8005, 7
	GoToIf 1, _016A
	End

_0158:
	ApplyMovement 2, mv_SD02R0101_0280
	WaitMovement
	GoTo _017C

_016A:
	ApplyMovement 2, mv_SD02R0101_028C
	WaitMovement
	GoTo _017C

_017C:
	NPCMsg msg_0931_SD02R0101_00004
	CloseMsg
	SetFlag FLAG_SINNOH_534
	ClearFlag FLAG_SINNOH_535
	SetObjectMovementType 5, 16
	ShowPerson 5
	Lock 5
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 6
	GoToIf 1, _01B9
	CompareVarToValue 0x8005, 7
	GoToIf 1, _01D3
	End

_01B9:
	ApplyMovement 5, mv_SD02R0101_0258
	ApplyMovement 2, mv_SD02R0101_0298
	WaitMovement
	GoTo _01ED

_01D3:
	ApplyMovement 5, mv_SD02R0101_026C
	ApplyMovement 2, mv_SD02R0101_02A4
	WaitMovement
	GoTo _01ED

_01ED:
	NPCMsg msg_0931_SD02R0101_00005
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 6
	GoToIf 1, _0214
	CompareVarToValue 0x8005, 7
	GoToIf 1, _0226
	End

_0214:
	ApplyMovement 2, mv_SD02R0101_02B0
	WaitMovement
	GoTo _0238

_0226:
	ApplyMovement 2, mv_SD02R0101_02C8
	WaitMovement
	GoTo _0238

_0238:
	NPCMsg msg_0931_SD02R0101_00006
	NPCMsg msg_0931_SD02R0101_00007
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_40CF, 2
	SetFlag FLAG_SINNOH_2440
	ReleaseAll
	End

_0250:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD02R0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40CF, 3
	GoToIf 4, _031C
	NPCMsg msg_0931_SD02R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031C:
	NPCMsg msg_0931_SD02R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD02R0101_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40CF, 3
	GoToIf 4, _0347
	NPCMsg msg_0931_SD02R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0347:
	NPCMsg msg_0931_SD02R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD02R0101_0078:
	.short 18, 9
	EndMovement

	.balign 4, 0
mv_SD02R0101_0258:
	.short 19, 4
	.short 16, 1
	.short 19, 6
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_026C:
	.short 19, 4
	.short 16, 2
	.short 19, 6
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_0280:
	.short 13, 3
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_028C:
	.short 13, 4
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_0298:
	.short 63, 6
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_02A4:
	.short 63, 6
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_02B0:
	.short 3, 1
	.short 63, 2
	.short 2, 1
	.short 63, 2
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_02C8:
	.short 3, 1
	.short 63, 2
	.short 2, 1
	.short 63, 2
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_02E0:
	.short 75, 1
	.short 12, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD02R0101_02F0:
	.short 75, 1
	.short 34, 1
	EndMovement


	.balign 4, 0
