#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD09R0101.h"
#include "msgdata/msg/msg_1171_SD09R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD09R0101_000
	ScrDef scr_seq_SD09R0101_001
	ScrDef scr_seq_SD09R0101_002
	ScrDef scr_seq_SD09R0101_003
	ScrDef scr_seq_SD09R0101_004
	ScrDef scr_seq_SD09R0101_005
	ScrDef scr_seq_SD09R0101_006
	ScrDef scr_seq_SD09R0101_007
	ScrDef scr_seq_SD09R0101_008
	ScrDef scr_seq_SD09R0101_009
	ScrDef scr_seq_SD09R0101_010
	ScrDef scr_seq_SD09R0101_011
	ScrDef scr_seq_SD09R0101_012
	ScrDef scr_seq_SD09R0101_013
	ScrDefEnd

scr_seq_SD09R0101_000:
	SetFlag FLAG_SINNOH_2506
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _004B
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _004B
	SetFlag FLAG_SINNOH_668

_004B:
	End

scr_seq_SD09R0101_001:
	End

scr_seq_SD09R0101_002:
	End

scr_seq_SD09R0101_003:
	End

scr_seq_SD09R0101_004:
	End

scr_seq_SD09R0101_005:
	End

scr_seq_SD09R0101_006:
	End

scr_seq_SD09R0101_007:
	End

scr_seq_SD09R0101_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1171_SD09R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD09R0101_009:
	SetVar VAR_SPECIAL_x8008, 50
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0101_010:
	SetVar VAR_SPECIAL_x8008, 27
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0101_011:
	SetVar VAR_SPECIAL_x8008, 368
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0101_012:
	SetVar VAR_SPECIAL_x8008, 326
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD09R0101_013:
	SetVar VAR_SPECIAL_x8008, 52
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
