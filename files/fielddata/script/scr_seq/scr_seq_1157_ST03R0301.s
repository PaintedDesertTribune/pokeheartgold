#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST03R0301.h"
#include "msgdata/msg/msg_0925_ST03R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST03R0301_000
	ScrDef scr_seq_ST03R0301_001
	ScrDef scr_seq_ST03R0301_002
	ScrDefEnd

scr_seq_ST03R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0925_ST03R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_131
	GoToIf 1, _0094
	NPCMsg msg_0925_ST03R0301_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0062
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0057
	End

_0057:
	NPCMsg msg_0925_ST03R0301_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0062:
	NPCMsg msg_0925_ST03R0301_00002
	SetVar 0x8004, 415
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _009F
	SetFlag FLAG_SINNOH_131
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0094:
	NPCMsg msg_0925_ST03R0301_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009F:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03R0301_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0925_ST03R0301_00005
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
