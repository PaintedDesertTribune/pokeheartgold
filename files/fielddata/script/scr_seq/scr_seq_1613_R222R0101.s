#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R222R0101.h"
#include "msgdata/msg/msg_1153_R222R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R222R0101_000
	ScrDef scr_seq_R222R0101_001
	ScrDef scr_seq_R222R0101_002
	ScrDef scr_seq_R222R0101_003
	ScrDef scr_seq_R222R0101_004
	ScrDef scr_seq_R222R0101_005
	ScrDef scr_seq_R222R0101_006
	ScrDefEnd

scr_seq_R222R0101_000:
	SetFlag FLAG_SINNOH_2543
	End

scr_seq_R222R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1153_R222R0101_00000
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R222R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1153_R222R0101_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R222R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1153_R222R0101_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R222R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1153_R222R0101_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R222R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1153_R222R0101_00004
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R222R0101_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1153_R222R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
