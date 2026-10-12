#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0401.h"
#include "msgdata/msg/msg_0888_ST01R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0401_000
	ScrDef scr_seq_ST01R0401_001
	ScrDefEnd

scr_seq_ST01R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _0028
	NPCMsg msg_0888_ST01R0401_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0028:
	NPCMsg msg_0888_ST01R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferPlayersName 0
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _0054
	NPCMsg msg_0888_ST01R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0054:
	NPCMsg msg_0888_ST01R0401_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
