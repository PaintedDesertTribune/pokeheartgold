#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0202.h"
#include "msgdata/msg/msg_1061_SC07R0202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0202_000
	ScrDef scr_seq_SC07R0202_001
	ScrDef scr_seq_SC07R0202_002
	ScrDef scr_seq_SC07R0202_003
	ScrDef scr_seq_SC07R0202_004
	ScrDef scr_seq_SC07R0202_005
	ScrDef scr_seq_SC07R0202_006
	ScrDefEnd

scr_seq_SC07R0202_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_Unk027E 0x27e args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005F
	NPCMsg msg_1061_SC07R0202_00000
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 229, 1
	ScrCmd_066 228, 0
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C2
	GoTo _00B7

_005F:
	BufferPlayersName 0
	NPCMsg msg_1061_SC07R0202_00001
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 229, 0
	ScrCmd_066 228, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x800C, 0
	GoToIf 5, _00B7
	Random 0x800C, 4
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00C2
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00CD
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00D8
	GoTo _00E3

_00B7:
	NPCMsg msg_1061_SC07R0202_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C2:
	NPCMsg msg_1061_SC07R0202_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CD:
	NPCMsg msg_1061_SC07R0202_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D8:
	NPCMsg msg_1061_SC07R0202_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E3:
	NPCMsg msg_1061_SC07R0202_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0202_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1061_SC07R0202_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0202_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1061_SC07R0202_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0202_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0158
	NPCMsg msg_1061_SC07R0202_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0163
	NPCMsg msg_1061_SC07R0202_00010
	SetVar 0x8004, 10
	CallStd 2009 /* TODO Diamond std script */
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0158:
	NPCMsg msg_1061_SC07R0202_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0163:
	NPCMsg msg_1061_SC07R0202_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0202_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 10
	ReleaseAll
	End

scr_seq_SC07R0202_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 11
	ReleaseAll
	End

scr_seq_SC07R0202_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1061_SC07R0202_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
