#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0302.h"
#include "msgdata/msg/msg_0956_SC04R0302.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0302_000
	ScrDef scr_seq_SC04R0302_001
	ScrDefEnd

scr_seq_SC04R0302_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_194
	GoToIf 1, _0059
	NPCMsg msg_0956_SC04R0302_00000
	SetVar 0x8004, 394
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004F
	SetFlag FLAG_SINNOH_194
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_004F:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0059:
	NPCMsg msg_0956_SC04R0302_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0302_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0956_SC04R0302_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
