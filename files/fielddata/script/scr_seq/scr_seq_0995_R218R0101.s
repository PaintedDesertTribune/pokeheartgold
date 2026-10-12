#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R218R0101.h"
#include "msgdata/msg/msg_0844_R218R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R218R0101_000
	ScrDef scr_seq_R218R0101_001
	ScrDefEnd

scr_seq_R218R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0844_R218R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R218R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x8004, 445
	BufferItemName 0, 0x8004
	CheckFlag FLAG_SINNOH_132
	GoToIf 1, _005E
	NPCMsg msg_0844_R218R0101_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A7
	CompareVarToValue 0x800C, 1
	GoToIf 1, _009C
	End

_005E:
	BufferItemName 0, 0x8004
	NPCMsg msg_0844_R218R0101_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0086
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0091
	End

_0086:
	NPCMsg msg_0844_R218R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0091:
	NPCMsg msg_0844_R218R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009C:
	NPCMsg msg_0844_R218R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A7:
	BufferItemName 0, 0x8004
	NPCMsg msg_0844_R218R0101_00002
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_132
	GoTo _005E


	.balign 4, 0
