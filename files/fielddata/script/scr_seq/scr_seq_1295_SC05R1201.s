#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R1201.h"
#include "msgdata/msg/msg_0994_SC05R1201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R1201_000
	ScrDef scr_seq_SC05R1201_001
	ScrDef scr_seq_SC05R1201_002
	ScrDef scr_seq_SC05R1201_003
	ScrDef scr_seq_SC05R1201_004
	ScrDef scr_seq_SC05R1201_005
	ScrDefEnd

scr_seq_SC05R1201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R1201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R1201_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R1201_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R1201_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R1201_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0994_SC05R1201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
