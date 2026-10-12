#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0102.h"
#include "msgdata/msg/msg_1253_SD17R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0102_000
	ScrDef scr_seq_SD17R0102_001
	ScrDefEnd

scr_seq_SD17R0102_000:
	SetFlag FLAG_SINNOH_2516
	Call _001C
	// Diamond ScrCmd_Unk0285 dropped: Great Marsh area shuttle warp
	End

_001C:
	SetVar VAR_SINNOH_410B, 0
	SetVar VAR_SINNOH_410C, 0
	Return

scr_seq_SD17R0102_001:
	CheckFlag FLAG_SINNOH_289
	GoToIf 1, _0046
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1253_SD17R0102_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0046:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1253_SD17R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
