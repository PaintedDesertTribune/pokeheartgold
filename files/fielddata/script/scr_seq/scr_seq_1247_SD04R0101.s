#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD04R0101.h"
#include "msgdata/msg/msg_0970_SD04R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD04R0101_000
	ScrDef scr_seq_SD04R0101_001
	ScrDef scr_seq_SD04R0101_002
	ScrDef scr_seq_SD04R0101_003
	ScrDef scr_seq_SD04R0101_004
	ScrDef scr_seq_SD04R0101_005
	ScrDefEnd

scr_seq_SD04R0101_000:
	SetFlag FLAG_SINNOH_2501
	End

scr_seq_SD04R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_312
	GoToIf 1, _005F
	NPCMsg msg_0970_SD04R0101_00000
	SetVar 0x8004, 82
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0055
	SetFlag FLAG_SINNOH_312
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0055:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_005F:
	NPCMsg msg_0970_SD04R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD04R0101_002:
	SetVar VAR_SPECIAL_x8008, 362
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD04R0101_003:
	SetVar VAR_SPECIAL_x8008, 19
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD04R0101_004:
	SetVar VAR_SPECIAL_x8008, 315
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD04R0101_005:
	SetVar VAR_SPECIAL_x8008, 82
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
