#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C10R0103.h"
#include "msgdata/msg/msg_1182_C10R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C10R0103_000
	ScrDef scr_seq_C10R0103_001
	ScrDefEnd

scr_seq_C10R0103_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_176
	GoToIf 1, _0066
	// TODO Diamond ScrCmd_Unk00EA 0x0ea args [261]: no HeartGold mapping yet
	NPCMsg msg_1182_C10R0103_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_ELITE_FOUR_AARON_AARON, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	SetFlag FLAG_SINNOH_176
	PlayFanfare 1562
	HidePerson 2
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1182_C10R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	WhiteOut
	ReleaseAll
	End

_0066:
	NPCMsg msg_1182_C10R0103_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C10R0103_001:
	LockAll
	ApplyMovement obj_player, mv_C10R0103_0094
	WaitMovement
	PlayFanfare 1562
	ClearFlag FLAG_SINNOH_672
	ShowPerson 1
	SetVar 0x4001, 1
	ReleaseAll
	End

	.balign 4, 0
mv_C10R0103_0094:
	.short 12, 2
	EndMovement

	.balign 4, 0
