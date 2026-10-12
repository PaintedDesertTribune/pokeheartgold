#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T05PC0101.h"
#include "msgdata/msg/msg_1047_T05PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T05PC0101_000
	ScrDef scr_seq_T05PC0101_001
	ScrDef scr_seq_T05PC0101_002
	ScrDef scr_seq_T05PC0101_003
	ScrDefEnd

scr_seq_T05PC0101_000:
	SetVar 0x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T05PC0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1047_T05PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05PC0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1047_T05PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05PC0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2721
	GoToIf 1, _00C0
	NPCMsg msg_1047_T05PC0101_00002
	GetPartyLead 0x8000
	// TODO Diamond ScrCmd_GetPartyMonFriendship 0x1b9 args [32780, 32768]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 150
	GoToIf 4, _0084
	CompareVarToValue 0x800C, 50
	GoToIf 4, _00CB
	GoTo _00D6

_0084:
	NPCMsg msg_1047_T05PC0101_00003
	SetVar 0x8004, 3
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00B6
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_2721
	GoTo _00C0

_00B6:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_00C0:
	NPCMsg msg_1047_T05PC0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CB:
	NPCMsg msg_1047_T05PC0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D6:
	NPCMsg msg_1047_T05PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
