#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C07R0701.h"
#include "msgdata/msg/msg_1077_C07R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C07R0701_000
	ScrDef scr_seq_C07R0701_001
	ScrDefEnd

scr_seq_C07R0701_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1077_C07R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0701_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1077_C07R0701_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
