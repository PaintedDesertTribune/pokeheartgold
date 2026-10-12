#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR208R0101.h"
#include "msgdata/msg/msg_0975_SR208R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR208R0101_000
	ScrDef scr_seq_SR208R0101_001
	ScrDef scr_seq_SR208R0101_002
	ScrDef scr_seq_SR208R0101_003
	ScrDefEnd

scr_seq_SR208R0101_000:
	SetFlag FLAG_SINNOH_2535
	End

scr_seq_SR208R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2720
	GoToIf 1, _0063
	NPCMsg msg_0975_SR208R0101_00000
	Random 0x8004, 26
	AddVar 0x8004, 149
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006E
	SetFlag FLAG_SINNOH_2720
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0063:
	NPCMsg msg_0975_SR208R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SR208R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue 0x4000, 1
	GoToIf 1, _00E9
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00F9
	NPCMsg msg_0975_SR208R0101_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00C3
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00DE
	End

_00C3:
	NPCMsg msg_0975_SR208R0101_00003
	SetVar 0x4000, 1
	SetVar 0x8004, 7
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DE:
	NPCMsg msg_0975_SR208R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E9:
	// TODO Diamond ScrCmd_GetPoketchAppName 0x0d7 args [0, 7]: no HeartGold mapping yet
	NPCMsg msg_0975_SR208R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F9:
	NPCMsg msg_0975_SR208R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR208R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0975_SR208R0101_00007
	ShowMoneyBox 20, 2
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 223, 0
	ScrCmd_066 224, 1
	ScrCmd_066 225, 2
	ScrCmd_066 226, 3
	ScrCmd_066 227, 4
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8000, 0x800C
	CopyVar 0x8008, 0x8000
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0241
	CompareVarToValue 0x8008, 1
	GoToIf 1, _024D
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0259
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0265
	NPCMsg msg_0975_SR208R0101_00009
	GoTo _0225

_017C:
	CompareVarToValue 0x8000, 0
	CallIf 1, _0271
	CompareVarToValue 0x8000, 1
	CallIf 1, _027B
	CompareVarToValue 0x8000, 2
	CallIf 1, _0285
	CompareVarToValue 0x8000, 3
	CallIf 1, _028F
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0238
	HasSpaceForItem 0x8001, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _022F
	CompareVarToValue 0x8000, 0
	CallIf 1, _0299
	CompareVarToValue 0x8000, 1
	CallIf 1, _02A1
	CompareVarToValue 0x8000, 2
	CallIf 1, _02A9
	CompareVarToValue 0x8000, 3
	CallIf 1, _02B1
	UpdateMoneyBox
	PlayFanfare 1604
	GiveItem 0x8001, 1, 0x800C
	BufferItemName 0, 0x8001
	NPCMsg msg_0975_SR208R0101_00010
	NPCMsg msg_0975_SR208R0101_00008
	GoTo _0225

_0225:
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_022F:
	NPCMsg msg_0975_SR208R0101_00011
	GoTo _0225

_0238:
	NPCMsg msg_0975_SR208R0101_00012
	GoTo _0225

_0241:
	SetVar 0x8001, 95
	GoTo _017C

_024D:
	SetVar 0x8001, 96
	GoTo _017C

_0259:
	SetVar 0x8001, 97
	GoTo _017C

_0265:
	SetVar 0x8001, 98
	GoTo _017C

_0271:
	HasEnoughMoneyImmediate 0x800C, 200
	Return

_027B:
	HasEnoughMoneyImmediate 0x800C, 200
	Return

_0285:
	HasEnoughMoneyImmediate 0x800C, 200
	Return

_028F:
	HasEnoughMoneyImmediate 0x800C, 200
	Return

_0299:
	SubMoneyImmediate 200
	Return

_02A1:
	SubMoneyImmediate 200
	Return

_02A9:
	SubMoneyImmediate 200
	Return

_02B1:
	SubMoneyImmediate 200
	Return


	.balign 4, 0
