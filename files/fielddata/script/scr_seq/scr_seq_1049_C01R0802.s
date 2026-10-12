#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C01R0802.h"
#include "msgdata/msg/msg_0871_C01R0802.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C01R0802_000
	ScrDef scr_seq_C01R0802_001
	ScrDef scr_seq_C01R0802_002
	ScrDef scr_seq_C01R0802_003
	ScrDefEnd

scr_seq_C01R0802_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0871_C01R0802_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0802_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0871_C01R0802_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0802_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0871_C01R0802_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0802_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0871_C01R0802_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
