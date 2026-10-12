#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0111.h"
#include "msgdata/msg/msg_1190_SC10R0111.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0111_000
	ScrDef scr_seq_SC10R0111_001
	ScrDefEnd

scr_seq_SC10R0111_000:
	// Diamond ScrCmd_Unk025B dropped: Great Marsh observatory binoculars
	End

scr_seq_SC10R0111_001:
	ApplyMovement obj_player, mv_SC10R0111_00E8
	WaitMovement
	// Diamond ScrCmd_Unk00EA dropped: plays a map's music by Diamond map id
	CheckFlag FLAG_SINNOH_2404
	CallIf 0, _00D1
	CheckFlag FLAG_SINNOH_2404
	CallIf 1, _00D6
	CloseMsg
	SetFlag FLAG_SINNOH_2443
	TrainerBattle TRAINER_SINNOH_CHAMPION_CYNTHIA, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00DB
	NPCMsg msg_1190_SC10R0111_00001
	SetFlag FLAG_SINNOH_180
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_1190_SC10R0111_00002
	CloseMsg
	ApplyMovement 0, mv_SC10R0111_0100
	WaitMovement
	ApplyMovement obj_player, mv_SC10R0111_00F0
	WaitMovement
	ApplyMovement 0, mv_SC10R0111_010C
	WaitMovement
	Wait 30, 0x800C
	// Diamond ScrCmd_Unk025C dropped: Great Marsh observatory binoculars
	Wait 30, 0x800C
	SetFlag FLAG_SINNOH_600
	SetFlag FLAG_SINNOH_601
	ApplyMovement obj_player, mv_SC10R0111_00F8
	WaitMovement
	PlayFanfare 1539
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_POKEMON_LEAGUE_HALL_OF_FAME_CORRIDOR, 0, 5, 23, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	ReleaseAll
	End

_00D1:
	NPCMsg msg_1190_SC10R0111_00000
	Return

_00D6:
	NPCMsg msg_1190_SC10R0111_00009
	Return

_00DB:
	ClearFlag FLAG_SINNOH_2443
	WhiteOut
	ReleaseAll
	ReleaseAll
	End

	.balign 4, 0
mv_SC10R0111_00E8:
	.short 12, 4
	EndMovement

	.balign 4, 0
mv_SC10R0111_00F0:
	.short 12, 6
	EndMovement

	.balign 4, 0
mv_SC10R0111_00F8:
	.short 12, 6
	EndMovement

	.balign 4, 0
mv_SC10R0111_0100:
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC10R0111_010C:
	.short 32, 1
	EndMovement

	.balign 4, 0
