#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SW230.h"
#include "msgdata/msg/msg_1251_SW230.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SW230_000
	ScrDef scr_seq_SW230_001
	ScrDef scr_seq_SW230_002
	ScrDef scr_seq_SW230_003
	ScrDefEnd

scr_seq_SW230_000:
	DirectionSignpost msg_1251_SW230_00000, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SW230_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1251_SW230_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SW230_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1251_SW230_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SW230_003:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
