#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D05R0101.h"
#include "msgdata/msg/msg_0973_D05R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D05R0101_000
	ScrDef scr_seq_D05R0101_001
	ScrDefEnd

scr_seq_D05R0101_000:
	End

scr_seq_D05R0101_001:
	LockAll
	ApplyMovement obj_player, mv_D05R0101_0094
	ApplyMovement 6, mv_D05R0101_006C
	WaitMovement
	NPCMsg msg_0973_D05R0101_00000
	CloseMsg
	ApplyMovement 6, mv_D05R0101_0078
	ApplyMovement obj_player, mv_D05R0101_00A4
	WaitMovement
	NPCMsg msg_0973_D05R0101_00001
	ApplyMovement 6, mv_D05R0101_0080
	WaitMovement
	NPCMsg msg_0973_D05R0101_00002
	CloseMsg
	ApplyMovement obj_player, mv_D05R0101_00B8
	ApplyMovement 6, mv_D05R0101_0088
	WaitMovement
	HidePerson 6
	SetVar VAR_SINNOH_4096, 1
	ReleaseAll
	End

	.balign 4, 0
mv_D05R0101_006C:
	.short 13, 6
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_D05R0101_0078:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_D05R0101_0080:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_D05R0101_0088:
	.short 63, 3
	.short 14, 10
	EndMovement

	.balign 4, 0
mv_D05R0101_0094:
	.short 32, 1
	.short 63, 4
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D05R0101_00A4:
	.short 63, 3
	.short 32, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D05R0101_00B8:
	.short 13, 1
	.short 32, 1
	.short 63, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
