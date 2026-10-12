#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T05R0201.h"
#include "msgdata/msg/msg_1049_T05R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T05R0201_000
	ScrDef scr_seq_T05R0201_001
	ScrDef scr_seq_T05R0201_002
	ScrDef scr_seq_T05R0201_003
	ScrDefEnd

scr_seq_T05R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1049_T05R0201_00000
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_T05R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	MartBuy 1
	ReleaseAll
	End

scr_seq_T05R0201_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 14
	ReleaseAll
	End

scr_seq_T05R0201_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1049_T05R0201_00001
	// TODO Diamond ScrCmd_GetHour 0x268 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 4
	GoToIf 0, _0113
	CompareVarToValue 0x800C, 10
	GoToIf 0, _0093
	CompareVarToValue 0x800C, 20
	GoToIf 0, _00D3
	GoTo _0113

_0093:
	CheckFlag FLAG_SINNOH_308
	GoToIf 1, _0153
	NPCMsg msg_1049_T05R0201_00002
	SetVar 0x8004, 297
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0174
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_308
	NPCMsg msg_1049_T05R0201_00003
	GoTo _0153

_00D3:
	CheckFlag FLAG_SINNOH_309
	GoToIf 1, _015E
	NPCMsg msg_1049_T05R0201_00002
	SetVar 0x8004, 240
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0174
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_309
	NPCMsg msg_1049_T05R0201_00004
	GoTo _015E

_0113:
	CheckFlag FLAG_SINNOH_310
	GoToIf 1, _0169
	NPCMsg msg_1049_T05R0201_00002
	SetVar 0x8004, 267
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0174
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_310
	NPCMsg msg_1049_T05R0201_00005
	GoTo _0169

_0153:
	NPCMsg msg_1049_T05R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015E:
	NPCMsg msg_1049_T05R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0169:
	NPCMsg msg_1049_T05R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0174:
	NPCMsg msg_1049_T05R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
