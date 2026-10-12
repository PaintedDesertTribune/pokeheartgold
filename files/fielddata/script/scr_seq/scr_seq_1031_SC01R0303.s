#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0303.h"
#include "msgdata/msg/msg_0862_SC01R0303.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0303_000
	ScrDefEnd

scr_seq_SC01R0303_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0862_SC01R0303_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
