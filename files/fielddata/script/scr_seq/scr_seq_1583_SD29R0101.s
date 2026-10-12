#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD29R0101.h"
#include "msgdata/msg/msg_1138_SD29R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD29R0101_000
	ScrDefEnd

scr_seq_SD29R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_169
	GoToIf 1, _002B
	SetFlag FLAG_SINNOH_169
	BufferRivalsName 0
	NPCMsg msg_1138_SD29R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002B:
	BufferRivalsName 0
	NPCMsg msg_1138_SD29R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
