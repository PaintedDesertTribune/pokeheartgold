#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03R0401.h"
#include "msgdata/msg/msg_0908_SC03R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03R0401_000
	ScrDef scr_seq_SC03R0401_001
	ScrDef scr_seq_SC03R0401_002
	ScrDef scr_seq_SC03R0401_003
	ScrDef scr_seq_SC03R0401_004
	ScrDef scr_seq_SC03R0401_005
	ScrDef scr_seq_SC03R0401_006
	ScrDef scr_seq_SC03R0401_007
	ScrDef scr_seq_SC03R0401_008
	ScrDef scr_seq_SC03R0401_009
	ScrDef scr_seq_SC03R0401_010
	ScrDef scr_seq_SC03R0401_011
	ScrDef scr_seq_SC03R0401_012
	ScrDefEnd

scr_seq_SC03R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0908_SC03R0401_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_1
	GoToIf 1, _03CC
	NPCMsg msg_0908_SC03R0401_00001
	CheckFlag FLAG_SINNOH_121
	GoToIf 0, _0493
	CompareVarToValue VAR_SINNOH_40B4, 0
	GoToIf 5, _03E6
	// TODO Diamond ScrCmd_CountFossils 0x1f1 args [32768]: no HeartGold mapping yet
	CompareVarToValue 0x8000, 0
	GoToIf 1, _0488
	NPCMsg msg_0908_SC03R0401_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _03DB
	CompareVarToValue 0x8000, 1
	GoToIf 1, _03B0
	SetVar 0x8001, 0
	HasItem 103, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 101, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 102, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 99, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 100, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 104, 1, 0x800C
	AddVar 0x8001, 32780
	HasItem 105, 1, 0x800C
	AddVar 0x8001, 32780
	CompareVarToValue 0x8001, 1
	GoToIf 1, _03B0
	SetVar 0x8004, 0
	SetVar 0x8005, 0
	MenuInit 1, 1, 0, 1, 0x8003

_0132:
	CompareVarToValue 0x8005, 0
	CallIf 1, _02D0
	CompareVarToValue 0x8005, 1
	CallIf 1, _02E0
	CompareVarToValue 0x8005, 2
	CallIf 1, _02F0
	CompareVarToValue 0x8005, 3
	CallIf 1, _0300
	CompareVarToValue 0x8005, 4
	CallIf 1, _0310
	CompareVarToValue 0x8005, 5
	CallIf 1, _0320
	CompareVarToValue 0x8005, 6
	CallIf 1, _0330
	CompareVarToValue 0x800C, 0
	GoToIf 1, _020D
	CompareVarToValue 0x8004, 0
	CallIf 1, _0340
	CompareVarToValue 0x8004, 1
	CallIf 1, _0348
	CompareVarToValue 0x8004, 2
	CallIf 1, _0350
	CompareVarToValue 0x8004, 3
	CallIf 1, _0358
	CompareVarToValue 0x8004, 4
	CallIf 1, _0360
	CompareVarToValue 0x8004, 5
	CallIf 1, _0368
	CompareVarToValue 0x8004, 6
	CallIf 1, _0370
	CopyVar 0x8006, 0x8005
	AddVar 0x8006, 156
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	GoTo _0219

_020D:
	AddVar 0x8005, 1
	GoTo _0132

_0219:
	AddVar 0x8004, 1
	AddVar 0x8005, 1
	CompareVarToVar 0x8004, 0x8001
	GoToIf 5, _0132
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x8003, 255
	GoToIf 1, _03DB
	CompareVarToVar 0x8003, 0x4000
	GoToIf 1, _03DB
	CompareVarToValue 0x8003, 0
	CallIf 1, _0378
	CompareVarToValue 0x8003, 1
	CallIf 1, _0380
	CompareVarToValue 0x8003, 2
	CallIf 1, _0388
	CompareVarToValue 0x8003, 3
	CallIf 1, _0390
	CompareVarToValue 0x8003, 4
	CallIf 1, _0398
	CompareVarToValue 0x8003, 5
	CallIf 1, _03A0
	CompareVarToValue 0x8003, 6
	CallIf 1, _03A8
	// TODO Diamond ScrCmd_GetFossilPokemon 0x1f4 args [16564, 32770]: no HeartGold mapping yet
	CompareVarToValue VAR_SINNOH_40B4, 0
	GoToIf 1, _03DB
	TakeItem 0x8002, 1, 0x800C
	GoTo _03CC

_02D0:
	SetVar 0x4000, 103
	HasItem 0x4000, 1, 0x800C
	Return

_02E0:
	SetVar 0x4000, 101
	HasItem 0x4000, 1, 0x800C
	Return

_02F0:
	SetVar 0x4000, 102
	HasItem 0x4000, 1, 0x800C
	Return

_0300:
	SetVar 0x4000, 99
	HasItem 0x4000, 1, 0x800C
	Return

_0310:
	SetVar 0x4000, 100
	HasItem 0x4000, 1, 0x800C
	Return

_0320:
	SetVar 0x4000, 104
	HasItem 0x4000, 1, 0x800C
	Return

_0330:
	SetVar 0x4000, 105
	HasItem 0x4000, 1, 0x800C
	Return

_0340:
	CopyVar 0x4001, 0x4000
	Return

_0348:
	CopyVar 0x4002, 0x4000
	Return

_0350:
	CopyVar 0x4003, 0x4000
	Return

_0358:
	CopyVar 0x4004, 0x4000
	Return

_0360:
	CopyVar 0x4005, 0x4000
	Return

_0368:
	CopyVar 0x4006, 0x4000
	Return

_0370:
	CopyVar 0x4007, 0x4000
	Return

_0378:
	CopyVar 0x8002, 0x4001
	Return

_0380:
	CopyVar 0x8002, 0x4002
	Return

_0388:
	CopyVar 0x8002, 0x4003
	Return

_0390:
	CopyVar 0x8002, 0x4004
	Return

_0398:
	CopyVar 0x8002, 0x4005
	Return

_03A0:
	CopyVar 0x8002, 0x4006
	Return

_03A8:
	CopyVar 0x8002, 0x4007
	Return

_03B0:
	// TODO Diamond ScrCmd_GetFossilMinimumAmount 0x1f5 args [32770, 32772, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetFossilPokemon 0x1f4 args [16564, 32770]: no HeartGold mapping yet
	TakeItem 0x8002, 1, 0x800C
	GoTo _03CC

_03CC:
	SetFlag FLAG_SINNOH_1
	NPCMsg msg_0908_SC03R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03DB:
	NPCMsg msg_0908_SC03R0401_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03E6:
	// TODO Diamond ScrCmd_Unk00DA 0x0da args [0, 16564, 0, 0]: no HeartGold mapping yet
	NPCMsg msg_0908_SC03R0401_00007
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _047D
	// TODO Diamond ScrCmd_Unk00DA 0x0da args [1, 16564, 0, 0]: no HeartGold mapping yet
	BufferPlayersName 0
	PlaySE 1158
	NPCMsg msg_0908_SC03R0401_00008
	WaitSE 1158
	GiveMon VAR_SINNOH_40B4, 20, 0, 0, 0, 0x800C
	SetVar VAR_SINNOH_40B4, 0
	NPCMsg msg_0908_SC03R0401_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0449
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0477
	End

_0449:
	CloseMsg
	GetPartyCount 0x4000
	SubVar 0x4000, 1
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_NamePokemonScreen 0x0bb args [16384, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_0477:
	CloseMsg
	ReleaseAll
	End

_047D:
	NPCMsg msg_0908_SC03R0401_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0488:
	NPCMsg msg_0908_SC03R0401_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0493:
	NPCMsg msg_0908_SC03R0401_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0908_SC03R0401_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0908_SC03R0401_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0908_SC03R0401_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_007:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_008:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_009:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_010:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_011:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03R0401_012:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0908_SC03R0401_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
