#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C05R0101.h"
#include "msgdata/msg/msg_0997_C05R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C05R0101_000
	ScrDef scr_seq_C05R0101_001
	ScrDefEnd

scr_seq_C05R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0997_C05R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C05R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0997_C05R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
