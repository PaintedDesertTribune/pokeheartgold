#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST02R0301.h"
#include "msgdata/msg/msg_0880_ST02R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST02R0301_000
	ScrDef scr_seq_ST02R0301_001
	ScrDefEnd

scr_seq_ST02R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0880_ST02R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0880_ST02R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
