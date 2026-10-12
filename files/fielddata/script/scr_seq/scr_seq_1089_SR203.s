#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR203.h"
#include "msgdata/msg/msg_0891_SR203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR203_000
	ScrDef scr_seq_SR203_001
	ScrDef scr_seq_SR203_002
	ScrDef scr_seq_SR203_003
	ScrDef scr_seq_SR203_004
	ScrDef scr_seq_SR203_005
	ScrDef scr_seq_SR203_006
	ScrDef scr_seq_SR203_007
	ScrDefEnd

scr_seq_SR203_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0891_SR203_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR203_001:
	DirectionSignpost msg_0891_SR203_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR203_002:
	DirectionSignpost msg_0891_SR203_00004, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR203_003:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0891_SR203_00005, 0x800C
	CallStd std_signpost
	End

scr_seq_SR203_004:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0891_SR203_00006, 0x800C
	CallStd std_signpost
	End

scr_seq_SR203_005:
	LockAll
	CallStd std_play_rival_intro_music
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 757
	GoToIf 1, _00C7
	CompareVarToValue 0x8005, 758
	GoToIf 1, _00D7
	CompareVarToValue 0x8005, 759
	GoToIf 1, _00E7
	CompareVarToValue 0x8005, 760
	GoToIf 1, _00F7
	End

_00C7:
	ApplyMovement 5, mv_SR203_0224
	WaitMovement
	GoTo _0107

_00D7:
	ApplyMovement 5, mv_SR203_0230
	WaitMovement
	GoTo _0107

_00E7:
	ApplyMovement 5, mv_SR203_0244
	WaitMovement
	GoTo _0107

_00F7:
	ApplyMovement 5, mv_SR203_0258
	WaitMovement
	GoTo _0107

_0107:
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0891_SR203_00000
	CloseMsg
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 387
	GoToIf 1, _0142
	CompareVarToValue 0x800C, 390
	GoToIf 1, _014E
	GoTo _0136

_0136:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC, 0, 0, 0
	GoTo _015A

_0142:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_2, 0, 0, 0
	GoTo _015A

_014E:
	TrainerBattle TRAINER_SINNOH_PKMN_TRAINER_BARRY_CEDRIC_3, 0, 0, 0
	GoTo _015A

_015A:
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01FD
	BufferRivalsName 0
	NPCMsg msg_0891_SR203_00001
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 757
	GoToIf 1, _01AF
	CompareVarToValue 0x8005, 758
	GoToIf 1, _01BF
	CompareVarToValue 0x8005, 759
	GoToIf 1, _01CF
	CompareVarToValue 0x8005, 760
	GoToIf 1, _01DF
	End

_01AF:
	ApplyMovement 5, mv_SR203_0204
	WaitMovement
	GoTo _01EF

_01BF:
	ApplyMovement 5, mv_SR203_020C
	WaitMovement
	GoTo _01EF

_01CF:
	ApplyMovement 5, mv_SR203_0214
	WaitMovement
	GoTo _01EF

_01DF:
	ApplyMovement 5, mv_SR203_021C
	WaitMovement
	GoTo _01EF

_01EF:
	HidePerson 5
	SetVar VAR_SINNOH_4088, 1
	ReleaseAll
	End

_01FD:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SR203_0204:
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SR203_020C:
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SR203_0214:
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SR203_021C:
	.short 19, 10
	EndMovement

	.balign 4, 0
mv_SR203_0224:
	.short 75, 1
	.short 18, 4
	EndMovement

	.balign 4, 0
mv_SR203_0230:
	.short 75, 1
	.short 18, 2
	.short 17, 1
	.short 18, 2
	EndMovement

	.balign 4, 0
mv_SR203_0244:
	.short 75, 1
	.short 18, 2
	.short 17, 2
	.short 18, 2
	EndMovement

	.balign 4, 0
mv_SR203_0258:
	.short 75, 1
	.short 18, 2
	.short 17, 3
	.short 18, 2
	EndMovement

scr_seq_SR203_006:
	SetVar VAR_SPECIAL_x8008, 79
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR203_007:
	SetVar VAR_SPECIAL_x8008, 4
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
