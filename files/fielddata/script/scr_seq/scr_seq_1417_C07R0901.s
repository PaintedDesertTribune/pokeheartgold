#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C07R0901.h"
#include "msgdata/msg/msg_1055_C07R0901.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C07R0901_000
	ScrDef scr_seq_C07R0901_001
	ScrDefEnd

scr_seq_C07R0901_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1055_C07R0901_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C07R0901_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_263
	GoToIf 1, _003B
	NPCMsg msg_1055_C07R0901_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003B:
	NPCMsg msg_1055_C07R0901_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
