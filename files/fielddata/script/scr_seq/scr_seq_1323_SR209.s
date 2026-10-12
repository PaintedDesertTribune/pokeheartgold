#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR209.h"
#include "msgdata/msg/msg_1008_SR209.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR209_000
	ScrDef scr_seq_SR209_001
	ScrDef scr_seq_SR209_002
	ScrDef scr_seq_SR209_003
	ScrDef scr_seq_SR209_004
	ScrDef scr_seq_SR209_005
	ScrDef scr_seq_SR209_006
	ScrDef scr_seq_SR209_007
	ScrDef scr_seq_SR209_008
	ScrDef scr_seq_SR209_009
	ScrDef scr_seq_SR209_010
	ScrDef scr_seq_SR209_011
	ScrDef scr_seq_SR209_012
	ScrDef scr_seq_SR209_013
	ScrDefEnd

scr_seq_SR209_007:
	SetVar 0x4000, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _006D
	CompareVarToValue 0x4000, 1
	GoToIf 1, _007F
	CompareVarToValue 0x4000, 2
	GoToIf 1, _007F
	CompareVarToValue 0x4000, 3
	GoToIf 1, _007F
	CompareVarToValue 0x4000, 4
	GoToIf 1, _007F
	End

_006D:
	ClearFlag FLAG_SINNOH_651
	ClearFlag FLAG_SINNOH_653
	SetFlag FLAG_SINNOH_650
	SetFlag FLAG_SINNOH_652
	End

_007F:
	ClearFlag FLAG_SINNOH_650
	ClearFlag FLAG_SINNOH_652
	SetFlag FLAG_SINNOH_651
	SetFlag FLAG_SINNOH_653
	End

scr_seq_SR209_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1008_SR209_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR209_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CompareVarToValue VAR_SINNOH_408A, 1
	GoToIf 1, _0102
	HasItem 111, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01BC
	NPCMsg msg_1008_SR209_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E6
	CloseMsg
	ReleaseAll
	End

_00E6:
	BufferPlayersName 0
	NPCMsg msg_1008_SR209_00003
	WaitButton
	TakeItem 111, 1, 0x800C
	SetVar VAR_SINNOH_408A, 1
	CloseMsg
	ReleaseAll
	End

_0102:
	// TODO Diamond ScrCmd_GetSpiritombTalkCounter 0x214 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 32
	GoToIf 4, _014D
	CompareVarToValue 0x800C, 29
	GoToIf 4, _01B1
	CompareVarToValue 0x800C, 22
	GoToIf 4, _01A6
	CompareVarToValue 0x800C, 15
	GoToIf 4, _019B
	CompareVarToValue 0x800C, 8
	GoToIf 4, _0190
	GoTo _0185

_014D:
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 442, 0
	NPCMsg msg_1008_SR209_00009
	WaitCry
	CloseMsg
	WildBattle 442, 25
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _017F
	SetVar VAR_SINNOH_408A, 0
	// TODO Diamond ScrCmd_ResetSpiritombTalkCounter 0x26f args []: no HeartGold mapping yet
	End

_017F:
	WhiteOut
	ReleaseAll
	End

_0185:
	NPCMsg msg_1008_SR209_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0190:
	NPCMsg msg_1008_SR209_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019B:
	NPCMsg msg_1008_SR209_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01A6:
	NPCMsg msg_1008_SR209_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B1:
	NPCMsg msg_1008_SR209_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01BC:
	NPCMsg msg_1008_SR209_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR209_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar 0x8004, 446
	// TODO Diamond ScrCmd_GetItemNameWithIndefArticle 0x2c4 args [0, 32772]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_CapitalizeFirstChar 0x2ce args [0]: no HeartGold mapping yet
	CheckFlag FLAG_SINNOH_162
	GoToIf 1, _020B
	NPCMsg msg_1008_SR209_00011
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0254
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0249
	End

_020B:
	BufferItemName 0, 0x8004
	NPCMsg msg_1008_SR209_00013
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0233
	CompareVarToValue 0x800C, 1
	GoToIf 1, _023E
	End

_0233:
	NPCMsg msg_1008_SR209_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_023E:
	NPCMsg msg_1008_SR209_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0249:
	NPCMsg msg_1008_SR209_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0254:
	BufferItemName 0, 0x8004
	NPCMsg msg_1008_SR209_00012
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_162
	GoTo _020B

scr_seq_SR209_002:
	DirectionSignpost msg_1008_SR209_00019, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR209_003:
	DirectionSignpost msg_1008_SR209_00020, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR209_008:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_1008_SR209_00021, 0x800C
	CallStd std_signpost
	End

scr_seq_SR209_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1008_SR209_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR209_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1008_SR209_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR209_009:
	SetVar VAR_SPECIAL_x8008, 94
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR209_010:
	SetVar VAR_SPECIAL_x8008, 60
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR209_011:
	SetVar VAR_SPECIAL_x8008, 374
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR209_012:
	SetVar VAR_SPECIAL_x8008, 49
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR209_013:
	SetVar VAR_SPECIAL_x8008, 346
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
