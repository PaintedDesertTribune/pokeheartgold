#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0701.h"
#include "msgdata/msg/msg_0913_SC03R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0701_000
	ScrDefEnd

scr_seq_SC03R0701_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0913_SC03R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
