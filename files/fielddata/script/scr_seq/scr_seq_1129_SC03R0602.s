#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0602.h"
#include "msgdata/msg/msg_0911_SC03R0602.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0602_000
	ScrDef scr_seq_SC03R0602_001
	ScrDef scr_seq_SC03R0602_002
	ScrDef scr_seq_SC03R0602_003
	ScrDefEnd

scr_seq_SC03R0602_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0911_SC03R0602_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0602_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_266
	GoToIf 1, _006C
	NPCMsg msg_0911_SC03R0602_00001
	SetVar 0x8004, 3
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0077
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_266
	GoTo _006C

_006C:
	NPCMsg msg_0911_SC03R0602_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0077:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0602_002:
	End

scr_seq_SC03R0602_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0911_SC03R0602_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
