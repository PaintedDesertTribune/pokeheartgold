#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T03R0101.h"
#include "msgdata/msg/msg_0923_T03R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T03R0101_000
	ScrDef scr_seq_T03R0101_001
	ScrDef scr_seq_T03R0101_002
	ScrDefEnd

scr_seq_T03R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2730
	GoToIf 1, _0059
	NPCMsg msg_0923_T03R0101_00000
	Random 0x8004, 5
	AddVar 0x8004, 149
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0064
	SetFlag FLAG_SINNOH_2730
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0059:
	NPCMsg msg_0923_T03R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0064:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_128
	GoToIf 1, _009E
	NPCMsg msg_0923_T03R0101_00002
	SetVar 0x8004, 448
	SetVar 0x8005, 1
	SetFlag FLAG_SINNOH_128
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_009E:
	NPCMsg msg_0923_T03R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T03R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_AccessoriesShop 0x257 args []: no HeartGold mapping yet
	ReleaseAll
	End


	.balign 4, 0
