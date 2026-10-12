#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T05R0101.h"
#include "msgdata/msg/msg_1050_T05R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T05R0101_000
	ScrDef scr_seq_T05R0101_001
	ScrDef scr_seq_T05R0101_002
	ScrDef scr_seq_T05R0101_003
	ScrDef scr_seq_T05R0101_004
	ScrDef scr_seq_T05R0101_005
	ScrDefEnd

scr_seq_T05R0101_004:
	End

scr_seq_T05R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1050_T05R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0060
	CheckBadge 4, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A8
	NPCMsg msg_1050_T05R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	NPCMsg msg_1050_T05R0101_00003
	// TODO Diamond ScrCmd_GetGameVersion 0x246 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 10
	CallIf 1, _0092
	CompareVarToValue 0x800C, 11
	CallIf 1, _009D
	// TODO Diamond ScrCmd_Unk0209 0x209 args []: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_325
	NPCMsg msg_1050_T05R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0092:
	// TODO Diamond ScrCmd_ShowPokemonPic 0x208 args [484, 0]: no HeartGold mapping yet
	NPCMsg msg_1050_T05R0101_00004
	Return

_009D:
	// TODO Diamond ScrCmd_ShowPokemonPic 0x208 args [483, 0]: no HeartGold mapping yet
	NPCMsg msg_1050_T05R0101_00005
	Return

_00A8:
	NPCMsg msg_1050_T05R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1050_T05R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0101_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1050_T05R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T05R0101_005:
	BufferPlayersName 0
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1050_T05R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
