#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL03.h"
#include "msgdata/msg/msg_1137_SL03.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL03_000
	ScrDef scr_seq_SL03_001
	ScrDef scr_seq_SL03_002
	ScrDef scr_seq_SL03_003
	ScrDef scr_seq_SL03_004
	ScrDef scr_seq_SL03_005
	ScrDefEnd

scr_seq_SL03_001:
	CheckFlag FLAG_SINNOH_186
	GoToIf 0, _002E
	CheckFlag FLAG_SINNOH_186
	GoToIf 1, _0040
	End

_002E:
	MoveWarp 2, 310, 235
	MoveWarp 3, 311, 235
	End

_0040:
	MoveWarp 0, 310, 235
	MoveWarp 1, 311, 235
	End

scr_seq_SL03_000:
	CheckBadge 6, 0x4000
	CompareVarToValue 0x4000, 1
	CallIf 1, _007D
	CheckFlag FLAG_SINNOH_186
	GoToIf 0, _002E
	CheckFlag FLAG_SINNOH_186
	GoToIf 1, _0040
	End

_007D:
	MovePerson 1, 312, 240
	MovePerson 2, 308, 242
	Return

scr_seq_SL03_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 6, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00B5
	NPCMsg msg_1137_SL03_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B5:
	NPCMsg msg_1137_SL03_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL03_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 6, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00E6
	NPCMsg msg_1137_SL03_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E6:
	NPCMsg msg_1137_SL03_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SL03_004:
	DirectionSignpost msg_1137_SL03_00004, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SL03_005:
	SetVar VAR_SPECIAL_x8008, 2
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
