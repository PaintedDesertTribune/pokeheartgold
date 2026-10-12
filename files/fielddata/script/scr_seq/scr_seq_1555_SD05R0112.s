#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0112.h"
#include "msgdata/msg/msg_1124_SD05R0112.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0112_000
	ScrDefEnd

scr_seq_SD05R0112_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1124_SD05R0112_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
