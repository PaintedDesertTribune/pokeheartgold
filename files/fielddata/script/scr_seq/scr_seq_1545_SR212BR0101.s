#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR212BR0101.h"
#include "msgdata/msg/msg_1119_SR212BR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR212BR0101_000
	ScrDef scr_seq_SR212BR0101_001
	ScrDef scr_seq_SR212BR0101_002
	ScrDef scr_seq_SR212BR0101_003
	ScrDefEnd

scr_seq_SR212BR0101_000:
	SetFlag FLAG_SINNOH_2540
	End

scr_seq_SR212BR0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1119_SR212BR0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212BR0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	Call _0534
	CompareVarToValue 0x8000, 0
	GoToIf 1, _05B0
	NPCMsg msg_1119_SR212BR0101_00002
	CopyVar 0x8008, 0x8000
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0100
	CompareVarToValue 0x8008, 2
	GoToIf 1, _012D
	CompareVarToValue 0x8008, 4
	GoToIf 1, _015A
	CompareVarToValue 0x8008, 8
	GoToIf 1, _0187
	CompareVarToValue 0x8008, 3
	GoToIf 1, _01B4
	CompareVarToValue 0x8008, 5
	GoToIf 1, _01F2
	CompareVarToValue 0x8008, 9
	GoToIf 1, _0230
	CompareVarToValue 0x8008, 6
	GoToIf 1, _026E
	CompareVarToValue 0x8008, 10
	GoToIf 1, _02AC
	CompareVarToValue 0x8008, 12
	GoToIf 1, _02EA
	CompareVarToValue 0x8008, 7
	GoToIf 1, _0328
	CompareVarToValue 0x8008, 11
	GoToIf 1, _0377
	CompareVarToValue 0x8008, 14
	GoToIf 1, _03C6
	GoTo _0415

_0100:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 44, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	GoTo _04F1

_012D:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 210, 0
	ScrCmd_066 44, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0494
	GoTo _04F1

_015A:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 211, 0
	ScrCmd_066 44, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _04B3
	GoTo _04F1

_0187:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 212, 0
	ScrCmd_066 44, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _04D2
	GoTo _04F1

_01B4:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 210, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0494
	GoTo _04F1

_01F2:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 211, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04B3
	GoTo _04F1

_0230:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 212, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04D2
	GoTo _04F1

_026E:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 210, 0
	ScrCmd_066 211, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04B3
	GoTo _04F1

_02AC:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 210, 0
	ScrCmd_066 212, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04D2
	GoTo _04F1

_02EA:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 211, 0
	ScrCmd_066 212, 1
	ScrCmd_066 44, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _04B3
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04D2
	GoTo _04F1

_0328:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 210, 1
	ScrCmd_066 211, 2
	ScrCmd_066 44, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 2
	GoToIf 1, _04B3
	GoTo _04F1

_0377:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 210, 1
	ScrCmd_066 212, 2
	ScrCmd_066 44, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 2
	GoToIf 1, _04D2
	GoTo _04F1

_03C6:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 210, 0
	ScrCmd_066 211, 1
	ScrCmd_066 212, 2
	ScrCmd_066 44, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 1
	GoToIf 1, _04B3
	CompareVarToValue 0x8008, 2
	GoToIf 1, _04D2
	GoTo _04F1

_0415:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 209, 0
	ScrCmd_066 210, 1
	ScrCmd_066 211, 2
	ScrCmd_066 212, 3
	ScrCmd_066 44, 4
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0475
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0494
	CompareVarToValue 0x8008, 2
	GoToIf 1, _04B3
	CompareVarToValue 0x8008, 3
	GoToIf 1, _04D2
	GoTo _04F1

_0475:
	BufferItemName 0, 338
	BufferTMHMMoveName 1, 338
	SetVar 0x8004, 338
	SetVar 0x8006, 72
	NPCMsg msg_1119_SR212BR0101_00003
	GoTo _04FC

_0494:
	BufferItemName 0, 345
	BufferTMHMMoveName 1, 345
	SetVar 0x8004, 345
	SetVar 0x8006, 73
	NPCMsg msg_1119_SR212BR0101_00004
	GoTo _04FC

_04B3:
	BufferItemName 0, 364
	BufferTMHMMoveName 1, 364
	SetVar 0x8004, 364
	SetVar 0x8006, 74
	NPCMsg msg_1119_SR212BR0101_00005
	GoTo _04FC

_04D2:
	BufferItemName 0, 334
	BufferTMHMMoveName 1, 334
	SetVar 0x8004, 334
	SetVar 0x8006, 75
	NPCMsg msg_1119_SR212BR0101_00006
	GoTo _04FC

_04F1:
	NPCMsg msg_1119_SR212BR0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04FC:
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0529
	TakeItem 0x8006, 10, 0x800C
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0529:
	NPCMsg msg_1119_SR212BR0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0534:
	SetVar 0x8000, 0
	HasItem 72, 10, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _0590
	HasItem 73, 10, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _0598
	HasItem 74, 10, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _05A0
	HasItem 75, 10, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _05A8
	Return

_0590:
	AddVar 0x8000, 1
	Return

_0598:
	AddVar 0x8000, 2
	Return

_05A0:
	AddVar 0x8000, 4
	Return

_05A8:
	AddVar 0x8000, 8
	Return

_05B0:
	NPCMsg msg_1119_SR212BR0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212BR0101_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1119_SR212BR0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
