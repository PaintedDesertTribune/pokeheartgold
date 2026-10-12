#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0401.h"
#include "msgdata/msg/msg_1067_SC07R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0401_000
	ScrDef scr_seq_SC07R0401_001
	ScrDef scr_seq_SC07R0401_002
	ScrDefEnd

scr_seq_SC07R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x4001, 19
	NPCMsg msg_1067_SC07R0401_00000
	// Diamond ScrCmd_ShowCoinBox dropped: HeartGold has no coin box window
	GoTo _002B

_002B:
	NPCMsg msg_1067_SC07R0401_00001
	Call _0105
	CompareVarToValue 0x800C, 65534
	GoToIf 1, _00C8
	CompareVarToVar 0x800C, 0x4001
	GoToIf 1, _00C8
	// TODO Diamond ScrCmd_GetPrizeItemIdAndCost 0x2a6 args [32780, 32768, 32769]: no HeartGold mapping yet
	CompareVarToValue 0x8000, 328
	CallIf 0, _00EC
	CompareVarToValue 0x8000, 328
	CallIf 4, _00F6
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _002B
	// TODO Diamond ScrCmd_HasEnoughCoinsAddress 0x2a9 args [32780, 32769]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E3
	HasSpaceForItem 0x8000, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D5
	NPCMsg msg_1067_SC07R0401_00004
	GiveItem 0x8000, 1, 0x800C
	// TODO Diamond ScrCmd_TakeCoinsAddress 0x2a8 args [32769]: no HeartGold mapping yet
	// Diamond ScrCmd_UpdateCoinBox dropped: HeartGold has no coin box window
	PlayFanfare 1604
	WaitSE 1604
	GoTo _002B

_00C8:
	NPCMsg msg_1067_SC07R0401_00007
	WaitButton
	CloseMsg
	// Diamond ScrCmd_HideCoinBox dropped: HeartGold has no coin box window
	ReleaseAll
	End

_00D5:
	BufferItemName 0, 0x8000
	NPCMsg msg_1067_SC07R0401_00006
	GoTo _002B

_00E3:
	NPCMsg msg_1067_SC07R0401_00005
	GoTo _002B

_00EC:
	BufferItemName 0, 0x8000
	NPCMsg msg_1067_SC07R0401_00002
	Return

_00F6:
	BufferItemName 0, 0x8000
	BufferTMHMMoveName 1, 0x8000
	NPCMsg msg_1067_SC07R0401_00003
	Return

_0105:
	SetVar 0x8008, 0
	SetVar 0x8009, 0
	// TODO Diamond ScrCmd_Unk0044 0x044 args [1, 1, 0, 1, 32780]: no HeartGold mapping yet

_0119:
	// TODO Diamond ScrCmd_GetPrizeItemIdAndCost 0x2a6 args [32776, 32768, 32769]: no HeartGold mapping yet
	BufferItemName 0, 0x8000
	// TODO Diamond ScrCmd_Unk0280 0x280 args [1, 32769, 1, 5]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [168, 255, 32776]: no HeartGold mapping yet
	AddVar 0x8008, 1
	CompareVarToVar 0x8008, 0x4001
	GoToIf 0, _0119
	// TODO Diamond ScrCmd_Unk0046 0x046 args [169, 255, 32776]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0047 0x047 args []: no HeartGold mapping yet
	Return

scr_seq_SC07R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1067_SC07R0401_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0401_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1067_SC07R0401_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
