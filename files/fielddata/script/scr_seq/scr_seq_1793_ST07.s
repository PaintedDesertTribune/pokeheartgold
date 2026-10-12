#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07.h"
#include "msgdata/msg/msg_1243_ST07.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07_000
	ScrDef scr_seq_ST07_001
	ScrDef scr_seq_ST07_002
	ScrDef scr_seq_ST07_003
	ScrDef scr_seq_ST07_004
	ScrDef scr_seq_ST07_005
	ScrDef scr_seq_ST07_006
	ScrDef scr_seq_ST07_007
	ScrDefEnd

scr_seq_ST07_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1243_ST07_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1243_ST07_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1243_ST07_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1243_ST07_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST07_004:
	DirectionSignpost msg_1243_ST07_00005, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST07_005:
	DirectionSignpost msg_1243_ST07_00006, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST07_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1243_ST07_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_ST07_007:
	SetVar VAR_SPECIAL_x8008, 92
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
