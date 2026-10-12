#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0801.h"
#include "msgdata/msg/msg_1000_SC05R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0801_000
	ScrDef scr_seq_SC05R0801_001
	ScrDef scr_seq_SC05R0801_002
	ScrDef scr_seq_SC05R0801_003
	ScrDef scr_seq_SC05R0801_004
	ScrDef scr_seq_SC05R0801_005
	ScrDef scr_seq_SC05R0801_006
	ScrDef scr_seq_SC05R0801_007
	ScrDef scr_seq_SC05R0801_008
	ScrDefEnd

scr_seq_SC05R0801_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1000_SC05R0801_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1000_SC05R0801_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0801_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1000_SC05R0801_00008
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
