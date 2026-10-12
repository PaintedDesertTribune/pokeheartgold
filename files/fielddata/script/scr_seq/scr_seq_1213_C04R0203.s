#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C04R0203.h"
#include "msgdata/msg/msg_0953_C04R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C04R0203_000
	ScrDefEnd

scr_seq_C04R0203_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0953_C04R0203_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
