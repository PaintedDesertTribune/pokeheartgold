#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0102.h"
#include "msgdata/msg/msg_1069_SD26R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0102_000
	ScrDef scr_seq_SD26R0102_001
	ScrDef scr_seq_SD26R0102_002
	ScrDef scr_seq_SD26R0102_003
	ScrDef scr_seq_SD26R0102_004
	ScrDef scr_seq_SD26R0102_005
	ScrDef scr_seq_SD26R0102_006
	ScrDefEnd

scr_seq_SD26R0102_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _003A
	GoTo _0070

_003A:
	BufferPlayersName 0
	NPCMsg msg_1069_SD26R0102_00001
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE SEQ_ME_ASA
	WaitSE SEQ_ME_ASA
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	BufferPlayersName 0
	NPCMsg msg_1069_SD26R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0070:
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0102_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0102_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0102_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0102_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0102_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1069_SD26R0102_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SD26R0102_006:
	SetVar VAR_SPECIAL_x8008, 29
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
