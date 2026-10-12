#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0101.h"
#include "msgdata/msg/msg_1248_ST07R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07R0101_000
	ScrDef scr_seq_ST07R0101_001
	ScrDef scr_seq_ST07R0101_002
	ScrDef scr_seq_ST07R0101_003
	ScrDef scr_seq_ST07R0101_004
	ScrDef scr_seq_ST07R0101_005
	ScrDef scr_seq_ST07R0101_006
	ScrDef scr_seq_ST07R0101_007
	ScrDefEnd

scr_seq_ST07R0101_007:
	CheckFlag FLAG_SINNOH_250
	GoToIf 1, _002F
	End

_002F:
	MovePerson 0, 16, 14
	SetObjectFacing 0, 1
	End

scr_seq_ST07R0101_006:
	LockAll
	Wait 20, 0x800C
	// TODO Diamond ScrCmd_CountTotalPartyRibbons 0x22f args [32772]: no HeartGold mapping yet
	CompareVarToValue 0x8004, 10
	GoToIf 0, _0078
	SetVar VAR_SINNOH_40A7, 1
	SetFlag FLAG_SINNOH_250
	BufferPlayersName 0
	NPCMsg msg_1248_ST07R0101_00001
	CloseMsg
	ApplyMovement 0, mv_ST07R0101_00AC
	WaitMovement
	ReleaseAll
	ReleaseAll
	End

_0078:
	NPCMsg msg_1248_ST07R0101_00000
	CloseMsg
	Wait 20, 0x800C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_RESORT_AREA, 0, 826, 454, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST07R0101_000:
	BufferPlayersName 0
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1248_ST07R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x8000
	BufferPlayersName 0
	BufferSpeciesName 2, 0x8000, 0, 0
	MonHasRibbon 0x800C, 0x8000, 68
	CompareVarToValue 0x800C, 1
	GoToIf 1, _022E
	MonHasRibbon 0x800C, 0x8000, 67
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01D9
	MonHasRibbon 0x800C, 0x8000, 66
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0184
	GoTo _012F

_012F:
	ShowMoneyBox 20, 2
	NPCMsg msg_1248_ST07R0101_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0246
	HasEnoughMoneyImmediate 0x800C, 10000
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0239
	SubMoneyImmediate 10000
	UpdateMoneyBox
	PlayFanfare 1604
	WaitSE 1604
	NPCMsg msg_1248_ST07R0101_00007
	NPCMsg msg_1248_ST07R0101_00008
	WaitButton
	GiveRibbon 0x8000, 66
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0184:
	ShowMoneyBox 20, 2
	NPCMsg msg_1248_ST07R0101_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0246
	HasEnoughMoneyImmediate 0x800C, 100000
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0239
	SubMoneyImmediate 100000
	UpdateMoneyBox
	PlayFanfare 1604
	WaitSE 1604
	NPCMsg msg_1248_ST07R0101_00009
	NPCMsg msg_1248_ST07R0101_00010
	WaitButton
	GiveRibbon 0x8000, 67
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_01D9:
	ShowMoneyBox 20, 2
	NPCMsg msg_1248_ST07R0101_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0246
	HasEnoughMoneyImmediate 0x800C, 999999
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0239
	SubMoneyImmediate 999999
	UpdateMoneyBox
	PlayFanfare 1604
	WaitSE 1604
	NPCMsg msg_1248_ST07R0101_00011
	NPCMsg msg_1248_ST07R0101_00012
	WaitButton
	GiveRibbon 0x8000, 68
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_022E:
	NPCMsg msg_1248_ST07R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0239:
	NPCMsg msg_1248_ST07R0101_00013
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_0246:
	NPCMsg msg_1248_ST07R0101_00014
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

scr_seq_ST07R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1248_ST07R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _028E
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0299
	End

_028E:
	NPCMsg msg_1248_ST07R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0299:
	NPCMsg msg_1248_ST07R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 300, 0
	NPCMsg msg_1248_ST07R0101_00018
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 54, 0
	NPCMsg msg_1248_ST07R0101_00019
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST07R0101_00AC:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
