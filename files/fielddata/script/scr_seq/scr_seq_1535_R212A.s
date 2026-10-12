#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R212A.h"
#include "msgdata/msg/msg_1114_R212A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R212A_000
	ScrDef scr_seq_R212A_001
	ScrDef scr_seq_R212A_002
	ScrDef scr_seq_R212A_003
	ScrDef scr_seq_R212A_004
	ScrDef scr_seq_R212A_005
	ScrDef scr_seq_R212A_006
	ScrDef scr_seq_R212A_007
	ScrDef scr_seq_R212A_008
	ScrDef scr_seq_R212A_009
	ScrDefEnd

scr_seq_R212A_009:
	SetVar 0x4000, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0071
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0071
	CompareVarToValue 0x4000, 2
	GoToIf 1, _0071
	CompareVarToValue 0x4000, 3
	GoToIf 1, _0093
	CompareVarToValue 0x4000, 4
	GoToIf 1, _0093
	End

_0071:
	ClearFlag FLAG_SINNOH_638
	ClearFlag FLAG_SINNOH_640
	ClearFlag FLAG_SINNOH_642
	ClearFlag FLAG_SINNOH_644
	SetFlag FLAG_SINNOH_639
	SetFlag FLAG_SINNOH_641
	SetFlag FLAG_SINNOH_643
	SetFlag FLAG_SINNOH_645
	End

_0093:
	ClearFlag FLAG_SINNOH_639
	ClearFlag FLAG_SINNOH_641
	ClearFlag FLAG_SINNOH_643
	ClearFlag FLAG_SINNOH_645
	SetFlag FLAG_SINNOH_638
	SetFlag FLAG_SINNOH_640
	SetFlag FLAG_SINNOH_642
	SetFlag FLAG_SINNOH_644
	End

scr_seq_R212A_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212A_001:
	DirectionSignpost msg_1114_R212A_00006, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R212A_002:
	DirectionSignpost msg_1114_R212A_00007, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R212A_003:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1114_R212A_00008, 0x800C
	CallStd std_signpost
	End

scr_seq_R212A_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212A_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212A_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212A_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212A_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1114_R212A_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
