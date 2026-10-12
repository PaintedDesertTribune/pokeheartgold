#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0603.h"
#include "msgdata/msg/msg_0912_SC03R0603.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0603_000
	ScrDef scr_seq_SC03R0603_001
	ScrDefEnd

scr_seq_SC03R0603_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0912_SC03R0603_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0603_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0912_SC03R0603_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
