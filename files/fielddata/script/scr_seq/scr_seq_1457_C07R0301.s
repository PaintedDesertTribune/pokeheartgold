#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C07R0301.h"
#include "msgdata/msg/msg_1075_C07R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C07R0301_000
	ScrDef scr_seq_C07R0301_001
	ScrDefEnd

scr_seq_C07R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0058
	CompareVarToValue VAR_SINNOH_40D3, 2
	GoToIf 4, _004D
	CompareVarToValue VAR_SINNOH_40B2, 2
	GoToIf 4, _0042
	NPCMsg msg_1075_C07R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0042:
	NPCMsg msg_1075_C07R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_004D:
	NPCMsg msg_1075_C07R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0058:
	NPCMsg msg_1075_C07R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 463, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _008B
	NPCMsg msg_1075_C07R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008B:
	NPCMsg msg_1075_C07R0301_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00AE
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00EA
	End

_00AE:
	SetFlag FLAG_SINNOH_270
	TakeItem 463, 1, 0x800C
	BufferPlayersName 0
	NPCMsg msg_1075_C07R0301_00006
	WaitButton
	WaitSE 1500
	PlayFanfare 1544
	ApplyMovement 3, mv_C07R0301_00F0
	ApplyMovement 4, mv_C07R0301_00F8
	WaitMovement
	HidePerson 3
	HidePerson 4
	CloseMsg
	ReleaseAll
	End

_00EA:
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_C07R0301_00F0:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_C07R0301_00F8:
	.short 19, 1
	EndMovement

	.balign 4, 0
