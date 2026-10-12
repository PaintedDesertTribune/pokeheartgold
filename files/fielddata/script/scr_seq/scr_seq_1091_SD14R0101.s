#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD14R0101.h"
#include "msgdata/msg/msg_0892_SD14R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD14R0101_000
	ScrDef scr_seq_SD14R0101_001
	ScrDef scr_seq_SD14R0101_002
	ScrDefEnd

scr_seq_SD14R0101_000:
	SetFlag FLAG_SINNOH_2511
	End

scr_seq_SD14R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _003A
	NPCMsg msg_0892_SD14R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003A:
	CheckFlag FLAG_SINNOH_147
	GoToIf 1, _0064
	NPCMsg msg_0892_SD14R0101_00000
	SetVar 0x8004, 425
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	Call _006F
	GoTo _0064

_0064:
	NPCMsg msg_0892_SD14R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006F:
	SetFlag FLAG_SINNOH_147
	SetVar VAR_SINNOH_4093, 2
	Return

scr_seq_SD14R0101_002:
	LockAll
	ApplyMovement 10, mv_SD14R0101_00C0
	ApplyMovement obj_player, mv_SD14R0101_00B4
	WaitMovement
	NPCMsg msg_0892_SD14R0101_00000
	SetVar 0x8004, 425
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	Call _006F
	NPCMsg msg_0892_SD14R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD14R0101_00B4:
	.short 63, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD14R0101_00C0:
	.short 33, 1
	.short 75, 1
	.short 13, 1
	EndMovement


	.balign 4, 0
