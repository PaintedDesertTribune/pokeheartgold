#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR221R0201.h"
#include "msgdata/msg/msg_1196_SR221R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR221R0201_000
	ScrDef scr_seq_SR221R0201_001
	ScrDefEnd

scr_seq_SR221R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_311
	GoToIf 1, _0114
	CheckFlag FLAG_SINNOH_2734
	GoToIf 1, _016F
	// TODO Diamond ScrCmd_Unk0277 0x277 args [32768]: no HeartGold mapping yet
	BufferInt 0, 0x8000
	GetPartyCount 0x8002
	SetVar 0x8003, 0

_003B:
	// TODO Diamond ScrCmd_GetPartyMonLevel 0x278 args [32769, 32771]: no HeartGold mapping yet
	CompareVarToVar 0x8000, 0x8001
	GoToIf 1, _006D
	AddVar 0x8003, 1
	SubVar 0x8002, 1
	CompareVarToValue 0x8002, 0
	GoToIf 5, _003B
	GoTo _0164

_006D:
	CompareVarToValue VAR_SINNOH_4108, 0
	CallIf 1, _00ED
	CompareVarToValue VAR_SINNOH_4108, 1
	CallIf 1, _00F5
	CompareVarToValue VAR_SINNOH_4108, 2
	CallIf 1, _00FD
	BufferSpeciesName 1, 0x8003, 0, 0
	BufferItemName 2, 0x8004
	NPCMsg msg_1196_SR221R0201_00001
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0164
	GoTo _00C2

_00C2:
	CallStd 2016 /* TODO Diamond std script */
	ClearFlag FLAG_SINNOH_311
	SetFlag FLAG_SINNOH_2734
	AddVar VAR_SINNOH_4108, 1
	CompareVarToValue VAR_SINNOH_4108, 3
	GoToIf 0, _00E7
	SetVar VAR_SINNOH_4108, 0

_00E7:
	CloseMsg
	ReleaseAll
	End

_00ED:
	SetVar 0x8004, 241
	Return

_00F5:
	SetVar 0x8004, 268
	Return

_00FD:
	SetVar 0x8004, 275
	Return

_0105:
	SetFlag FLAG_SINNOH_311
	NPCMsg msg_1196_SR221R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0114:
	CompareVarToValue VAR_SINNOH_4108, 0
	CallIf 1, _00ED
	CompareVarToValue VAR_SINNOH_4108, 1
	CallIf 1, _00F5
	CompareVarToValue VAR_SINNOH_4108, 2
	CallIf 1, _00FD
	BufferItemName 2, 0x8004
	NPCMsg msg_1196_SR221R0201_00003
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0105
	GoTo _00C2

_0164:
	NPCMsg msg_1196_SR221R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016F:
	NPCMsg msg_1196_SR221R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR221R0201_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1196_SR221R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
