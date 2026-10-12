#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0106.h"
#include "msgdata/msg/msg_1074_SD26R0106.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0106_000
	ScrDef scr_seq_SD26R0106_001
	ScrDef scr_seq_SD26R0106_002
	ScrDefEnd

scr_seq_SD26R0106_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1074_SD26R0106_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0106_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1074_SD26R0106_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0106_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 440, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005C
	NPCMsg msg_1074_SD26R0106_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005C:
	NPCMsg msg_1074_SD26R0106_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _007F
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00B3
	End

_007F:
	BufferPlayersName 0
	NPCMsg msg_1074_SD26R0106_00004
	WaitButton
	WaitSE 1500
	PlayFanfare 1544
	ApplyMovement 6, mv_SD26R0106_00BC
	ApplyMovement 7, mv_SD26R0106_00C4
	WaitMovement
	SetFlag FLAG_SINNOH_581
	HidePerson 6
	HidePerson 7
	CloseMsg
	ReleaseAll
	End

_00B3:
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD26R0106_00BC:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_SD26R0106_00C4:
	.short 19, 1
	EndMovement

	.balign 4, 0
