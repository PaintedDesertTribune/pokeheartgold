#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0101.h"
#include "msgdata/msg/msg_1180_SC10R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0101_000
	ScrDef scr_seq_SC10R0101_001
	ScrDef scr_seq_SC10R0101_002
	ScrDef scr_seq_SC10R0101_003
	ScrDef scr_seq_SC10R0101_004
	ScrDef scr_seq_SC10R0101_005
	ScrDef scr_seq_SC10R0101_006
	ScrDefEnd

scr_seq_SC10R0101_004:
	SetFlag FLAG_SINNOH_2548
	SetFlag FLAG_SINNOH_672
	SetFlag FLAG_SINNOH_673
	SetFlag FLAG_SINNOH_674
	SetFlag FLAG_SINNOH_675
	ClearFlag FLAG_SINNOH_676
	ClearFlag FLAG_SINNOH_677
	ClearFlag FLAG_SINNOH_678
	ClearFlag FLAG_SINNOH_679
	ClearFlag FLAG_SINNOH_176
	ClearFlag FLAG_SINNOH_177
	ClearFlag FLAG_SINNOH_178
	ClearFlag FLAG_SINNOH_179
	CheckFlag FLAG_SINNOH_175
	GoToIf 1, _005F
	End

_005F:
	MovePerson 0, 12, 3
	End

scr_seq_SC10R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_175
	GoToIf 1, _00F3
	NPCMsg msg_1180_SC10R0101_00002
	CloseMsg
	PlaySE 1161
	WaitSE 1161
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00B4
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00C4
	CompareVarToValue 0x800C, 3
	GoToIf 1, _00D4
	End

_00B4:
	ApplyMovement 0, mv_SC10R0101_0100
	WaitMovement
	GoTo _00E4

_00C4:
	ApplyMovement 0, mv_SC10R0101_010C
	WaitMovement
	GoTo _00E4

_00D4:
	ApplyMovement 0, mv_SC10R0101_0118
	WaitMovement
	GoTo _00E4

_00E4:
	SetFlag FLAG_SINNOH_175
	NPCMsg msg_1180_SC10R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F3:
	NPCMsg msg_1180_SC10R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC10R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_SC10R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 48
	ReleaseAll
	End

scr_seq_SC10R0101_003:
	LockAll
	ClearFlag FLAG_SINNOH_571
	ShowPerson 5
	CallStd std_play_rival_intro_music
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 10
	GoToIf 1, _018D
	CompareVarToValue 0x8004, 11
	GoToIf 1, _019D
	CompareVarToValue 0x8004, 12
	GoToIf 1, _01AD
	End

_018D:
	ApplyMovement 5, mv_SC10R0101_02BC
	WaitMovement
	GoTo _01BD

_019D:
	ApplyMovement 5, mv_SC10R0101_02CC
	WaitMovement
	GoTo _01BD

_01AD:
	ApplyMovement 5, mv_SC10R0101_02D4
	WaitMovement
	GoTo _01BD

_01BD:
	ApplyMovement obj_player, mv_SC10R0101_02B4
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_1180_SC10R0101_00000
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _01FF
	CompareVarToValue 0x800C, 390
	GoToIf 1, _020B
	GoTo _01F3

_01F3:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_13, 0, 0, 0
	GoTo _0217

_01FF:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_14, 0, 0, 0
	GoTo _0217

_020B:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_15, 0, 0, 0
	GoTo _0217

_0217:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02A8
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1180_SC10R0101_00001
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 10
	GoToIf 1, _0262
	CompareVarToValue 0x8004, 11
	GoToIf 1, _0272
	CompareVarToValue 0x8004, 12
	GoToIf 1, _0282
	End

_0262:
	ApplyMovement 5, mv_SC10R0101_02E4
	WaitMovement
	GoTo _0292

_0272:
	ApplyMovement 5, mv_SC10R0101_02F4
	WaitMovement
	GoTo _0292

_0282:
	ApplyMovement 5, mv_SC10R0101_02FC
	WaitMovement
	GoTo _0292

_0292:
	PlayFanfare 1539
	HidePerson 5
	WaitSE 1539
	SetVar VAR_SINNOH_40EF, 1
	ReleaseAll
	End

_02A8:
	SetFlag FLAG_SINNOH_571
	WhiteOut
	ReleaseAll
	End

scr_seq_SC10R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1180_SC10R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC10R0101_006:
	SetVar 0x8007, 3
	CallStd std_nurse_joy
	End

	.balign 4, 0
mv_SC10R0101_0100:
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC10R0101_010C:
	.short 14, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC10R0101_0118:
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC10R0101_02B4:
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SC10R0101_02BC:
	.short 16, 3
	.short 18, 1
	.short 16, 3
	EndMovement

	.balign 4, 0
mv_SC10R0101_02CC:
	.short 16, 6
	EndMovement

	.balign 4, 0
mv_SC10R0101_02D4:
	.short 16, 3
	.short 19, 1
	.short 16, 3
	EndMovement

	.balign 4, 0
mv_SC10R0101_02E4:
	.short 17, 3
	.short 19, 1
	.short 17, 3
	EndMovement

	.balign 4, 0
mv_SC10R0101_02F4:
	.short 17, 6
	EndMovement

	.balign 4, 0
mv_SC10R0101_02FC:
	.short 17, 3
	.short 18, 1
	.short 17, 3
	EndMovement


	.balign 4, 0
