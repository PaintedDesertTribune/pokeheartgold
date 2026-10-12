#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0205.h"
#include "msgdata/msg/msg_1064_SC07R0205.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0205_000
	ScrDef scr_seq_SC07R0205_001
	ScrDef scr_seq_SC07R0205_002
	ScrDef scr_seq_SC07R0205_003
	ScrDef scr_seq_SC07R0205_004
	ScrDef scr_seq_SC07R0205_005
	ScrDefEnd

scr_seq_SC07R0205_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1064_SC07R0205_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0205_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1064_SC07R0205_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0205_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_261
	GoToIf 1, _0087
	NPCMsg msg_1064_SC07R0205_00002
	SetVar 0x8004, 288
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0092
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_261
	GoTo _0087

_0087:
	NPCMsg msg_1064_SC07R0205_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0092:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0205_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1064_SC07R0205_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0205_004:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1064_SC07R0205_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0205_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1064_SC07R0205_00006
	ShowMoneyBox 20, 2
	GoTo _00D5

_00D5:
	MenuInit 1, 1, 0, 1, 0x8000
	ScrCmd_066 219, 0
	ScrCmd_066 220, 1
	ScrCmd_066 221, 2
	ScrCmd_066 222, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x8000
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0125
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0131
	CompareVarToValue 0x8008, 2
	GoToIf 1, _013D
	NPCMsg msg_1064_SC07R0205_00010
	GoTo _027A

_0125:
	SetVar 0x8001, 30
	GoTo _017F

_0131:
	SetVar 0x8001, 31
	GoTo _017F

_013D:
	SetVar 0x8001, 32
	GoTo _017F

_0149:
	HasEnoughMoneyImmediate 0x800C, 200
	Return

_0153:
	HasEnoughMoneyImmediate 0x800C, 300
	Return

_015D:
	HasEnoughMoneyImmediate 0x800C, 350
	Return

_0167:
	SubMoneyImmediate 200
	Return

_016F:
	SubMoneyImmediate 300
	Return

_0177:
	SubMoneyImmediate 350
	Return

_017F:
	CompareVarToValue 0x8000, 0
	CallIf 1, _0149
	CompareVarToValue 0x8000, 1
	CallIf 1, _0153
	CompareVarToValue 0x8000, 2
	CallIf 1, _015D
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0265
	HasSpaceForItem 0x8001, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _026E
	CompareVarToValue 0x8000, 0
	CallIf 1, _0167
	CompareVarToValue 0x8000, 1
	CallIf 1, _016F
	CompareVarToValue 0x8000, 2
	CallIf 1, _0177
	UpdateMoneyBox
	BufferItemName 0, 0x8001
	PlayFanfare 1559
	BufferItemName 0, 0x8001
	NPCMsg msg_1064_SC07R0205_00007
	CopyVar 0x8004, 0x8001
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	Random 0x800C, 64
	CompareVarToValue 0x800C, 0
	GoToIf 5, _025C
	HasSpaceForItem 0x8001, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _026E
	PlayFanfare 1559
	BufferItemName 0, 0x8001
	NPCMsg msg_1064_SC07R0205_00008
	CopyVar 0x8004, 0x8001
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	GoTo _025C

_025C:
	NPCMsg msg_1064_SC07R0205_00006
	GoTo _00D5

_0265:
	NPCMsg msg_1064_SC07R0205_00009
	GoTo _027A

_026E:
	CallStd std_bag_is_full
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_027A:
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End



	.balign 4, 0
