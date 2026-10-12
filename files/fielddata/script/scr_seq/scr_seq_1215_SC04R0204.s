#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0204.h"
#include "msgdata/msg/msg_0954_SC04R0204.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0204_000
	ScrDef scr_seq_SC04R0204_001
	ScrDef scr_seq_SC04R0204_002
	ScrDef scr_seq_SC04R0204_003
	ScrDefEnd

scr_seq_SC04R0204_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	ApplyMovement 2, mv_SC04R0204_014C
	WaitMovement
	NPCMsg msg_0954_SC04R0204_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COMMANDER_JUPITER_JUPITER, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0146
	NPCMsg msg_0954_SC04R0204_00001
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	Wait 15, 0x800C
	GetPlayerFacing 0x8004
	CompareVarToValue 0x8004, 0
	GoToIf 1, _00A1
	CompareVarToValue 0x8004, 1
	GoToIf 1, _00BB
	CompareVarToValue 0x8004, 2
	GoToIf 1, _00D5
	CompareVarToValue 0x8004, 3
	GoToIf 1, _00E7
	End

_00A1:
	ApplyMovement 2, mv_SC04R0204_0154
	ApplyMovement obj_player, mv_SC04R0204_018C
	WaitMovement
	GoTo _0101

_00BB:
	ApplyMovement 2, mv_SC04R0204_0164
	ApplyMovement obj_player, mv_SC04R0204_019C
	WaitMovement
	GoTo _0101

_00D5:
	ApplyMovement 2, mv_SC04R0204_0174
	WaitMovement
	GoTo _0101

_00E7:
	ApplyMovement 2, mv_SC04R0204_0180
	ApplyMovement obj_player, mv_SC04R0204_01AC
	WaitMovement
	GoTo _0101

_0101:
	NPCMsg msg_0954_SC04R0204_00004
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	SetFlag FLAG_SINNOH_539
	SetFlag FLAG_SINNOH_129
	ClearFlag FLAG_SINNOH_432
	ClearFlag FLAG_SINNOH_542
	ClearFlag FLAG_SINNOH_540
	HidePerson 2
	HidePerson 1
	HidePerson 3
	FadeScreen 6, 1, 1, 0
	WaitFade
	SetFlag FLAG_SINNOH_2439
	ReleaseAll
	End

_0146:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC04R0204_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0954_SC04R0204_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0204_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 427, 0
	NPCMsg msg_0954_SC04R0204_00005
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0204_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_129
	GoToIf 1, _0210
	NPCMsg msg_0954_SC04R0204_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0210:
	NPCMsg msg_0954_SC04R0204_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC04R0204_014C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_0154:
	.short 63, 1
	.short 15, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_0164:
	.short 63, 1
	.short 15, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_0174:
	.short 63, 1
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_SC04R0204_0180:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_018C:
	.short 34, 1
	.short 62, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_019C:
	.short 34, 1
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC04R0204_01AC:
	.short 34, 1
	EndMovement

	.balign 4, 0
