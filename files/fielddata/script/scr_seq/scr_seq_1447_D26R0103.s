#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D26R0103.h"
#include "msgdata/msg/msg_1070_D26R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D26R0103_000
	ScrDef scr_seq_D26R0103_001
	ScrDef scr_seq_D26R0103_002
	ScrDefEnd

scr_seq_D26R0103_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1070_D26R0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0103_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 440, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0049
	NPCMsg msg_1070_D26R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0049:
	NPCMsg msg_1070_D26R0103_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A0
	End

_006C:
	BufferPlayersName 0
	NPCMsg msg_1070_D26R0103_00003
	WaitButton
	WaitSE 1500
	PlayFanfare 1544
	ApplyMovement 5, mv_D26R0103_00A8
	ApplyMovement 6, mv_D26R0103_00B0
	WaitMovement
	SetFlag FLAG_SINNOH_579
	HidePerson 5
	HidePerson 6
	CloseMsg
	ReleaseAll
	End

_00A0:
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0103_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1070_D26R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_D26R0103_00A8:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_D26R0103_00B0:
	.short 19, 1
	EndMovement

	.balign 4, 0
