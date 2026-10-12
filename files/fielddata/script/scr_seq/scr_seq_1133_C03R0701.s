#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C03R0701.h"
#include "msgdata/msg/msg_0913_C03R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C03R0701_000
	ScrDefEnd

scr_seq_C03R0701_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0913_C03R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
