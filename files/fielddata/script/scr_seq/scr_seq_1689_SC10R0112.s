#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0112.h"
#include "msgdata/msg/msg_1191_SC10R0112.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0112_000
	ScrDef scr_seq_SC10R0112_001
	ScrDefEnd

scr_seq_SC10R0112_000:
scr_seq_SC10R0112_001:
	LockAll
	ApplyMovement obj_player, mv_SC10R0112_016C
	WaitMovement
	MovePerson 0, 6, 14
	ClearFlag FLAG_SINNOH_600
	ShowPerson 0
	Lock 0
	ApplyMovement 0, mv_SC10R0112_0138
	ApplyMovement obj_player, mv_SC10R0112_017C
	WaitMovement
	NPCMsg msg_1191_SC10R0112_00000
	CloseMsg
	MovePerson 1, 4, 14
	ClearFlag FLAG_SINNOH_601
	ShowPerson 1
	Lock 1
	ApplyMovement 1, mv_SC10R0112_0114
	WaitMovement
	ApplyMovement obj_player, mv_SC10R0112_0190
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_1191_SC10R0112_00001
	CloseMsg
	ApplyMovement 0, mv_SC10R0112_0144
	WaitMovement
	NPCMsg msg_1191_SC10R0112_00002
	BufferPlayersName 0
	NPCMsg msg_1191_SC10R0112_00003
	ApplyMovement 0, mv_SC10R0112_0150
	WaitMovement
	NPCMsg msg_1191_SC10R0112_00004
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00B1
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00BD
	ReleaseAll
	End

_00B1:
	BufferPlayersName 0
	NPCMsg msg_1191_SC10R0112_00005
	GoTo _00C9

_00BD:
	BufferPlayersName 0
	NPCMsg msg_1191_SC10R0112_00006
	GoTo _00C9

_00C9:
	NPCMsg msg_1191_SC10R0112_00007
	CloseMsg
	ApplyMovement 0, mv_SC10R0112_0158
	ApplyMovement 1, mv_SC10R0112_0120
	ApplyMovement obj_player, mv_SC10R0112_0198
	WaitMovement
	PlayFanfare 1539
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_POKEMON_LEAGUE_HALL_OF_FAME, 0, 8, 15, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SC10R0112_0114:
	.short 12, 8
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0120:
	.short 63, 3
	.short 12, 2
	.short 15, 1
	.short 12, 2
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0138:
	.short 12, 8
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0144:
	.short 34, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0150:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0158:
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_016C:
	.short 12, 17
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_017C:
	.short 63, 6
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0190:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC10R0112_0198:
	.short 63, 1
	.short 32, 1
	.short 63, 6
	.short 12, 4
	EndMovement


	.balign 4, 0
