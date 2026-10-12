#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0109.h"
#include "msgdata/msg/msg_1188_SC10R0109.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0109_000
	ScrDef scr_seq_SC10R0109_001
	ScrDefEnd

scr_seq_SC10R0109_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_179
	GoToIf 1, _0066
	// Diamond ScrCmd_Unk00EA dropped: plays a map's music by Diamond map id
	NPCMsg msg_1188_SC10R0109_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_ELITE_FOUR_LUCIEN_LUCIAN, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	SetFlag FLAG_SINNOH_179
	PlayFanfare 1562
	HidePerson 1
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1188_SC10R0109_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	WhiteOut
	ReleaseAll
	End

_0066:
	NPCMsg msg_1188_SC10R0109_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC10R0109_001:
	LockAll
	ApplyMovement obj_player, mv_SC10R0109_0094
	WaitMovement
	PlayFanfare 1562
	ClearFlag FLAG_SINNOH_675
	ShowPerson 2
	SetVar 0x4001, 1
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SC10R0109_0094:
	.short 12, 2
	EndMovement


	.balign 4, 0
