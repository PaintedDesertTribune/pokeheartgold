#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST05PC0101.h"
#include "msgdata/msg/msg_1047_ST05PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST05PC0101_000
	ScrDef scr_seq_ST05PC0101_001
	ScrDef scr_seq_ST05PC0101_002
	ScrDef scr_seq_ST05PC0101_003
	ScrDefEnd

scr_seq_ST05PC0101_000:
	SetVar 0x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_ST05PC0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1047_ST05PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05PC0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1047_ST05PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05PC0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2721
	GoToIf 1, _00C0
	NPCMsg msg_1047_ST05PC0101_00002
	GetPartyLead 0x8000
	MonGetFriendship 0x800C, 0x8000
	CompareVarToValue 0x800C, 150
	GoToIf 4, _0084
	CompareVarToValue 0x800C, 50
	GoToIf 4, _00CB
	GoTo _00D6

_0084:
	NPCMsg msg_1047_ST05PC0101_00003
	SetVar 0x8004, 3
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00B6
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_2721
	GoTo _00C0

_00B6:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00C0:
	NPCMsg msg_1047_ST05PC0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CB:
	NPCMsg msg_1047_ST05PC0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D6:
	NPCMsg msg_1047_ST05PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
