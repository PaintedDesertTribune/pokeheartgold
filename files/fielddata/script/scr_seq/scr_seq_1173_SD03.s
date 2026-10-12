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
	ScrDefEnd

scr_seq_SD03_000:
	SetFlag FLAG_SINNOH_2500
	End

scr_seq_SD03_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_298
	GoToIf 1, _004D
	SetVar 0x8004, 95
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_0933_SD03_00000
	SetVar 0x8005, 1
	CallStd 2015 /* TODO Diamond std script */
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


	.balign 4, 0
