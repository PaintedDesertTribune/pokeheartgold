#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11FS0101.h"
#include "msgdata/msg/msg_1214_SC11FS0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC11FS0101_000
	ScrDef scr_seq_SC11FS0101_001
	ScrDef scr_seq_SC11FS0101_002
	ScrDef scr_seq_SC11FS0101_003
	ScrDefEnd

scr_seq_SC11FS0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_SC11FS0101_001:
	End

scr_seq_SC11FS0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_213
	GoToIf 1, _0071
	NPCMsg msg_1214_SC11FS0101_00000
	SetVar 0x8004, 232
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _007C
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_213
	GoTo _0071

_0071:
	NPCMsg msg_1214_SC11FS0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007C:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11FS0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1214_SC11FS0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
