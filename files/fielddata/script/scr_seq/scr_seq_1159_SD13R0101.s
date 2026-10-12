#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD13R0101.h"
#include "msgdata/msg/msg_0926_SD13R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD13R0101_000
	ScrDef scr_seq_SD13R0101_001
	ScrDef scr_seq_SD13R0101_002
	ScrDef scr_seq_SD13R0101_003
	ScrDef scr_seq_SD13R0101_004
	ScrDef scr_seq_SD13R0101_005
	ScrDef scr_seq_SD13R0101_006
	ScrDefEnd

scr_seq_SD13R0101_000:
	SetFlag FLAG_SINNOH_2510
	End

scr_seq_SD13R0101_001:
	LockAll
	Call _00B4
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006E
	Call _00D6
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_2, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006E
	Call _00F6
	SetFlag FLAG_SINNOH_2441
	ReleaseAll
	End

_006E:
	WhiteOut
	ReleaseAll
	End

_00B4:
	NPCMsg msg_0926_SD13R0101_00000
	NPCMsg msg_0926_SD13R0101_00001
	ApplyMovement 0, mv_SD13R0101_0074
	ApplyMovement 1, mv_SD13R0101_0074
	WaitMovement
	NPCMsg msg_0926_SD13R0101_00002
	NPCMsg msg_0926_SD13R0101_00003
	CloseMsg
	Return

_00D6:
	ApplyMovement 0, mv_SD13R0101_0080
	WaitMovement
	NPCMsg msg_0926_SD13R0101_00004
	CloseMsg
	ApplyMovement 0, mv_SD13R0101_0088
	WaitMovement
	NPCMsg msg_0926_SD13R0101_00005
	CloseMsg
	Return

_00F6:
	NPCMsg msg_0926_SD13R0101_00006
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 0
	HidePerson 1
	SetVar VAR_SINNOH_40E9, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ClearFlag FLAG_SINNOH_444
	ShowPerson 3
	ApplyMovement 2, mv_SD13R0101_00A0
	WaitMovement
	HidePerson 3
	NPCMsg msg_0926_SD13R0101_00007
	SetVar 0x8004, 438
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_159
	NPCMsg msg_0926_SD13R0101_00008
	SetVar 0x8004, 94
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _017F
	CallStd std_obtain_item_verbose
	NPCMsg msg_0926_SD13R0101_00009
	GoTo _0186

_017F:
	CallStd 2017 /* TODO Diamond std script */
	NPCMsg msg_0926_SD13R0101_00012

_0186:
	SetFlag FLAG_SINNOH_160
	WaitButton
	CloseMsg
	Return

scr_seq_SD13R0101_002:
scr_seq_SD13R0101_003:
	End

scr_seq_SD13R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0926_SD13R0101_00010
	ShowMoneyBox 20, 2
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0204
	HasEnoughMoneyImmediate 0x800C, 100
	CompareVarToValue 0x800C, 0
	GoToIf 1, _021E
	SetVar 0x8004, 94
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0211
	SubMoneyImmediate 100
	UpdateMoneyBox
	CallStd std_obtain_item_verbose
	HideMoneyBox
	CloseMsg
	ReleaseAll
	End

_0204:
	NPCMsg msg_0926_SD13R0101_00014
	WaitButton
	HideMoneyBox
	CloseMsg
	ReleaseAll
	End

_0211:
	NPCMsg msg_0926_SD13R0101_00012
	WaitButton
	HideMoneyBox
	CloseMsg
	ReleaseAll
	End

_021E:
	NPCMsg msg_0926_SD13R0101_00013
	WaitButton
	HideMoneyBox
	CloseMsg
	ReleaseAll
	End

scr_seq_SD13R0101_005:
	DirectionSignpost msg_0926_SD13R0101_00015, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SD13R0101_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x8004, 438
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	CloseMsg
	SetFlag FLAG_SINNOH_159
	HidePerson 3
	ReleaseAll
	End

	.balign 4, 0
mv_SD13R0101_0074:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SD13R0101_0080:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD13R0101_0088:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD13R0101_00A0:
	.short 13, 1
	.short 35, 1
	.short 63, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
