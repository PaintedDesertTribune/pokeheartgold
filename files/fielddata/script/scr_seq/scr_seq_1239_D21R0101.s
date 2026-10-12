#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D21R0101.h"
#include "msgdata/msg/msg_0966_D21R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D21R0101_000
	ScrDef scr_seq_D21R0101_001
	ScrDef scr_seq_D21R0101_002
	ScrDef scr_seq_D21R0101_003
	ScrDef scr_seq_D21R0101_004
	ScrDef scr_seq_D21R0101_005
	ScrDefEnd

scr_seq_D21R0101_000:
	SetFlag FLAG_SINNOH_2519
	CheckFlag FLAG_SINNOH_228
	GoToIf 0, _002B
	End

_002B:
	SetVar VAR_SINNOH_4091, 0
	End

scr_seq_D21R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_RideBike 0x0c8 args [0]: no HeartGold mapping yet
	CompareVarToValue VAR_SINNOH_4091, 1
	GoToIf 4, _009D
	BufferPlayersName 0
	CheckFlag FLAG_SINNOH_224
	CallIf 0, _0093
	CheckFlag FLAG_SINNOH_224
	CallIf 1, _0098
	BufferPlayersName 0
	PlaySE 1153
	NPCMsg msg_0966_D21R0101_00001
	WaitSE 1153
	SetFlag FLAG_SINNOH_224
	SetVar VAR_SINNOH_4091, 1
	NPCMsg msg_0966_D21R0101_00002
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_403F, 612
	// TODO Diamond ScrCmd_Unk0161 0x161 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetEventMovement 0x06d args [4, 48]: no HeartGold mapping yet
	ReleaseAll
	End

_0093:
	NPCMsg msg_0966_D21R0101_00000
	Return

_0098:
	NPCMsg msg_0966_D21R0101_00003
	Return

_009D:
	CompareVarToValue VAR_SINNOH_40E2, 2
	GoToIf 4, _00CC
	CompareVarToValue VAR_SINNOH_40E2, 1
	GoToIf 1, _00C3
	BufferPlayersName 0
	NPCMsg msg_0966_D21R0101_00009
	GoTo _00DA

_00C3:
	NPCMsg msg_0966_D21R0101_00010
	GoTo _00DA

_00CC:
	BufferPlayersName 0
	NPCMsg msg_0966_D21R0101_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DA:
	AddVar VAR_SINNOH_40E2, 1
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D21R0101_002:
	End

scr_seq_D21R0101_003:
	LockAll
	// TODO Diamond ScrCmd_Unk0162 0x162 args []: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetEventMovement 0x06d args [4, 16]: no HeartGold mapping yet
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 2
	GoToIf 1, _010B
	GoTo _0123

_010B:
	ApplyMovement obj_player, mv_D21R0101_019C
	ApplyMovement 4, mv_D21R0101_01E0
	WaitMovement
	GoTo _013B

_0123:
	ApplyMovement obj_player, mv_D21R0101_01A4
	ApplyMovement 4, mv_D21R0101_01EC
	WaitMovement
	GoTo _013B

_013B:
	BufferPlayersName 0
	NPCMsg msg_0966_D21R0101_00005
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 3
	GoToIf 1, _015A
	GoTo _0172

_015A:
	ApplyMovement obj_player, mv_D21R0101_01AC
	ApplyMovement 4, mv_D21R0101_01F8
	WaitMovement
	GoTo _018A

_0172:
	ApplyMovement obj_player, mv_D21R0101_01B8
	ApplyMovement 4, mv_D21R0101_0208
	WaitMovement
	GoTo _018A

_018A:
	HidePerson 4
	SetFlag FLAG_SINNOH_228
	SetVar VAR_SINNOH_4091, 2
	ReleaseAll
	End

scr_seq_D21R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0966_D21R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D21R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0966_D21R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_D21R0101_019C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01A4:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01AC:
	.short 12, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01B8:
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01E0:
	.short 34, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01EC:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_01F8:
	.short 63, 3
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D21R0101_0208:
	.short 63, 3
	.short 13, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
