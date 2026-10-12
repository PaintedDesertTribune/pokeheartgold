#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0203.h"
#include "msgdata/msg/msg_0905_SC03R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0203_000
	ScrDef scr_seq_SC03R0203_001
	ScrDef scr_seq_SC03R0203_002
	ScrDefEnd

scr_seq_SC03R0203_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0905_SC03R0203_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0203_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0905_SC03R0203_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0203_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0905_SC03R0203_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
