#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0802.h"
#include "msgdata/msg/msg_1168_SC08R0802.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0802_000
	ScrDefEnd

scr_seq_SC08R0802_000:
	LockAll
	ApplyMovement obj_player, mv_SC08R0802_00B8
	WaitMovement
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	CopyVar 0x8008, VAR_SINNOH_40CE
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0038
	CompareVarToValue 0x8008, 0
	GoToIf 1, _006A
	ReleaseAll
	End

_0038:
	SetVar 0x8004, 0
	Call _009C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_SUNYSHORE_VISTA_LIGHTHOUSE_OBSERVATION_DECK, 0, 6, 10, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_006A:
	SetVar 0x8004, 1
	Call _009C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_SUNYSHORE, 0, 886, 791, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_009C:
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim 0x8004, 4
	ApplyMovement obj_player, mv_SC08R0802_00C4
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	Return

	.balign 4, 0
mv_SC08R0802_00B8:
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC08R0802_00C4:
	.short 13, 2
	.short 33, 1
	EndMovement


	.balign 4, 0
