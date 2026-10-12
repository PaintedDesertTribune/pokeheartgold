#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0201.h"
#include "msgdata/msg/msg_0996_SC05R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0201_000
	ScrDef scr_seq_SC05R0201_001
	ScrDef scr_seq_SC05R0201_002
	ScrDef scr_seq_SC05R0201_003
	ScrDef scr_seq_SC05R0201_004
	ScrDef scr_seq_SC05R0201_005
	ScrDefEnd

scr_seq_SC05R0201_005:
	// TODO unknown Diamond command ScrCmd_Unk0238 (0x238); script truncated here
	End

scr_seq_SC05R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_141
	GoToIf 1, _0083
	NPCMsg msg_0996_SC05R0201_00000
	SetVar 0x8004, 449
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _008E
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_141
	NPCMsg msg_0996_SC05R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0083:
	NPCMsg msg_0996_SC05R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_008E:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x8000
	BufferPartyMonNick 0, 0x8000
	NPCMsg msg_0996_SC05R0201_00003
	MonGetFriendship 0x800C, 0x8000
	CompareVarToValue 0x800C, 255
	GoToIf 4, _0108
	CompareVarToValue 0x800C, 200
	GoToIf 4, _0113
	CompareVarToValue 0x800C, 150
	GoToIf 4, _011E
	CompareVarToValue 0x800C, 100
	GoToIf 4, _0129
	CompareVarToValue 0x800C, 50
	GoToIf 4, _0134
	CompareVarToValue 0x800C, 1
	GoToIf 4, _013F
	GoTo _014A

_0108:
	NPCMsg msg_0996_SC05R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0113:
	NPCMsg msg_0996_SC05R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011E:
	NPCMsg msg_0996_SC05R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0129:
	NPCMsg msg_0996_SC05R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0134:
	NPCMsg msg_0996_SC05R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013F:
	NPCMsg msg_0996_SC05R0201_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014A:
	NPCMsg msg_0996_SC05R0201_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0201_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 54, 0
	NPCMsg msg_0996_SC05R0201_00011
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0201_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 427, 0
	NPCMsg msg_0996_SC05R0201_00012
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05R0201_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_0996_SC05R0201_00013
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
