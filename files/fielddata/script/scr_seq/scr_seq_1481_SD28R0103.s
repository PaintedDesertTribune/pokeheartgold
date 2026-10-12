#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD28R0103.h"
#include "msgdata/msg/msg_1087_SD28R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD28R0103_000
	ScrDef scr_seq_SD28R0103_001
	ScrDef scr_seq_SD28R0103_002
	ScrDef scr_seq_SD28R0103_003
	ScrDefEnd

scr_seq_SD28R0103_000:
	SetFlag FLAG_SINNOH_2529
	CheckFlag FLAG_SINNOH_350
	GoToIf 0, _002E
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0038
	End

_002E:
	MoveWarp 1, 10, 29
	End

_0038:
	MoveWarp 0, 10, 29
	End

scr_seq_SD28R0103_001:
	SetFlag FLAG_SINNOH_2529
	CheckFlag FLAG_SINNOH_142
	CallIf 1, _0069
	CheckFlag FLAG_SINNOH_350
	GoToIf 0, _002E
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0038
	End

_0069:
	SetFlag FLAG_SINNOH_510
	HidePerson 0
	ClearFlag FLAG_SINNOH_142
	Return

scr_seq_SD28R0103_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	PlayCry 482, 0
	NPCMsg msg_1087_SD28R0103_00003
	CloseMsg
	SetFlag FLAG_SINNOH_142
	WildBattle 482, 50
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CD
	// TODO Diamond ScrCmd_Unk00ED 0x0ed args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C2
	SetFlag FLAG_SINNOH_294
	ReleaseAll
	End

_00C2:
	NPCMsg msg_1087_SD28R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CD:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD28R0103_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1087_SD28R0103_00000
	CloseMsg
	FacePlayer
	ApplyMovement 1, mv_SD28R0103_013C
	WaitMovement
	Wait 30, 0x800C
	NPCMsg msg_1087_SD28R0103_00001
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COMMANDER_SATURN_SATURN, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0144
	NPCMsg msg_1087_SD28R0103_00002
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 1
	SetFlag FLAG_SINNOH_318
	SetFlag FLAG_SINNOH_2436
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_0144:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SD28R0103_013C:
	.short 75, 1
	EndMovement

	.balign 4, 0
