#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02R0102.h"
#include "msgdata/msg/msg_0835_SC02R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02R0102_000
	ScrDef scr_seq_SC02R0102_001
	ScrDef scr_seq_SC02R0102_002
	ScrDef scr_seq_SC02R0102_003
	ScrDefEnd

scr_seq_SC02R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0030
	NPCMsg msg_0835_SC02R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0030:
	NPCMsg msg_0835_SC02R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0102_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0835_SC02R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0102_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0835_SC02R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0102_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0835_SC02R0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
