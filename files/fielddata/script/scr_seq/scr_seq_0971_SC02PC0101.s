#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02PC0101.h"
#include "msgdata/msg/msg_0832_SC02PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02PC0101_000
	ScrDef scr_seq_SC02PC0101_001
	ScrDef scr_seq_SC02PC0101_002
	ScrDef scr_seq_SC02PC0101_003
	ScrDefEnd

scr_seq_SC02PC0101_000:
	SetVar 0x8007, 1
	CallStd std_nurse_joy
	End

scr_seq_SC02PC0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0832_SC02PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02PC0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0832_SC02PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02PC0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0832_SC02PC0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
