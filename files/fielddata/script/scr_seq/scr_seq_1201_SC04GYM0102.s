#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04GYM0102.h"
#include "msgdata/msg/msg_0947_SC04GYM0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04GYM0102_000
	ScrDef scr_seq_SC04GYM0102_001
	ScrDef scr_seq_SC04GYM0102_002
	ScrDef scr_seq_SC04GYM0102_003
	ScrDef scr_seq_SC04GYM0102_004
	ScrDef scr_seq_SC04GYM0102_005
	ScrDef scr_seq_SC04GYM0102_006
	ScrDefEnd

scr_seq_SC04GYM0102_000:
	CompareVarToValue VAR_SINNOH_40AE, 3
	GoToIf 1, _0054
	CompareVarToValue VAR_SINNOH_40AE, 2
	GoToIf 1, _005A
	CompareVarToValue VAR_SINNOH_40AE, 1
	GoToIf 1, _0064
	CompareVarToValue VAR_SINNOH_40AE, 0
	GoToIf 1, _0072
	End

_0054:
	SetFlag FLAG_SINNOH_421
	End

_005A:
	SetFlag FLAG_SINNOH_420
	SetFlag FLAG_SINNOH_421
	End

_0064:
	SetFlag FLAG_SINNOH_419
	SetFlag FLAG_SINNOH_420
	SetFlag FLAG_SINNOH_421
	End

_0072:
	SetFlag FLAG_SINNOH_418
	SetFlag FLAG_SINNOH_419
	SetFlag FLAG_SINNOH_420
	SetFlag FLAG_SINNOH_421
	End

scr_seq_SC04GYM0102_001:
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _0091
	End

_0091:
	ClearFlag FLAG_SINNOH_421
	ShowPerson 0
	ClearFlag FLAG_SINNOH_142
	End

scr_seq_SC04GYM0102_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _016C
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	NPCMsg msg_0947_SC04GYM0102_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LEADER_GARDENIA_GARDENIA, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0182
	NPCMsg msg_0947_SC04GYM0102_00001
	BufferPlayersName 0
	NPCMsg msg_0947_SC04GYM0102_00002
	PlaySE SEQ_ME_BADGE
	WaitSE SEQ_ME_BADGE
	GiveBadge 1
	AddSpecialGameStat 23
	SetTrainerFlag TRAINER_SINNOH_AROMA_LADY_JENNA
	SetTrainerFlag TRAINER_SINNOH_AROMA_LADY_ANGELA
	SetTrainerFlag TRAINER_SINNOH_LASS_CAROLINE
	SetTrainerFlag TRAINER_SINNOH_BEAUTY_LINDSAY
	// Diamond ScrCmd_Unk01CD dropped: Diamond misc save-data pointer setup
	ClearFlag FLAG_SINNOH_416
	NPCMsg msg_0947_SC04GYM0102_00003
	GoTo _0124

_0124:
	SetVar 0x8004, 413
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0162
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_116
	BufferItemName 0, 0x8004
	BufferTMHMMoveName 1, 0x8004
	NPCMsg msg_0947_SC04GYM0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0162:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_016C:
	CheckFlag FLAG_SINNOH_116
	GoToIf 0, _0124
	NPCMsg msg_0947_SC04GYM0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0182:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC04GYM0102_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40AE, 1
	GoToIf 4, _01D2
	NPCMsg msg_0947_SC04GYM0102_00006
	CloseMsg
	TrainerBattle TRAINER_SINNOH_LASS_CAROLINE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0182
	NPCMsg msg_0947_SC04GYM0102_00007
	WaitButton
	SetVar VAR_SINNOH_40AE, 1
	ClearFlag FLAG_SINNOH_418
	ShowPerson 1
	CloseMsg
	ReleaseAll
	End

_01D2:
	NPCMsg msg_0947_SC04GYM0102_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04GYM0102_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40AE, 2
	GoToIf 4, _0233
	SetVar 0x8007, 1
	Call _0300
	NPCMsg msg_0947_SC04GYM0102_00008
	CloseMsg
	TrainerBattle TRAINER_SINNOH_AROMA_LADY_JENNA, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0182
	ClearFlag FLAG_SINNOH_419
	ShowPerson 2
	NPCMsg msg_0947_SC04GYM0102_00009
	WaitButton
	SetVar VAR_SINNOH_40AE, 2
	CloseMsg
	ReleaseAll
	End

_0233:
	NPCMsg msg_0947_SC04GYM0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04GYM0102_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40AE, 3
	GoToIf 4, _0294
	SetVar 0x8007, 2
	Call _0300
	NPCMsg msg_0947_SC04GYM0102_00010
	CloseMsg
	TrainerBattle TRAINER_SINNOH_AROMA_LADY_ANGELA, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0182
	ClearFlag FLAG_SINNOH_420
	ShowPerson 3
	NPCMsg msg_0947_SC04GYM0102_00011
	WaitButton
	SetVar VAR_SINNOH_40AE, 3
	CloseMsg
	ReleaseAll
	End

_0294:
	NPCMsg msg_0947_SC04GYM0102_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04GYM0102_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40AE, 4
	GoToIf 4, _02F5
	SetVar 0x8007, 3
	Call _0300
	NPCMsg msg_0947_SC04GYM0102_00012
	CloseMsg
	SetFlag FLAG_SINNOH_142
	TrainerBattle TRAINER_SINNOH_BEAUTY_LINDSAY, 0, 0, 0
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0182
	NPCMsg msg_0947_SC04GYM0102_00013
	WaitButton
	SetVar VAR_SINNOH_40AE, 4
	CloseMsg
	ReleaseAll
	End

_02F5:
	NPCMsg msg_0947_SC04GYM0102_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0300:
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	CallIf 1, _033A
	CompareVarToValue 0x800C, 1
	CallIf 1, _0348
	CompareVarToValue 0x800C, 2
	CallIf 1, _0356
	CompareVarToValue 0x800C, 3
	CallIf 1, _0364
	Return

_033A:
	SetObjectMovementType 0x8007, 15
	SetObjectFacing 0x8007, 1
	Return

_0348:
	SetObjectMovementType 0x8007, 14
	SetObjectFacing 0x8007, 0
	Return

_0356:
	SetObjectMovementType 0x8007, 17
	SetObjectFacing 0x8007, 3
	Return

_0364:
	SetObjectMovementType 0x8007, 16
	SetObjectFacing 0x8007, 2
	Return



	.balign 4, 0
