#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST06.h"
#include "msgdata/msg/msg_1223_ST06.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST06_000
	ScrDef scr_seq_ST06_001
	ScrDef scr_seq_ST06_002
	ScrDef scr_seq_ST06_003
	ScrDef scr_seq_ST06_004
	ScrDefEnd

scr_seq_ST06_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1223_ST06_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1223_ST06_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1223_ST06_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_215
	GoToIf 1, _0083
	CheckFlag FLAG_SINNOH_214
	GoToIf 1, _0078
	NPCMsg msg_1223_ST06_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0078:
	NPCMsg msg_1223_ST06_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0083:
	NPCMsg msg_1223_ST06_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06_004:
	DirectionSignpost msg_1223_ST06_00007, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End



	.balign 4, 0
