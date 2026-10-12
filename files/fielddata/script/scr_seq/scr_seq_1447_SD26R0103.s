#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0103.h"
#include "msgdata/msg/msg_1070_SD26R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0103_000
	ScrDef scr_seq_SD26R0103_001
	ScrDef scr_seq_SD26R0103_002
	ScrDef scr_seq_SD26R0103_003
	ScrDef scr_seq_SD26R0103_004
	ScrDefEnd

scr_seq_SD26R0103_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1070_SD26R0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0103_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	HasItem 440, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0049
	NPCMsg msg_1070_SD26R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0049:
	NPCMsg msg_1070_SD26R0103_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A0
	End

_006C:
	BufferPlayersName 0
	NPCMsg msg_1070_SD26R0103_00003
	WaitButton
	WaitSE SEQ_SE_DP_SELECT
	PlayFanfare SEQ_SE_DP_DOOR10
	ApplyMovement 5, mv_SD26R0103_00A8
	ApplyMovement 6, mv_SD26R0103_00B0
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

scr_seq_SD26R0103_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1070_SD26R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD26R0103_00A8:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_SD26R0103_00B0:
	.short 19, 1
	EndMovement

scr_seq_SD26R0103_003:
	SetVar VAR_SPECIAL_x8008, 348
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD26R0103_004:
	SetVar VAR_SPECIAL_x8008, 40
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
