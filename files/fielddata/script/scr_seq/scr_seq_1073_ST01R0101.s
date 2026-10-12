#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0101.h"
#include "msgdata/msg/msg_0883_ST01R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0101_000
	ScrDefEnd

scr_seq_ST01R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _00B0
	CompareVarToValue VAR_SINNOH_4095, 1
	GoToIf 4, _0082
	CheckFlag FLAG_SINNOH_110
	GoToIf 1, _0090
	CheckFlag FLAG_SINNOH_234
	GoToIf 1, _009E
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _006B
	End

_005C:
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00000
	GoTo _007A

_006B:
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00001
	GoTo _007A

_007A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0082:
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0090:
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009E:
	SetFlag FLAG_SINNOH_110
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B0:
	BufferRivalsName 1
	NPCMsg msg_0883_ST01R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
