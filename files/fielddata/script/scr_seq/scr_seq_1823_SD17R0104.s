#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0104.h"
#include "msgdata/msg/msg_1258_SD17R0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0104_000
	ScrDef scr_seq_SD17R0104_001
	ScrDef scr_seq_SD17R0104_002
	ScrDef scr_seq_SD17R0104_003
	ScrDef scr_seq_SD17R0104_004
	ScrDefEnd

scr_seq_SD17R0104_004:
	CheckFlag FLAG_SINNOH_289
	CallIf 0, _0023
	End

_0023:
	SetFlag FLAG_SINNOH_662
	Return

scr_seq_SD17R0104_000:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _0036
	End

_0036:
	SetFlag FLAG_SINNOH_622
	HidePerson 0
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD17R0104_001:
	LockAll
	PlayFanfare SEQ_SE_DP_SELECT
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 487, 0
	NPCMsg msg_1258_SD17R0104_00000
	CloseMsg
	SetFlag FLAG_SINNOH_142
	WildBattle 487, 70
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A8
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0099
	SetFlag FLAG_SINNOH_289
	SetFlag FLAG_SINNOH_622
	ClearFlag FLAG_SINNOH_662
	ReleaseAll
	End

_0099:
	NPCMsg msg_1258_SD17R0104_00001
	WaitButton
	CloseMsg
	ClearFlag FLAG_SINNOH_622
	ReleaseAll
	End

_00A8:
	WhiteOut
	ClearFlag FLAG_SINNOH_622
	ReleaseAll
	End

scr_seq_SD17R0104_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CompareVarToValue VAR_SINNOH_410C, 3
	GoToIf 1, _0105
	CompareVarToValue VAR_SINNOH_410C, 15
	GoToIf 0, _0111
	SetVar 0x8004, 90

_00D8:
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _011D
	CallStd std_give_item_verbose
	CloseMsg
	HidePerson 1
	ClearFlag FLAG_SINNOH_662
	ReleaseAll
	End

_0105:
	SetVar 0x8004, 325
	GoTo _00D8

_0111:
	SetVar 0x8004, 106
	GoTo _00D8

_011D:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_SD17R0104_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1258_SD17R0104_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
