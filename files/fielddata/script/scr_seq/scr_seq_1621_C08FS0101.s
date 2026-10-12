#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C08FS0101.h"
#include "msgdata/msg/msg_1157_C08FS0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C08FS0101_000
	ScrDef scr_seq_C08FS0101_001
	ScrDef scr_seq_C08FS0101_002
	ScrDef scr_seq_C08FS0101_003
	ScrDefEnd

scr_seq_C08FS0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_C08FS0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 17
	ReleaseAll
	End

scr_seq_C08FS0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1157_C08FS0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C08FS0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1157_C08FS0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
