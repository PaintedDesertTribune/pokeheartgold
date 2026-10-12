#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R206.h"
#include "msgdata/msg/msg_0964_R206.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R206_000
	ScrDef scr_seq_R206_001
	ScrDef scr_seq_R206_002
	ScrDef scr_seq_R206_003
	ScrDef scr_seq_R206_004
	ScrDef scr_seq_R206_005
	ScrDef scr_seq_R206_006
	ScrDef scr_seq_R206_007
	ScrDefEnd

scr_seq_R206_007:
	PlayerOnBikeSet 1
	SetVar VAR_SINNOH_411C, 0
	End

scr_seq_R206_000:
	SetFlag FLAG_SINNOH_2534
	End

scr_seq_R206_001:
	CheckFlag FLAG_SINNOH_2452
	CallIf 1, _00BA
	// TODO Diamond ScrCmd_GetPreviousMapID 0x200 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 80
	GoToIf 1, _005E
	CompareVarToValue 0x4000, 351
	GoToIf 1, _005E
	End

_005E:
	CheckFlag FLAG_SINNOH_3
	GoToIf 1, _00B8
	GetPlayerCoords 0x4000, 0x4001
	CompareVarToValue 0x4000, 299
	GoToIf 0, _00B8
	CompareVarToValue 0x4000, 306
	GoToIf 2, _00B8
	CompareVarToValue 0x4001, 576
	GoToIf 1, _00A5
	CompareVarToValue 0x4001, 681
	GoToIf 1, _00A5
	End

_00A5:
	SetFlag FLAG_SINNOH_3
	SetFlag FLAG_SINNOH_2452
	SetVar VAR_SINNOH_411C, 1
	// TODO Diamond ScrCmd_CyclingRoad 0x0c9 args [1]: no HeartGold mapping yet
	End

_00B8:
	End

_00BA:
	// TODO Diamond ScrCmd_CyclingRoad 0x0c9 args [1]: no HeartGold mapping yet
	Return

scr_seq_R206_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0964_R206_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R206_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0964_R206_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R206_004:
	DirectionSignpost msg_0964_R206_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R206_005:
	DirectionSignpost msg_0964_R206_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_R206_006:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0964_R206_00004, 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
