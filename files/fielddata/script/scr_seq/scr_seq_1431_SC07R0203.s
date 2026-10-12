#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0203.h"
#include "msgdata/msg/msg_1062_SC07R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0203_000
	ScrDef scr_seq_SC07R0203_001
	ScrDef scr_seq_SC07R0203_002
	ScrDef scr_seq_SC07R0203_003
	ScrDef scr_seq_SC07R0203_004
	ScrDef scr_seq_SC07R0203_005
	ScrDefEnd

scr_seq_SC07R0203_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_Unk027E 0x27e args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	NPCMsg msg_1062_SC07R0203_00000
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 229, 1
	ScrCmd_066 228, 0
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00BE
	GoTo _00B3

_005B:
	BufferPlayersName 0
	NPCMsg msg_1062_SC07R0203_00001
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 229, 0
	ScrCmd_066 228, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x800C, 0
	GoToIf 5, _00B3
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [32780, 4]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BE
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C9
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00D4
	GoTo _00DF

_00B3:
	NPCMsg msg_1062_SC07R0203_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_1062_SC07R0203_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	NPCMsg msg_1062_SC07R0203_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D4:
	NPCMsg msg_1062_SC07R0203_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	NPCMsg msg_1062_SC07R0203_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1062_SC07R0203_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1062_SC07R0203_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 12
	ReleaseAll
	End

scr_seq_SC07R0203_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CallStd 2019 /* TODO Diamond std script */
	CloseMsg
	SpecialMartBuy 13
	ReleaseAll
	End

scr_seq_SC07R0203_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1062_SC07R0203_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
