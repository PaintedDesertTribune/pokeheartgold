#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0207.h"
#include "msgdata/msg/msg_0858_SC01R0207.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0207_000
	ScrDef scr_seq_SC01R0207_001
	ScrDef scr_seq_SC01R0207_002
	ScrDef scr_seq_SC01R0207_003
	ScrDef scr_seq_SC01R0207_004
	ScrDef scr_seq_SC01R0207_005
	ScrDefEnd

scr_seq_SC01R0207_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [3]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0207_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [4]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0207_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	// TODO Diamond ScrCmd_Unk01B5 0x1b5 args [5]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC01R0207_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0858_SC01R0207_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0207_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0858_SC01R0207_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0207_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0858_SC01R0207_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
