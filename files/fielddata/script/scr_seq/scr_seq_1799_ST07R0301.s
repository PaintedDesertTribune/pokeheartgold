#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0301.h"
#include "msgdata/msg/msg_1246_ST07R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07R0301_000
	ScrDefEnd

scr_seq_ST07R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_212
	GoToIf 1, _002E
	NPCMsg msg_1246_ST07R0301_00000
	WaitButton
	CloseMsg
	ApplyMovement 0, mv_ST07R0301_0044
	WaitMovement
	ReleaseAll
	End

_002E:
	NPCMsg msg_1246_ST07R0301_00001
	WaitButton
	CloseMsg
	ApplyMovement 0, mv_ST07R0301_0044
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
mv_ST07R0301_0044:
	.short 32, 1
	EndMovement


	.balign 4, 0
