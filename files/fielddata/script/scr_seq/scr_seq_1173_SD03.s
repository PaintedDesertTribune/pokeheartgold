#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD03.h"
#include "msgdata/msg/msg_0933_SD03.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD03_000
	ScrDef scr_seq_SD03_001
	ScrDef scr_seq_SD03_002
	ScrDef scr_seq_SD03_003
	ScrDef scr_seq_SD03_004
	ScrDef scr_seq_SD03_005
	ScrDefEnd

scr_seq_SD03_000:
	SetFlag FLAG_SINNOH_2500
	End

scr_seq_SD03_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_298
	GoToIf 1, _004D
	SetVar 0x8004, 95
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_0933_SD03_00000
	SetVar 0x8005, 1
	// Diamond std call dropped: Contest accessory gift (dress-up dropped, decision 16)
	SetFlag FLAG_SINNOH_298
	CloseMsg
	ReleaseAll
	End

_004D:
	NPCMsg msg_0933_SD03_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD03_001:
	DirectionSignpost msg_0933_SD03_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SD03_002:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0933_SD03_00003, 0x800C
	CallStd std_signpost
	End


scr_seq_SD03_004:
	SetVar VAR_SPECIAL_x8008, 409
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD03_005:
	SetVar VAR_SPECIAL_x8008, 222
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
