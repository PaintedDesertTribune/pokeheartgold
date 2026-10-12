#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD02.h"
#include "msgdata/msg/msg_0930_SD02.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD02_000
	ScrDef scr_seq_SD02_001
	ScrDef scr_seq_SD02_002
	ScrDef scr_seq_SD02_003
	ScrDef scr_seq_SD02_004
	ScrDef scr_seq_SD02_005
	ScrDef scr_seq_SD02_006
	ScrDef scr_seq_SD02_007
	ScrDef scr_seq_SD02_008
	ScrDefEnd

scr_seq_SD02_006:
	End

scr_seq_SD02_000:
	CompareVarToValue VAR_SINNOH_40CF, 2
	CallIf 1, _007E
	CheckFlag FLAG_SINNOH_271
	CallIf 1, _00B7
	CheckFlag FLAG_SINNOH_271
	CallIf 0, _00C1
	CompareVarToValue VAR_SINNOH_4089, 2
	GoToIf 0, _0078
	CheckFlag FLAG_SINNOH_2728
	GoToIf 1, _0078
	SetVar 0x4000, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x4000, 5
	GoToIf 5, _0078
	GoTo _0072

_0072:
	ClearFlag FLAG_SINNOH_553
	End

_0078:
	SetFlag FLAG_SINNOH_553
	End

_007E:
	SetVar VAR_SINNOH_40CF, 3
	Return

scr_seq_SD02_001:
	CheckFlag FLAG_SINNOH_271
	CallIf 1, _00B7
	CheckFlag FLAG_SINNOH_271
	CallIf 0, _00C1
	CheckFlag FLAG_SINNOH_142
	GoToIf 1, _00A9
	End

_00A9:
	SetFlag FLAG_SINNOH_553
	HidePerson 4
	ClearFlag FLAG_SINNOH_142
	End

_00B7:
	MoveBGEvent 1, 243, 650
	Return

_00C1:
	MoveWarp 0, 243, 650
	Return

scr_seq_SD02_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0930_SD02_00000
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_35, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _012F
	NPCMsg msg_0930_SD02_00001
	CloseMsg
	ApplyMovement 0, mv_SD02_0138
	WaitMovement
	// Diamond ScrCmd_PrepareDoorAnimation dropped: scripted door animation; HeartGold animates doors itself
	// Diamond ScrCmd_OpenDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	ApplyMovement 0, mv_SD02_0140
	WaitMovement
	// Diamond ScrCmd_CloseDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_WaitDoorAnimation dropped: scripted door animation
	// Diamond ScrCmd_FreeDoorAnimation dropped: scripted door animation
	NPCMsg msg_0930_SD02_00002
	HidePerson 0
	CloseMsg
	ReleaseAll
	End

_012F:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD02_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	CheckFlag FLAG_SINNOH_159
	GoToIf 1, _0168
	NPCMsg msg_0930_SD02_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0168:
	BufferItemName 0, 438
	NPCMsg msg_0930_SD02_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _019E
	SetFlag FLAG_SINNOH_271
	Call _00B7
	MoveWarp 0, 243, 654
	NPCMsg msg_0930_SD02_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019E:
	CloseMsg
	ReleaseAll
	End

scr_seq_SD02_004:
	DirectionSignpost msg_0930_SD02_00007, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SD02_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry 425, 0
	NPCMsg msg_0930_SD02_00006
	CloseMsg
	WaitCry
	SetFlag FLAG_SINNOH_142
	WildBattle 425, 22
	ClearFlag FLAG_SINNOH_142
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01F7
	SetFlag FLAG_SINNOH_2728
	ReleaseAll
	End

_01F7:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
mv_SD02_0138:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD02_0140:
	.short 12, 1
	.short 69, 1
	EndMovement

scr_seq_SD02_007:
	SetVar VAR_SPECIAL_x8008, 351
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD02_008:
	SetVar VAR_SPECIAL_x8008, 17
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
