#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02R0101.h"
#include "msgdata/msg/msg_0834_SC02R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02R0101_000
	ScrDef scr_seq_SC02R0101_001
	ScrDef scr_seq_SC02R0101_002
	ScrDef scr_seq_SC02R0101_003
	ScrDefEnd

scr_seq_SC02R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0030
	NPCMsg msg_0834_SC02R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0030:
	NPCMsg msg_0834_SC02R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0064
	NPCMsg msg_0834_SC02R0101_00002
	FacePlayer
	NPCMsg msg_0834_SC02R0101_00003
	CloseMsg
	ApplyMovement 1, mv_SC02R0101_0074
	WaitMovement
	ReleaseAll
	End

_0064:
	FacePlayer
	NPCMsg msg_0834_SC02R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0834_SC02R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC02R0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0834_SC02R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC02R0101_0074:
	.short 0, 1
	EndMovement


	.balign 4, 0
