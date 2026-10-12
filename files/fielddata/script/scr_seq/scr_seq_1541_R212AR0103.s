#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R212AR0103.h"
#include "msgdata/msg/msg_1117_R212AR0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_R212AR0103_000
	ScrDef scr_seq_R212AR0103_001
	ScrDef scr_seq_R212AR0103_002
	ScrDef scr_seq_R212AR0103_003
	ScrDef scr_seq_R212AR0103_004
	ScrDef scr_seq_R212AR0103_005
	ScrDef scr_seq_R212AR0103_006
	ScrDefEnd

scr_seq_R212AR0103_000:
	// TODO Diamond ScrCmd_GetHour 0x268 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 0
	GoToIf 1, _004F
	CompareVarToValue 0x4000, 1
	GoToIf 1, _004F
	CompareVarToValue 0x4000, 5
	GoToIf 3, _005B
	GoTo _004F

_004F:
	ClearFlag FLAG_SINNOH_681
	SetVar VAR_SINNOH_4116, 0
	End

_005B:
	SetFlag FLAG_SINNOH_681
	SetVar VAR_SINNOH_4116, 1
	End

scr_seq_R212AR0103_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2722
	GoToIf 1, _0155
	CompareVarToValue 0x400B, 1
	GoToIf 1, _0155
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00AA
	GoTo _009F

_009F:
	NPCMsg msg_1117_R212AR0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00AA:
	NPCMsg msg_1117_R212AR0103_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D8
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00CD
	End

_00CD:
	NPCMsg msg_1117_R212AR0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D8:
	NPCMsg msg_1117_R212AR0103_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00FB
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00CD
	End

_00FB:
	// TODO Diamond ScrCmd_Unk01EC 0x1ec args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk01ED 0x1ed args [32768]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00DA 0x0da args [0, 32768, 0, 0]: no HeartGold mapping yet
	NPCMsg msg_1117_R212AR0103_00006
	GetPlayerCoords 0x8001, 0x8002
	ApplyMovement 2, mv_R212AR0103_01D4
	WaitMovement
	NPCMsg msg_1117_R212AR0103_00007
	ApplyMovement 1, mv_R212AR0103_01E4
	WaitMovement
	NPCMsg msg_1117_R212AR0103_00008
	NPCMsg msg_1117_R212AR0103_00009
	CloseMsg
	ApplyMovement 2, mv_R212AR0103_01F0
	WaitMovement
	HidePerson 2
	SetVar 0x400B, 1
	Call _016C
	SetFlag FLAG_SINNOH_2722
	GoTo _0155

_0155:
	// TODO Diamond ScrCmd_Unk01ED 0x1ed args [32768]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00DA 0x0da args [0, 32768, 0, 0]: no HeartGold mapping yet
	NPCMsg msg_1117_R212AR0103_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_016C:
	CompareVarToValue 0x8001, 4
	GoToIf 1, _0199
	CompareVarToValue 0x8001, 6
	GoToIf 1, _01A5
	CompareVarToValue 0x8002, 6
	GoToIf 1, _01B1
	GoTo _01BD

_0199:
	ApplyMovement 1, mv_R212AR0103_0204
	WaitMovement
	Return

_01A5:
	ApplyMovement 1, mv_R212AR0103_020C
	WaitMovement
	Return

_01B1:
	ApplyMovement 1, mv_R212AR0103_0214
	WaitMovement
	Return

_01BD:
	ApplyMovement 1, mv_R212AR0103_021C
	WaitMovement
	Return

scr_seq_R212AR0103_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0244
	GoTo _0270

_0244:
	CheckFlag FLAG_SINNOH_356
	GoToIf 1, _0270
	GoTo _0257

_0257:
	NPCMsg msg_1117_R212AR0103_00015
	SetFlag FLAG_SINNOH_356
	WaitButton
	CloseMsg
	ApplyMovement 2, mv_R212AR0103_01CC
	WaitMovement
	ReleaseAll
	End

_0270:
	CheckFlag FLAG_SINNOH_2722
	GoToIf 1, _0304
	CheckGameClearFlag 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02C8
	Random 0x800C, 2
	CompareVarToValue 0x800C, 0
	CallIf 1, _02BE
	CompareVarToValue 0x800C, 1
	CallIf 1, _02C3
	WaitButton
	CloseMsg
	ApplyMovement 2, mv_R212AR0103_01CC
	WaitMovement
	ReleaseAll
	End

_02BE:
	NPCMsg msg_1117_R212AR0103_00011
	Return

_02C3:
	NPCMsg msg_1117_R212AR0103_00012
	Return

_02C8:
	Random 0x800C, 2
	CompareVarToValue 0x800C, 0
	CallIf 1, _02FA
	CompareVarToValue 0x800C, 1
	CallIf 1, _02FF
	WaitButton
	CloseMsg
	ApplyMovement 2, mv_R212AR0103_01CC
	WaitMovement
	ReleaseAll
	End

_02FA:
	NPCMsg msg_1117_R212AR0103_00011
	Return

_02FF:
	NPCMsg msg_1117_R212AR0103_00013
	Return

_0304:
	// TODO Diamond ScrCmd_Unk01ED 0x1ed args [32768]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00DA 0x0da args [0, 32768, 0, 0]: no HeartGold mapping yet
	NPCMsg msg_1117_R212AR0103_00014
	WaitButton
	CloseMsg
	ApplyMovement 2, mv_R212AR0103_01CC
	WaitMovement
	ReleaseAll
	End

scr_seq_R212AR0103_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1117_R212AR0103_00016
	WaitButton
	CloseMsg
	ApplyMovement 3, mv_R212AR0103_0344
	WaitMovement
	ReleaseAll
	End

scr_seq_R212AR0103_004:
	LockAll
	ApplyMovement 3, mv_R212AR0103_034C
	WaitMovement
	NPCMsg msg_1117_R212AR0103_00017
	CloseMsg
	ApplyMovement obj_player, mv_R212AR0103_037C
	ApplyMovement 3, mv_R212AR0103_0344
	WaitMovement
	ReleaseAll
	End

scr_seq_R212AR0103_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1117_R212AR0103_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R212AR0103_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1117_R212AR0103_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_R212AR0103_01CC:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_01D4:
	.short 75, 1
	.short 65, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_01E4:
	.short 75, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_01F0:
	.short 13, 2
	.short 15, 1
	.short 1, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_0204:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_020C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_0214:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_021C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_0344:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_034C:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_R212AR0103_037C:
	.short 13, 1
	.short 0, 1
	EndMovement

	.balign 4, 0
