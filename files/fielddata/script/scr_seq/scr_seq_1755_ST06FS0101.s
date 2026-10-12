#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST06FS0101.h"
#include "msgdata/msg/msg_1224_ST06FS0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST06FS0101_000
	ScrDef scr_seq_ST06FS0101_001
	ScrDef scr_seq_ST06FS0101_002
	ScrDef scr_seq_ST06FS0101_003
	ScrDefEnd

scr_seq_ST06FS0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_ST06FS0101_001:
	End

scr_seq_ST06FS0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1224_ST06FS0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST06FS0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1224_ST06FS0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
