#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD16R0101.h"
#include "msgdata/msg/msg_1235_SD16R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD16R0101_000
	ScrDef scr_seq_SD16R0101_001
	ScrDef scr_seq_SD16R0101_002
	ScrDef scr_seq_SD16R0101_003
	ScrDefEnd

scr_seq_SD16R0101_000:
	SetFlag FLAG_SINNOH_2514
	CheckFlag FLAG_SINNOH_219
	CallIf 1, _0030
	CompareVarToValue VAR_SINNOH_409E, 1
	GoToIf 4, _0036
	End

_0030:
	SetFlag FLAG_SINNOH_503
	Return

_0036:
	SetFlag FLAG_SINNOH_503
	CompareVarToValue VAR_SINNOH_410E, 1
	GoToIf 4, _0049
	End

_0049:
	SetVar 0x4000, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0090
	CompareVarToValue 0x4000, 2
	GoToIf 1, _0090
	CompareVarToValue 0x4000, 3
	GoToIf 1, _0090
	CompareVarToValue 0x4000, 4
	GoToIf 1, _0090
	CompareVarToValue 0x4000, 5
	GoToIf 1, _0090
	End

_0090:
	ClearFlag FLAG_SINNOH_503
	End

scr_seq_SD16R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_409E, 1
	GoToIf 4, scr_seq_SD16R0101_003
	CheckFlag FLAG_SINNOH_219
	GoToIf 1, _00CB
	SetFlag FLAG_SINNOH_219
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1235_SD16R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CB:
	BufferRivalsName 0
	NPCMsg msg_1235_SD16R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD16R0101_002:
	LockAll
	ApplyMovement 14, mv_SD16R0101_0104
	WaitMovement
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1235_SD16R0101_00000
	CloseMsg
	ApplyMovement 14, mv_SD16R0101_0110
	WaitMovement
	HidePerson 14
	ReleaseAll
	End

scr_seq_SD16R0101_003:
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_1235_SD16R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD16R0101_0104:
	.short 37, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SD16R0101_0110:
	.short 17, 8
	EndMovement

	.balign 4, 0
