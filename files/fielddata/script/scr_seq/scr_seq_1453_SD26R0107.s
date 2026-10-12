#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0107.h"
#include "msgdata/msg/msg_1073_SD26R0107.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0107_000
	ScrDef scr_seq_SD26R0107_001
	ScrDef scr_seq_SD26R0107_002
	ScrDef scr_seq_SD26R0107_003
	ScrDef scr_seq_SD26R0107_004
	ScrDef scr_seq_SD26R0107_005
	ScrDef scr_seq_SD26R0107_006
	ScrDef scr_seq_SD26R0107_007
	ScrDef scr_seq_SD26R0107_008
	ScrDef scr_seq_SD26R0107_009
	ScrDef scr_seq_SD26R0107_010
	ScrDef scr_seq_SD26R0107_011
	ScrDef scr_seq_SD26R0107_012
	ScrDef scr_seq_SD26R0107_013
	ScrDefEnd

scr_seq_SD26R0107_000:
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _0047
	End

_0047:
	MovePerson 0, 9, 6
	End

scr_seq_SD26R0107_001:
	// TODO Diamond ScrCmd_Unk025E 0x25e args []: no HeartGold mapping yet
	End

scr_seq_SD26R0107_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _0105
	CheckFlag FLAG_SINNOH_173
	GoToIf 1, _0110
	NPCMsg msg_1073_SD26R0107_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_COMMANDER_SATURN_SATURN_2, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _011B
	SetFlag FLAG_SINNOH_173
	SetVar VAR_SINNOH_410D, 1
	NPCMsg msg_1073_SD26R0107_00001
	CloseMsg
	GetPlayerFacing 0x8004
	CopyVar 0x4002, 0x8004
	CompareVarToValue 0x8004, 0
	GoToIf 1, _00D1
	CompareVarToValue 0x8004, 2
	GoToIf 1, _00E1
	CompareVarToValue 0x8004, 3
	GoToIf 1, _00F1
	End

_00D1:
	ApplyMovement 0, mv_SD26R0107_0124
	WaitMovement
	GoTo _0101

_00E1:
	ApplyMovement 0, mv_SD26R0107_0130
	WaitMovement
	GoTo _0101

_00F1:
	ApplyMovement 0, mv_SD26R0107_013C
	WaitMovement
	GoTo _0101

_0101:
	ReleaseAll
	End

_0105:
	NPCMsg msg_1073_SD26R0107_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0110:
	NPCMsg msg_1073_SD26R0107_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011B:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD26R0107_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _0164
	NPCMsg msg_1073_SD26R0107_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0164:
	NPCMsg msg_1073_SD26R0107_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _018B
	NPCMsg msg_1073_SD26R0107_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018B:
	NPCMsg msg_1073_SD26R0107_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _01B2
	NPCMsg msg_1073_SD26R0107_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B2:
	NPCMsg msg_1073_SD26R0107_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_006:
	End

scr_seq_SD26R0107_007:
	End

scr_seq_SD26R0107_008:
	End

scr_seq_SD26R0107_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_2429
	GoToIf 1, _02F1
	NPCMsg msg_1073_SD26R0107_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01F7
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02EB
	End

_01F7:
	SetVar VAR_SINNOH_410D, 0
	PlayFanfare SEQ_SE_DP_BUTTON3
	BufferPlayersName 0
	NPCMsg msg_1073_SD26R0107_00006
	CloseMsg
	ClearFlag FLAG_SINNOH_691
	SetFlag FLAG_SINNOH_2429
	// TODO Diamond ScrCmd_Unk025F 0x25f args []: no HeartGold mapping yet
	Wait 30, 0x800C
	ApplyMovement 2, mv_SD26R0107_0314
	ApplyMovement 1, mv_SD26R0107_031C
	ApplyMovement 3, mv_SD26R0107_0324
	WaitMovement
	Wait 30, 0x800C
	HidePerson 2
	HidePerson 1
	HidePerson 3
	Wait 30, 0x800C
	CompareVarToValue 0x4002, 0
	GoToIf 1, _0274
	CompareVarToValue 0x4002, 2
	GoToIf 1, _028E
	CompareVarToValue 0x4002, 3
	GoToIf 1, _02A8
	End

_0274:
	ApplyMovement 0, mv_SD26R0107_02FC
	ApplyMovement obj_player, mv_SD26R0107_032C
	WaitMovement
	GoTo _02C2

_028E:
	ApplyMovement 0, mv_SD26R0107_0308
	ApplyMovement obj_player, mv_SD26R0107_0334
	WaitMovement
	GoTo _02C2

_02A8:
	ApplyMovement 0, mv_SD26R0107_02FC
	ApplyMovement obj_player, mv_SD26R0107_032C
	WaitMovement
	GoTo _02C2

_02C2:
	NPCMsg msg_1073_SD26R0107_00003
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	HidePerson 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	SetFlag FLAG_SINNOH_595
	ReleaseAll
	End

_02EB:
	CloseMsg
	ReleaseAll
	End

_02F1:
	NPCMsg msg_1073_SD26R0107_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_013:
	LockAll
	NPCMsg msg_1073_SD26R0107_00004
	CloseMsg
	ApplyMovement obj_player, mv_SD26R0107_0354
	WaitMovement
	ReleaseAll
	End

scr_seq_SD26R0107_010:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1073_SD26R0107_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_011:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1073_SD26R0107_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0107_012:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1073_SD26R0107_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD26R0107_0124:
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_0130:
	.short 14, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_013C:
	.short 15, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_02FC:
	.short 63, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_0308:
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_0314:
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SD26R0107_031C:
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SD26R0107_0324:
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SD26R0107_032C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_0334:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD26R0107_0354:
	.short 12, 1
	EndMovement


	.balign 4, 0
