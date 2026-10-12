#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0701.h"
#include "msgdata/msg/msg_0869_SC01R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0701_000
	ScrDef scr_seq_SC01R0701_001
	ScrDef scr_seq_SC01R0701_002
	ScrDef scr_seq_SC01R0701_003
	ScrDef scr_seq_SC01R0701_004
	ScrDef scr_seq_SC01R0701_005
	ScrDef scr_seq_SC01R0701_006
	ScrDef scr_seq_SC01R0701_007
	ScrDef scr_seq_SC01R0701_008
	ScrDef scr_seq_SC01R0701_009
	ScrDef scr_seq_SC01R0701_010
	ScrDef scr_seq_SC01R0701_011
	ScrDefEnd

scr_seq_SC01R0701_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0869_SC01R0701_00000
	PlaySE SEQ_ME_ITEM
	BufferPlayersName 0
	NPCMsg msg_0869_SC01R0701_00001
	WaitSE SEQ_ME_ITEM
	TakeItem 459, 1, 0x800C
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0869_SC01R0701_00002
	SetVar 0x8004, 442
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	BufferRivalsName 1
	NPCMsg msg_0869_SC01R0701_00003
	CloseMsg
	GetPlayerFacing 0x800C
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _00A4
	CompareVarToValue 0x8008, 2
	GoToIf 1, _00BE
	GoTo _00D8

_00A4:
	ApplyMovement 1, mv_SC01R0701_0114
	ApplyMovement obj_player, mv_SC01R0701_0138
	WaitMovement
	GoTo _00F2

_00BE:
	ApplyMovement 1, mv_SC01R0701_0124
	ApplyMovement obj_player, mv_SC01R0701_0148
	WaitMovement
	GoTo _00F2

_00D8:
	ApplyMovement 1, mv_SC01R0701_0124
	ApplyMovement obj_player, mv_SC01R0701_0148
	WaitMovement
	GoTo _00F2

_00F2:
	PlayFanfare SEQ_SE_DP_KAIDAN2
	HidePerson 1
	WaitSE SEQ_SE_DP_KAIDAN2
	SetVar VAR_SINNOH_40E7, 1
	SetFlag FLAG_SINNOH_241
	ClearFlag FLAG_SINNOH_532
	ClearFlag FLAG_SINNOH_531
	ReleaseAll
	End

scr_seq_SC01R0701_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0869_SC01R0701_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0701_002:
	End

scr_seq_SC01R0701_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0869_SC01R0701_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0701_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0869_SC01R0701_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0701_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0869_SC01R0701_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0701_006:
	End

scr_seq_SC01R0701_007:
	End

scr_seq_SC01R0701_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_274
	GoToIf 1, _025E
	CheckFlag FLAG_SINNOH_268
	GoToIf 1, _0273
	NPCMsg msg_0869_SC01R0701_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01E7
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0289
	End

_01E7:
	NPCMsg msg_0869_SC01R0701_00010
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCHOOL_KID_M_HARRISON, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0294
	SetFlag FLAG_SINNOH_268
	CheckFlag FLAG_SINNOH_269
	GoToIf 1, _022A
	CheckFlag FLAG_SINNOH_269
	GoToIf 0, _021F
	End

_021F:
	NPCMsg msg_0869_SC01R0701_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_022A:
	NPCMsg msg_0869_SC01R0701_00013
	SetVar 0x8004, 337
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0269
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_274
	GoTo _025E

_025E:
	NPCMsg msg_0869_SC01R0701_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0269:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0273:
	CheckFlag FLAG_SINNOH_269
	GoToIf 1, _022A
	NPCMsg msg_0869_SC01R0701_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0289:
	NPCMsg msg_0869_SC01R0701_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0294:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC01R0701_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_269
	GoToIf 1, _0308
	NPCMsg msg_0869_SC01R0701_00015
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _02D0
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0313
	End

_02D0:
	NPCMsg msg_0869_SC01R0701_00016
	CloseMsg
	TrainerBattle TRAINER_SINNOH_SCHOOL_KID_F_CHRISTINE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _033F
	SetFlag FLAG_SINNOH_269
	CheckFlag FLAG_SINNOH_268
	GoToIf 1, _0329
	CheckFlag FLAG_SINNOH_268
	GoToIf 0, _031E
	End

_0308:
	NPCMsg msg_0869_SC01R0701_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0313:
	NPCMsg msg_0869_SC01R0701_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031E:
	NPCMsg msg_0869_SC01R0701_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0329:
	CheckFlag FLAG_SINNOH_274
	GoToIf 1, _031E
	NPCMsg msg_0869_SC01R0701_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_033F:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC01R0701_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0869_SC01R0701_00020
	GoTo _0356

_0356:
	NPCMsg msg_0869_SC01R0701_00021
	MenuInit 7, 2, 0, 1, 0x800C
	ScrCmd_066 0, 0
	ScrCmd_066 1, 1
	ScrCmd_066 2, 2
	ScrCmd_066 3, 3
	ScrCmd_066 4, 4
	ScrCmd_066 5, 5
	// TODO Diamond ScrCmd_Unk0048 0x048 args [2]: no HeartGold mapping yet
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _03CB
	CompareVarToValue 0x8008, 1
	GoToIf 1, _03D6
	CompareVarToValue 0x8008, 2
	GoToIf 1, _03E1
	CompareVarToValue 0x8008, 3
	GoToIf 1, _03EC
	CompareVarToValue 0x8008, 4
	GoToIf 1, _03F7
	GoTo _0402

_03CB:
	NPCMsg msg_0869_SC01R0701_00022
	GoTo _0356

_03D6:
	NPCMsg msg_0869_SC01R0701_00023
	GoTo _0356

_03E1:
	NPCMsg msg_0869_SC01R0701_00024
	GoTo _0356

_03EC:
	NPCMsg msg_0869_SC01R0701_00025
	GoTo _0356

_03F7:
	NPCMsg msg_0869_SC01R0701_00026
	GoTo _0356

_0402:
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0701_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0869_SC01R0701_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC01R0701_0114:
	.short 19, 1
	.short 17, 8
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SC01R0701_0124:
	.short 17, 4
	.short 19, 1
	.short 17, 4
	.short 37, 1
	EndMovement

	.balign 4, 0
mv_SC01R0701_0138:
	.short 63, 1
	.short 35, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01R0701_0148:
	.short 63, 1
	.short 33, 1
	EndMovement


	.balign 4, 0
