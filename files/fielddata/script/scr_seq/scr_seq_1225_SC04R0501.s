#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0501.h"
#include "msgdata/msg/msg_0959_SC04R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0501_000
	ScrDef scr_seq_SC04R0501_001
	ScrDef scr_seq_SC04R0501_002
	ScrDefEnd

scr_seq_SC04R0501_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0959_SC04R0501_00000
	CloseMsg
	SpecialMartBuy 34
	ReleaseAll
	End

scr_seq_SC04R0501_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0959_SC04R0501_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0501_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0959_SC04R0501_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
