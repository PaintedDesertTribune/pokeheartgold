#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0104.h"
#include "msgdata/msg/msg_0902_SC03R0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0104_000
	ScrDef scr_seq_SC03R0104_001
	ScrDef scr_seq_SC03R0104_002
	ScrDefEnd

scr_seq_SC03R0104_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0902_SC03R0104_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0104_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0902_SC03R0104_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0104_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0902_SC03R0104_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
