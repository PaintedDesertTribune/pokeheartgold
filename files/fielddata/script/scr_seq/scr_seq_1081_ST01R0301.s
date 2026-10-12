#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0301.h"
#include "msgdata/msg/msg_0887_ST01R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0301_000
	ScrDefEnd

scr_seq_ST01R0301_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_4095, 1
	GoToIf 4, _002F
	GoTo _0021

_0021:
	BufferRivalsName 0
	NPCMsg msg_0887_ST01R0301_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002F:
	NPCMsg msg_0887_ST01R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
