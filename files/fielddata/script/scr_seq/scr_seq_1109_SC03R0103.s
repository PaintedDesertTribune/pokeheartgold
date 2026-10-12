#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0103.h"
#include "msgdata/msg/msg_0901_SC03R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0103_000
	ScrDef scr_seq_SC03R0103_001
	ScrDefEnd

scr_seq_SC03R0103_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_124
	GoToIf 1, _0054
	BufferItemName 0, 238
	NPCMsg msg_0901_SC03R0103_00000
	SetVar 0x8004, 238
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0064
	SetFlag FLAG_SINNOH_124
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0054:
	BufferItemName 0, 238
	NPCMsg msg_0901_SC03R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0064:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0103_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 54, 0
	NPCMsg msg_0901_SC03R0103_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
