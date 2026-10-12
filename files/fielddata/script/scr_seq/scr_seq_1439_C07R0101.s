#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C07R0101.h"
#include "msgdata/msg/msg_1066_C07R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C07R0101_000
	ScrDef scr_seq_C07R0101_001
	ScrDef scr_seq_C07R0101_002
	ScrDef scr_seq_C07R0101_003
	ScrDef scr_seq_C07R0101_004
	ScrDef scr_seq_C07R0101_005
	ScrDef scr_seq_C07R0101_006
	ScrDef scr_seq_C07R0101_007
	ScrDef scr_seq_C07R0101_008
	ScrDef scr_seq_C07R0101_009
	ScrDef scr_seq_C07R0101_010
	ScrDef scr_seq_C07R0101_011
	ScrDef scr_seq_C07R0101_012
	ScrDef scr_seq_C07R0101_013
	ScrDef scr_seq_C07R0101_014
	ScrDef scr_seq_C07R0101_015
	ScrDef scr_seq_C07R0101_016
	ScrDef scr_seq_C07R0101_017
	ScrDef scr_seq_C07R0101_018
	ScrDef scr_seq_C07R0101_019
	ScrDef scr_seq_C07R0101_020
	ScrDefEnd

scr_seq_C07R0101_000:
	SetVar 0x8004, 0
	GoTo _00E6

scr_seq_C07R0101_001:
	SetVar 0x8004, 1
	GoTo _00E6

scr_seq_C07R0101_002:
	SetVar 0x8004, 2
	GoTo _00E6

scr_seq_C07R0101_003:
	SetVar 0x8004, 3
	GoTo _00E6

scr_seq_C07R0101_004:
	SetVar 0x8004, 4
	GoTo _00E6

scr_seq_C07R0101_005:
	SetVar 0x8004, 5
	GoTo _00E6

scr_seq_C07R0101_006:
	SetVar 0x8004, 6
	GoTo _00E6

scr_seq_C07R0101_007:
	SetVar 0x8004, 7
	GoTo _00E6

scr_seq_C07R0101_008:
	SetVar 0x8004, 8
	GoTo _00E6

scr_seq_C07R0101_009:
	SetVar 0x8004, 9
	GoTo _00E6

scr_seq_C07R0101_010:
	SetVar 0x8004, 10
	GoTo _00E6

scr_seq_C07R0101_011:
	SetVar 0x8004, 11
	GoTo _00E6

_00E6:
	PlayFanfare 1500
	LockAll
	HasItem 444, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _012F
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	// TODO Diamond ScrCmd_SlotMachine 0x267 args [32772]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_012F:
	NPCMsg msg_1066_C07R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00000
	HasItem 444, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _019D
	CheckFlag FLAG_SINNOH_304
	GoToIf 1, _01A8
	// TODO Diamond ScrCmd_Unk0275 0x275 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01A8
	SetVar 0x8004, 391
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01A8
	GoTo _02BE

_019D:
	NPCMsg msg_1066_C07R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01A8:
	// TODO Diamond ScrCmd_ShowCoinBox 0x075 args [20, 2]: no HeartGold mapping yet
	ShowMoneyBox 20, 7

_01B4:
	NPCMsg msg_1066_C07R0101_00002
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 125, 0
	ScrCmd_066 126, 1
	ScrCmd_066 127, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _01F3
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0242
	GoTo _02AF

_01F3:
	HasEnoughMoneyImmediate 0x800C, 1000
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0291
	// TODO Diamond ScrCmd_CanGiveCoins 0x276 args [32780, 50]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Nop 0x000 args []: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02A0
	SubMoneyImmediate 1000
	// TODO Diamond ScrCmd_GiveCoins 0x079 args [50]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_UpdateCoinBox 0x077 args []: no HeartGold mapping yet
	UpdateMoneyBox
	PlayFanfare 1604
	WaitSE 1604
	NPCMsg msg_1066_C07R0101_00003
	Wait 30, 0x800C
	GoTo _01B4

_0242:
	HasEnoughMoneyImmediate 0x800C, 10000
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0291
	// TODO Diamond ScrCmd_CanGiveCoins 0x276 args [32780, 500]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Nop 0x000 args []: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02A0
	SubMoneyImmediate 10000
	// TODO Diamond ScrCmd_GiveCoins 0x079 args [500]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_UpdateCoinBox 0x077 args []: no HeartGold mapping yet
	UpdateMoneyBox
	PlayFanfare 1604
	WaitSE 1604
	NPCMsg msg_1066_C07R0101_00003
	Wait 30, 0x800C
	GoTo _01B4

_0291:
	NPCMsg msg_1066_C07R0101_00004
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_HideCoinBox 0x076 args []: no HeartGold mapping yet
	HideMoneyBox
	ReleaseAll
	End

_02A0:
	NPCMsg msg_1066_C07R0101_00005
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_HideCoinBox 0x076 args []: no HeartGold mapping yet
	HideMoneyBox
	ReleaseAll
	End

_02AF:
	NPCMsg msg_1066_C07R0101_00006
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_HideCoinBox 0x076 args []: no HeartGold mapping yet
	HideMoneyBox
	ReleaseAll
	End

_02BE:
	NPCMsg msg_1066_C07R0101_00007
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_304
	NPCMsg msg_1066_C07R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_014:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 444, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _034D
	CheckFlag FLAG_SINNOH_302
	GoToIf 1, _0358
	// TODO Diamond ScrCmd_CanGiveCoins 0x276 args [32780, 20]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Nop 0x000 args []: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0358
	SetFlag FLAG_SINNOH_302
	// TODO Diamond ScrCmd_GiveCoins 0x079 args [20]: no HeartGold mapping yet
	BufferPlayersName 0
	NPCMsg msg_1066_C07R0101_00013
	WaitButton
	PlayFanfare 1604
	WaitSE 1604
	CloseMsg
	ReleaseAll
	End

_034D:
	NPCMsg msg_1066_C07R0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0358:
	NPCMsg msg_1066_C07R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_015:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 444, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03BE
	CheckFlag FLAG_SINNOH_303
	GoToIf 1, _03C9
	// TODO Diamond ScrCmd_CanGiveCoins 0x276 args [32780, 50]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Nop 0x000 args []: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03C9
	SetFlag FLAG_SINNOH_303
	// TODO Diamond ScrCmd_GiveCoins 0x079 args [50]: no HeartGold mapping yet
	BufferPlayersName 0
	NPCMsg msg_1066_C07R0101_00016
	WaitButton
	PlayFanfare 1604
	WaitSE 1604
	CloseMsg
	ReleaseAll
	End

_03BE:
	NPCMsg msg_1066_C07R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03C9:
	NPCMsg msg_1066_C07R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_016:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_017:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_018:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_019:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1066_C07R0101_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0101_020:
	CompareVarToValue VAR_SINNOH_4040, 999
	GoToIf 2, _0443
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 16448]: no HeartGold mapping yet
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1066_C07R0101_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0443:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 999]: no HeartGold mapping yet
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1066_C07R0101_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
