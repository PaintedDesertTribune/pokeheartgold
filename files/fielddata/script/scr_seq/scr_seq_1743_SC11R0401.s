#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11R0401.h"
#include "msgdata/msg/msg_1218_SC11R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC11R0401_000
	ScrDef scr_seq_SC11R0401_001
	ScrDef scr_seq_SC11R0401_002
	ScrDefEnd

scr_seq_SC11R0401_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1218_SC11R0401_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11R0401_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1218_SC11R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC11R0401_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 255, 0
	NPCMsg msg_1218_SC11R0401_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
