#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD16R0103.h"
#include "msgdata/msg/msg_1237_SD16R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD16R0103_000
	ScrDef scr_seq_SD16R0103_001
	ScrDef scr_seq_SD16R0103_002
	ScrDef scr_seq_SD16R0103_003
	ScrDef scr_seq_SD16R0103_004
	ScrDefEnd

scr_seq_SD16R0103_000:
	CopyVar 0x4000, VAR_SINNOH_409E
	CompareVarToValue VAR_SINNOH_409E, 1
	CallIf 4, _0031
	Call _0037
	End

_0031:
	SetFlag FLAG_SINNOH_505
	Return

_0037:
	CheckFlag FLAG_SINNOH_288
	GoToIf 1, _0083
	CheckGameClearFlag 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0083
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0083
	CheckFlag FLAG_SINNOH_293
	GoToIf 0, _0083
	CompareVarToValue VAR_SINNOH_409E, 1
	GoToIf 5, _0083
	ClearFlag FLAG_SINNOH_507
	Return

_0083:
	SetFlag FLAG_SINNOH_507
	Return

scr_seq_SD16R0103_001:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _0096
	End

_0096:
	SetFlag FLAG_SINNOH_507
	HidePerson 1
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SD16R0103_002:
	LockAll
	ApplyMovement 2, mv_SD16R0103_0120
	WaitMovement
	BufferPlayersName 1
	NPCMsg msg_1237_SD16R0103_00000
	ApplyMovement 2, mv_SD16R0103_0128
	WaitMovement
	NPCMsg msg_1237_SD16R0103_00001
	CloseMsg
	HidePerson 3
	WaitSE SEQ_SE_DP_SELECT
	PlayFanfare SEQ_SE_DP_FW089
	// Diamond ScrCmd_ShakeCamera dropped: screen shake needs a HeartGold port (library cutscene)
	// Diamond ScrCmd_StopFanfare dropped: no stop-fanfare command in HeartGold
	ApplyMovement 2, mv_SD16R0103_0120
	WaitMovement
	NPCMsg msg_1237_SD16R0103_00002
	CloseMsg
	ApplyMovement 2, mv_SD16R0103_0130
	ApplyMovement obj_player, mv_SD16R0103_0110
	WaitMovement
	HidePerson 2
	SetVar VAR_SINNOH_409E, 1
	SetFlag FLAG_SINNOH_214
	ClearFlag FLAG_SINNOH_500
	ReleaseAll
	End

scr_seq_SD16R0103_003:
	BufferPlayersName 1
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1237_SD16R0103_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD16R0103_004:
	LockAll
	PlayFanfare SEQ_SE_DP_SELECT
	WaitSE SEQ_SE_DP_SELECT
	CheckFlag FLAG_SINNOH_215
	CallIf 0, _01CB
	SetVar VAR_SINNOH_409E, 2
	PlayCry 485, 0
	NPCMsg msg_1237_SD16R0103_00003
	CloseMsg
	SetFlag FLAG_SINNOH_142
	WildBattle 485, 70
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01BF
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01B4
	SetFlag FLAG_SINNOH_288
	SetFlag FLAG_SINNOH_2435
	ReleaseAll
	End

_01B4:
	NPCMsg msg_1237_SD16R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BF:
	SetVar VAR_SINNOH_409E, 1
	WhiteOut
	ReleaseAll
	End

_01CB:
	SetFlag FLAG_SINNOH_215
	Return

	.balign 4, 0
mv_SD16R0103_0110:
	.short 14, 1
	.short 35, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD16R0103_0120:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD16R0103_0128:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD16R0103_0130:
	.short 63, 1
	.short 13, 9
	EndMovement


	.balign 4, 0
