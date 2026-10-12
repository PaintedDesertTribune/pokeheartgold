#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0107.h"
#include "msgdata/msg/msg_1186_SC10R0107.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0107_000
	ScrDef scr_seq_SC10R0107_001
	ScrDefEnd

scr_seq_SC10R0107_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_178
	GoToIf 1, _0066
	// Diamond ScrCmd_Unk00EA dropped: plays a map's music by Diamond map id
	NPCMsg msg_1186_SC10R0107_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_ELITE_FOUR_FLINT_FLINT, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	SetFlag FLAG_SINNOH_178
	PlayFanfare 1562
	HidePerson 1
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1186_SC10R0107_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	WhiteOut
	ReleaseAll
	End

_0066:
	NPCMsg msg_1186_SC10R0107_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC10R0107_001:
	LockAll
	ApplyMovement obj_player, mv_SC10R0107_0094
	WaitMovement
	PlayFanfare 1562
	ClearFlag FLAG_SINNOH_674
	ShowPerson 2
	SetVar 0x4001, 1
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SC10R0107_0094:
	.short 12, 2
	EndMovement


	.balign 4, 0
