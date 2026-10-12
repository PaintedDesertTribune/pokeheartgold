#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04R0303.h"
#include "msgdata/msg/msg_0957_C04R0303.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04R0303_000
	ScrDef scr_seq_C04R0303_001
	ScrDef scr_seq_C04R0303_002
	ScrDef scr_seq_C04R0303_003
	ScrDefEnd

scr_seq_C04R0303_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0957_C04R0303_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0303_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0957_C04R0303_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0303_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0957_C04R0303_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C04R0303_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0957_C04R0303_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
