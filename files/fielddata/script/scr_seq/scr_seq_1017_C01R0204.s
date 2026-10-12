#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C01R0204.h"
#include "msgdata/msg/msg_0855_C01R0204.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C01R0204_000
	ScrDef scr_seq_C01R0204_001
	ScrDefEnd

scr_seq_C01R0204_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0855_C01R0204_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0204_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0855_C01R0204_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
