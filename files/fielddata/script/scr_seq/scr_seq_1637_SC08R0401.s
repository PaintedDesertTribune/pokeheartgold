#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0401.h"
#include "msgdata/msg/msg_1165_SC08R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0401_000
	ScrDef scr_seq_SC08R0401_001
	ScrDefEnd

scr_seq_SC08R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1165_SC08R0401_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC08R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1165_SC08R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
