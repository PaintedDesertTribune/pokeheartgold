#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11R0101.h"
#include "msgdata/msg/msg_1219_SC11R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC11R0101_000
	ScrDef scr_seq_SC11R0101_001
	ScrDef scr_seq_SC11R0101_002
	ScrDef scr_seq_SC11R0101_003
	ScrDef scr_seq_SC11R0101_004
	ScrDef scr_seq_SC11R0101_005
	ScrDef scr_seq_SC11R0101_006
	ScrDefEnd

scr_seq_SC11R0101_006:
	SetFlag FLAG_SINNOH_2533
	End

scr_seq_SC11R0101_000:
	LockAll
	SetVar VAR_SINNOH_4113, 1
	SetFlag FLAG_SINNOH_686
	SetFlag FLAG_SINNOH_687
	Call _01C6
	NPCMsg msg_1219_SC11R0101_00000
	CloseMsg
	Call _01F2
	NPCMsg msg_1219_SC11R0101_00001
	SetVar 0x8004, 432
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	NPCMsg msg_1219_SC11R0101_00002
	NPCMsg msg_1219_SC11R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC11R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1219_SC11R0101_00003

_0071:
	NPCMsg msg_1219_SC11R0101_00004
	// TODO Diamond ScrCmd_Unk0041 0x041 args [31, 9, 0, 1, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	ScrCmd_066 20, 0
	ScrCmd_066 21, 1
	ScrCmd_066 22, 2
	ScrCmd_066 19, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _00C9
	CompareVarToValue 0x8008, 1
	GoToIf 1, _00D2
	CompareVarToValue 0x8008, 2
	GoToIf 1, _00DB
	NPCMsg msg_1219_SC11R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	NPCMsg msg_1219_SC11R0101_00005
	GoTo _0071

_00D2:
	NPCMsg msg_1219_SC11R0101_00006
	GoTo _0071

_00DB:
	NPCMsg msg_1219_SC11R0101_00007
	GoTo _0071

scr_seq_SC11R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1219_SC11R0101_00008

_00EF:
	NPCMsg msg_1219_SC11R0101_00009
	// TODO Diamond ScrCmd_Unk0041 0x041 args [31, 11, 0, 1, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	ScrCmd_066 23, 0
	ScrCmd_066 24, 1
	ScrCmd_066 19, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0136
	CompareVarToValue 0x8008, 1
	GoToIf 1, _013F
	NPCMsg msg_1219_SC11R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0136:
	NPCMsg msg_1219_SC11R0101_00010
	GoTo _00EF

_013F:
	NPCMsg msg_1219_SC11R0101_00011
	GoTo _00EF

scr_seq_SC11R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1219_SC11R0101_00012

_0153:
	NPCMsg msg_1219_SC11R0101_00013
	// TODO Diamond ScrCmd_Unk0041 0x041 args [31, 9, 0, 1, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	ScrCmd_066 25, 0
	ScrCmd_066 26, 1
	ScrCmd_066 27, 2
	ScrCmd_066 19, 3
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _01AB
	CompareVarToValue 0x8008, 1
	GoToIf 1, _01B4
	CompareVarToValue 0x8008, 2
	GoToIf 1, _01BD
	NPCMsg msg_1219_SC11R0101_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AB:
	NPCMsg msg_1219_SC11R0101_00014
	GoTo _0153

_01B4:
	NPCMsg msg_1219_SC11R0101_00015
	GoTo _0153

_01BD:
	NPCMsg msg_1219_SC11R0101_00016
	GoTo _0153

_01C6:
	ApplyMovement 1, mv_SC11R0101_0228
	ApplyMovement 0, mv_SC11R0101_0228
	ApplyMovement 5, mv_SC11R0101_0228
	ApplyMovement 2, mv_SC11R0101_0228
	ApplyMovement 3, mv_SC11R0101_0228
	WaitMovement
	Return

_01F2:
	ApplyMovement 1, mv_SC11R0101_0230
	ApplyMovement 0, mv_SC11R0101_0230
	ApplyMovement 5, mv_SC11R0101_0238
	ApplyMovement 2, mv_SC11R0101_0230
	ApplyMovement 3, mv_SC11R0101_0238
	ApplyMovement obj_player, mv_SC11R0101_0240
	WaitMovement
	Return

scr_seq_SC11R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1219_SC11R0101_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1219_SC11R0101_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC11R0101_0228:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC11R0101_0230:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SC11R0101_0238:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SC11R0101_0240:
	.short 12, 4
	.short 14, 1
	EndMovement

	.balign 4, 0
