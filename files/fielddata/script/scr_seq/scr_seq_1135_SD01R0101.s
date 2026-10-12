#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD01R0101.h"
#include "msgdata/msg/msg_0914_SD01R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD01R0101_000
	ScrDef scr_seq_SD01R0101_001
	ScrDef scr_seq_SD01R0101_002
	ScrDefEnd

scr_seq_SD01R0101_000:
	SetFlag FLAG_SINNOH_2498
	End

scr_seq_SD01R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0914_SD01R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD01R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0914_SD01R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
