#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04GYM0101.h"
#include "msgdata/msg/msg_0946_SC04GYM0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04GYM0101_000
	ScrDef scr_seq_SC04GYM0101_001
	ScrDef scr_seq_SC04GYM0101_002
	ScrDefEnd

scr_seq_SC04GYM0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0946_SC04GYM0101_00000
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 1, mv_SC04GYM0101_003C
	WaitMovement
	PlayFanfare SEQ_SE_DP_KAIDAN2
	HidePerson 1
	WaitSE SEQ_SE_DP_KAIDAN2
	ReleaseAll
	End

scr_seq_SC04GYM0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _006A
	NPCMsg msg_0946_SC04GYM0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006A:
	BufferPlayersName 0
	NPCMsg msg_0946_SC04GYM0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04GYM0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckBadge 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A2
	BufferRivalsName 0
	BufferRivalsName 1
	NPCMsg msg_0946_SC04GYM0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A2:
	BufferRivalsName 0
	BufferPlayersName 1
	BufferRivalsName 2
	NPCMsg msg_0946_SC04GYM0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC04GYM0101_003C:
	.short 36, 1
	EndMovement


	.balign 4, 0
