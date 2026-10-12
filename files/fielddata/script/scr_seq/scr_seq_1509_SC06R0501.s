#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0501.h"
#include "msgdata/msg/msg_1101_SC06R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0501_000
	ScrDef scr_seq_SC06R0501_001
	ScrDefEnd

scr_seq_SC06R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1101_SC06R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 54, 0
	NPCMsg msg_1101_SC06R0501_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
