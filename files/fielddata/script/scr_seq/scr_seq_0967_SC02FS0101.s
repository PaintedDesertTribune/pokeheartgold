#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02FS0101.h"
#include "msgdata/msg/msg_0830_SC02FS0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02FS0101_000
	ScrDef scr_seq_SC02FS0101_001
	ScrDef scr_seq_SC02FS0101_002
	ScrDef scr_seq_SC02FS0101_003
	ScrDefEnd

scr_seq_SC02FS0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_SC02FS0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 46
	ReleaseAll
	End

scr_seq_SC02FS0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferItemName 0, 24
	NPCMsg msg_0830_SC02FS0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02FS0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferItemName 0, 57
	NPCMsg msg_0830_SC02FS0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
