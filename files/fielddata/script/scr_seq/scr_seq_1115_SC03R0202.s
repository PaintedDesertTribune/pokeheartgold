#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0202.h"
#include "msgdata/msg/msg_0904_SC03R0202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0202_000
	ScrDef scr_seq_SC03R0202_001
	ScrDef scr_seq_SC03R0202_002
	ScrDefEnd

scr_seq_SC03R0202_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0904_SC03R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0202_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0904_SC03R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0202_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_193
	GoToIf 1, _00A1
	PlayerHasSpecies 0x800C, 41
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0096
	NPCMsg msg_0904_SC03R0202_00003
	SetVar 0x8004, 14
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _008C
	SetFlag FLAG_SINNOH_193
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_008C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0096:
	NPCMsg msg_0904_SC03R0202_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A1:
	NPCMsg msg_0904_SC03R0202_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
