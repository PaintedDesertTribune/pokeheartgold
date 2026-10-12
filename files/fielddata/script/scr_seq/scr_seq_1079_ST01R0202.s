#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0202.h"
#include "msgdata/msg/msg_0886_ST01R0202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0202_000
	ScrDef scr_seq_ST01R0202_001
	ScrDef scr_seq_ST01R0202_002
	ScrDef scr_seq_ST01R0202_003
	ScrDef scr_seq_ST01R0202_004
	ScrDef scr_seq_ST01R0202_005
	ScrDefEnd

scr_seq_ST01R0202_004:
	CompareVarToValue VAR_SINNOH_40F9, 0
	GoToIf 1, _0029
	End

_0029:
	// TODO Diamond ScrCmd_SetVolume 0x283 args [1030, 50]: no HeartGold mapping yet
	End

scr_seq_ST01R0202_002:
	LockAll
	SetVar VAR_SINNOH_40F9, 1
	NPCMsg msg_0886_ST01R0202_00001
	PlaySE SEQ_GS_RADIO_JINGLE
	NPCMsg msg_0886_ST01R0202_00002
	WaitSE SEQ_GS_RADIO_JINGLE
	CloseMsg
	ResetBGM
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST01R0202_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0886_ST01R0202_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0202_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	BufferPlayersName 0
	NPCMsg msg_0886_ST01R0202_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0202_003:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0886_ST01R0202_00004, 0x800C
	CallStd std_signpost
	End

scr_seq_ST01R0202_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0886_ST01R0202_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
