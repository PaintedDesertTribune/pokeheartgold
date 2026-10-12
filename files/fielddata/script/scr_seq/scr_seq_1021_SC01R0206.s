#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0206.h"
#include "msgdata/msg/msg_0857_SC01R0206.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0206_000
	ScrDef scr_seq_SC01R0206_001
	ScrDef scr_seq_SC01R0206_002
	ScrDef scr_seq_SC01R0206_003
	ScrDef scr_seq_SC01R0206_004
	ScrDef scr_seq_SC01R0206_005
	ScrDef scr_seq_SC01R0206_006
	ScrDefEnd

scr_seq_SC01R0206_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [0]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0206_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [1]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0206_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [2]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0206_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0857_SC01R0206_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0206_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0857_SC01R0206_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0206_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0857_SC01R0206_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0206_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0857_SC01R0206_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
