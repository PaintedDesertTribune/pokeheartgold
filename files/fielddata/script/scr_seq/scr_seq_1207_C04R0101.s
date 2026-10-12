#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04R0101.h"
#include "msgdata/msg/msg_0950_C04R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04R0101_000
	ScrDef scr_seq_C04R0101_001
	ScrDef scr_seq_C04R0101_002
	ScrDef scr_seq_C04R0101_003
	ScrDef scr_seq_C04R0101_004
	ScrDefEnd

scr_seq_C04R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_130
	GoToIf 1, _0063
	NPCMsg msg_0950_C04R0101_00000
	SetVar 0x8004, 450
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_130
	// TODO Diamond ScrCmd_SetSpawn 0x14c args [9]: no HeartGold mapping yet
	CompareVarToValue VAR_SINNOH_411B, 0
	GoToIf 1, _0057
	GoTo _0063

_0057:
	SetVar VAR_SINNOH_411B, 1
	GoTo _0063

_0063:
	NPCMsg msg_0950_C04R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0950_C04R0101_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_129
	GoToIf 1, _00AB
	NPCMsg msg_0950_C04R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00AB:
	NPCMsg msg_0950_C04R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0101_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0950_C04R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0101_004:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0950_C04R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
