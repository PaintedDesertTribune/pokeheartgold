#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10PC0101.h"
#include "msgdata/msg/msg_1177_SC10PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10PC0101_000
	ScrDef scr_seq_SC10PC0101_001
	ScrDef scr_seq_SC10PC0101_002
	ScrDef scr_seq_SC10PC0101_003
	ScrDef scr_seq_SC10PC0101_004
	ScrDef scr_seq_SC10PC0101_005
	ScrDefEnd

scr_seq_SC10PC0101_003:
	SetFlag FLAG_SINNOH_2496
	End

scr_seq_SC10PC0101_000:
	SetVar 0x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_SC10PC0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_SC10PC0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 48
	ReleaseAll
	End

scr_seq_SC10PC0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1177_SC10PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC10PC0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1177_SC10PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
