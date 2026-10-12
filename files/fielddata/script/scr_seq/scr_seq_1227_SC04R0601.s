#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0601.h"
#include "msgdata/msg/msg_0960_SC04R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0601_000
	ScrDefEnd

scr_seq_SC04R0601_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_281
	GoToIf 1, _0062
	BufferPlayersName 0
	NPCMsg msg_0960_SC04R0601_00000
	CloseMsg
	ApplyMovement 0, mv_SC04R0601_0074
	WaitMovement
	NPCMsg msg_0960_SC04R0601_00001
	SetVar 0x8004, 252
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0068
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_281
	NPCMsg msg_0960_SC04R0601_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0062:
	CallStd 9952 /* TODO Diamond std script */
	End

_0068:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC04R0601_0074:
	.short 75, 1
	EndMovement


	.balign 4, 0
