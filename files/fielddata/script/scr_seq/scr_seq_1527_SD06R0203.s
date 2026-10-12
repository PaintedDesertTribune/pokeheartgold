#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD06R0203.h"
#include "msgdata/msg/msg_1110_SD06R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD06R0203_000
	ScrDef scr_seq_SD06R0203_001
	ScrDef scr_seq_SD06R0203_002
	ScrDefEnd

scr_seq_SD06R0203_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1110_SD06R0203_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD06R0203_001:
	DirectionSignpost msg_1110_SD06R0203_00001, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SD06R0203_002:
	SetVar VAR_SPECIAL_x8008, 94
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
