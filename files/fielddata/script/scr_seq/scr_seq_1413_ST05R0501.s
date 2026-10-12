#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST05R0501.h"
#include "msgdata/msg/msg_1053_ST05R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST05R0501_000
	ScrDefEnd

scr_seq_ST05R0501_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_167
	GoToIf 0, _0025
	BufferPlayersName 0
	NPCMsg msg_1053_ST05R0501_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0025:
	BufferPlayersName 0
	NPCMsg msg_1053_ST05R0501_00000
	CloseMsg
	SetFlag FLAG_SINNOH_167
	ClearFlag FLAG_SINNOH_475
	SetVar VAR_SINNOH_4074, 1
	ClearFlag FLAG_SINNOH_583
	ShowPerson 0
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 9
	GoToIf 1, _0065
	CompareVarToValue 0x8004, 10
	GoToIf 1, _00A0
	End

_0065:
	ApplyMovement 0, mv_ST05R0501_011C
	WaitMovement
	ApplyMovement obj_player, mv_ST05R0501_010C
	WaitMovement
	NPCMsg msg_1053_ST05R0501_00001
	CloseMsg
	ApplyMovement 0, mv_ST05R0501_014C
	WaitMovement
	Call _00DB
	ApplyMovement 0, mv_ST05R0501_015C
	WaitMovement
	GoTo _0101

_00A0:
	ApplyMovement 0, mv_ST05R0501_0134
	WaitMovement
	ApplyMovement obj_player, mv_ST05R0501_0114
	WaitMovement
	NPCMsg msg_1053_ST05R0501_00001
	CloseMsg
	ApplyMovement 0, mv_ST05R0501_0154
	WaitMovement
	Call _00DB
	ApplyMovement 0, mv_ST05R0501_0174
	WaitMovement
	GoTo _0101

_00DB:
	NPCMsg msg_1053_ST05R0501_00002
	SetVar 0x8004, 422
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_458
	ClearFlag FLAG_SINNOH_481
	SetFlag FLAG_SINNOH_2445
	NPCMsg msg_1053_ST05R0501_00003
	CloseMsg
	Return

_0101:
	HidePerson 0
	ReleaseAll
	End

	.balign 4, 0
mv_ST05R0501_010C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_0114:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_011C:
	.short 12, 6
	.short 15, 1
	.short 12, 1
	.short 15, 5
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_0134:
	.short 12, 6
	.short 15, 1
	.short 12, 1
	.short 15, 4
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_014C:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_0154:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST05R0501_015C:
	.short 13, 1
	.short 14, 5
	.short 13, 1
	.short 14, 1
	.short 13, 6
	EndMovement

	.balign 4, 0
mv_ST05R0501_0174:
	.short 13, 1
	.short 14, 4
	.short 13, 1
	.short 14, 1
	.short 13, 6
	EndMovement


	.balign 4, 0
