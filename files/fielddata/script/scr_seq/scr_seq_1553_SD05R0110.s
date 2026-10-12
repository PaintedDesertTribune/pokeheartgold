#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD05R0110.h"
#include "msgdata/msg/msg_1123_SD05R0110.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD05R0110_000
	ScrDefEnd

scr_seq_SD05R0110_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1123_SD05R0110_00000
	WaitButton
	CloseMsg
	ApplyMovement 16, mv_SD05R0110_0024
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
mv_SD05R0110_0024:
	.short 0, 1
	EndMovement

	.balign 4, 0
