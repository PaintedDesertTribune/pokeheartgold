#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST03R0201.h"
#include "msgdata/msg/msg_0924_ST03R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST03R0201_000
	ScrDef scr_seq_ST03R0201_001
	ScrDefEnd

scr_seq_ST03R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0924_ST03R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0924_ST03R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
