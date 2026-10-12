#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04PC0102.h"
#include "msgdata/msg/msg_0949_SC04PC0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04PC0102_000
	ScrDefEnd

scr_seq_SC04PC0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0949_SC04PC0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
