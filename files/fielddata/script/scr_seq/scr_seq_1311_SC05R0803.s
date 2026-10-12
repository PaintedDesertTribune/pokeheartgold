#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0803.h"
#include "msgdata/msg/msg_1002_SC05R0803.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0803_000
	ScrDefEnd

scr_seq_SC05R0803_000:
	LockAll
	ApplyMovement obj_player, mv_SC05R0803_00B8
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
	Warp MAP_SINNOH_HEARTHOME_NORTHEAST_HOUSE_2F, 0, 18, 3, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_006A:
	SetVar 0x8004, 1
	Call _009C
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_HEARTHOME_NORTHEAST_HOUSE_1F, 0, 18, 3, 1
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_009C:
	WaitSE 1500
	ElevatorAnim 0x8004, 4
	ApplyMovement obj_player, mv_SC05R0803_00C4
	WaitMovement
	PlayFanfare 1539
	Return

	.balign 4, 0
mv_SC05R0803_00B8:
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC05R0803_00C4:
	.short 13, 2
	.short 33, 1
	EndMovement


	.balign 4, 0
