#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R221.h"
#include "msgdata/msg/msg_1195_R221.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R221_000
	ScrDef scr_seq_R221_001
	ScrDef scr_seq_R221_002
	ScrDef scr_seq_R221_003
	ScrDefEnd

scr_seq_R221_003:
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _002C
	SetFlag FLAG_SINNOH_669
	SetFlag FLAG_SINNOH_670

_002C:
	End

scr_seq_R221_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1195_R221_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R221_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1195_R221_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R221_002:
	DirectionSignpost msg_1195_R221_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
