#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0201.h"
#include "msgdata/msg/msg_1247_ST07R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07R0201_000
	ScrDef scr_seq_ST07R0201_001
	ScrDef scr_seq_ST07R0201_002
	ScrDefEnd

scr_seq_ST07R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1247_ST07R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1247_ST07R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07R0201_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0067
	End

_005C:
	NPCMsg msg_1247_ST07R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0067:
	NPCMsg msg_1247_ST07R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
