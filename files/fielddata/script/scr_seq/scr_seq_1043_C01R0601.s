#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C01R0601.h"
#include "msgdata/msg/msg_0868_C01R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C01R0601_000
	ScrDef scr_seq_C01R0601_001
	ScrDef scr_seq_C01R0601_002
	ScrDef scr_seq_C01R0601_003
	ScrDef scr_seq_C01R0601_004
	ScrDef scr_seq_C01R0601_005
	ScrDef scr_seq_C01R0601_006
	ScrDef scr_seq_C01R0601_007
	ScrDef scr_seq_C01R0601_008
	ScrDef scr_seq_C01R0601_009
	ScrDef scr_seq_C01R0601_010
	ScrDefEnd

scr_seq_C01R0601_010:
	CompareVarToValue VAR_SINNOH_40D5, 6
	CallIf 1, _003D
	End

_003D:
	ShowPerson 255
	Return

scr_seq_C01R0601_009:
	LockAll
	Call _004F
	ReleaseAll
	End

_004F:
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	Call _009D
	HidePerson 255
	ApplyMovement obj_player, mv_C01R0601_00B0
	WaitMovement
	Call _00A5
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	Call _009D
	ApplyMovement obj_player, mv_C01R0601_00C0
	WaitMovement
	Call _00A5
	SetVar VAR_SINNOH_40D5, 0
	Return

_009D:
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	Return

_00A5:
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	Return

scr_seq_C01R0601_000:
	End

scr_seq_C01R0601_001:
	End

scr_seq_C01R0601_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x800C, 0   // Diamond ScrCmd_CheckPartyForBadEgg: result fixed
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0340
	CheckFlag FLAG_SINNOH_195
	GoToIf 1, _02D3
	SetFlag FLAG_SINNOH_195
	NPCMsg msg_0868_C01R0601_00000
	GoTo _00FF

_00FF:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 129, 0
	ScrCmd_066 128, 1
	ScrCmd_066 130, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _01C1
	CompareVarToValue 0x8008, 1
	GoToIf 1, _014A
	CompareVarToValue 0x8008, 2
	GoToIf 1, _02C2
	GoTo _02C2

_014A:
	NPCMsg msg_0868_C01R0601_00002
	GoTo _0155

_0155:
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 131, 0
	ScrCmd_066 132, 1
	ScrCmd_066 133, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _01A0
	CompareVarToValue 0x8008, 1
	GoToIf 1, _01AB
	CompareVarToValue 0x8008, 2
	GoToIf 1, _01B6
	GoTo _01B6

_01A0:
	NPCMsg msg_0868_C01R0601_00003
	GoTo _0155

_01AB:
	NPCMsg msg_0868_C01R0601_00004
	GoTo _0155

_01B6:
	NPCMsg msg_0868_C01R0601_00005
	GoTo _00FF

_01C1:
	PartyCountNotEgg 0x800C
	CompareVarToValue 0x800C, 2
	GoToIf 0, _01DA
	GoTo _02DE

_01DA:
	NPCMsg msg_0868_C01R0601_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E5:
	CallStd 2006 /* TODO Diamond std script */
	CopyVar 0x800C, 0x4000
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02C2
	HealParty
	SetVar VAR_SINNOH_40D5, 6
	NPCMsg msg_0868_C01R0601_00007
	CloseMsg
	ApplyMovement obj_player, mv_C01R0601_031C
	WaitMovement
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	Call _009D
	ApplyMovement obj_player, mv_C01R0601_0330
	WaitMovement
	Call _00A5
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	Call _009D
	ApplyMovement obj_player, mv_C01R0601_0328
	WaitMovement
	ShowPerson 255
	ApplyMovement obj_player, mv_C01R0601_0338
	WaitMovement
	Call _00A5
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk02B2 0x2b2 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00B3 0x0b3 args [32780]: no HeartGold mapping yet
	CopyVar 0x8004, 0x800C
	// TODO Diamond ScrCmd_Unk00B2 0x0b2 args [32772, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02A6
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	Call _004F
	ReleaseAll
	End

_02A6:
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	Call _004F
	GoTo _02C2

_02C2:
	SetVar VAR_SINNOH_40D5, 0
	NPCMsg msg_0868_C01R0601_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02D3:
	NPCMsg msg_0868_C01R0601_00001
	GoTo _00FF

_02DE:
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _02F7
	GoTo _01E5

_02F7:
	SetVar 0x800C, 1   // Diamond ScrCmd_CountPCFreeSpace: result fixed
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0310
	GoTo _01E5

_0310:
	NPCMsg msg_0868_C01R0601_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0340:
	CallStd 9016 /* TODO Diamond std script */
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C01R0601_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0868_C01R0601_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_C01R0601_00B0:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_C01R0601_00C0:
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_C01R0601_031C:
	.short 15, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_C01R0601_0328:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_C01R0601_0330:
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_C01R0601_0338:
	.short 1, 1
	EndMovement

	.balign 4, 0
