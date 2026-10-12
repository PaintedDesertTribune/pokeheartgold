#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0101.h"
#include "msgdata/msg/msg_1105_SC06R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0101_000
	ScrDef scr_seq_SC06R0101_001
	ScrDef scr_seq_SC06R0101_002
	ScrDef scr_seq_SC06R0101_003
	ScrDef scr_seq_SC06R0101_004
	ScrDefEnd

scr_seq_SC06R0101_000:
	End

scr_seq_SC06R0101_001:
	LockAll
	ApplyMovement obj_player, mv_SC06R0101_0188
	WaitMovement
	GetPlayerCoords 0x4000, 0x4001
	CompareVarToValue 0x4000, 5
	CallIf 1, _0173
	ShowMoneyBox 20, 2
	NPCMsg msg_1105_SC06R0101_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0060
	CompareVarToValue 0x800C, 1
	GoToIf 1, _014C
	End

_0060:
	SetVar 0x800C, 1   // Diamond ScrCmd_CountPCFreeSpace: result fixed
	CompareVarToValue 0x800C, 0
	GoToIf 5, _0082
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _015E

_0082:
	NPCMsg msg_1105_SC06R0101_00001
	HasEnoughMoneyImmediate 0x800C, 500
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0137
	PlayFanfare 1604
	SubMoneyImmediate 500
	UpdateMoneyBox
	NPCMsg msg_1105_SC06R0101_00002
	BufferPlayersName 0
	NPCMsg msg_1105_SC06R0101_00003
	NPCMsg msg_1105_SC06R0101_00004
	CloseMsg
	HideMoneyBox
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 4
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 5
	GoToIf 1, _00E8
	End

_00D8:
	ApplyMovement obj_player, mv_SC06R0101_0190
	WaitMovement
	GoTo _00F8

_00E8:
	ApplyMovement obj_player, mv_SC06R0101_01A8
	WaitMovement
	GoTo _00F8

_00F8:
	SetVar VAR_SINNOH_40DA, 1
	// TODO Diamond ScrCmd_EnableDisableSafariZone 0x202 args [0]: no HeartGold mapping yet
	SetDynamicWarp 125, 2, 5, 2, 1
	PlayFanfare 1539
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_GREAT_MARSH_AREA_6, 0, 68, 116, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	End

_0137:
	NPCMsg msg_1105_SC06R0101_00006
	CloseMsg
	HideMoneyBox
	ApplyMovement obj_player, mv_SC06R0101_01B8
	WaitMovement
	ReleaseAll
	End

_014C:
	CloseMsg
	HideMoneyBox
	ApplyMovement obj_player, mv_SC06R0101_01B8
	WaitMovement
	ReleaseAll
	End

_015E:
	HideMoneyBox
	NPCMsg msg_1105_SC06R0101_00007
	CloseMsg
	ApplyMovement obj_player, mv_SC06R0101_01B8
	WaitMovement
	ReleaseAll
	End

_0173:
	ApplyMovement obj_player, mv_SC06R0101_0180
	WaitMovement
	Return

scr_seq_SC06R0101_002:
	LockAll
	NPCMsg msg_1105_SC06R0101_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01E5
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0201
	ReleaseAll
	End

_01E5:
	NPCMsg msg_1105_SC06R0101_00010
	CloseMsg
	ApplyMovement obj_player, mv_SC06R0101_0234
	WaitMovement
	SetVar VAR_SINNOH_40DA, 0
	// TODO Diamond ScrCmd_EnableDisableSafariZone 0x202 args [1]: no HeartGold mapping yet
	ReleaseAll
	ReleaseAll
	End

_0201:
	CloseMsg
	ApplyMovement obj_player, mv_SC06R0101_023C
	WaitMovement
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_GREAT_MARSH_AREA_6, 0, 68, 116, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC06R0101_003:
	LockAll
	ApplyMovement obj_player, mv_SC06R0101_0234
	WaitMovement
	SetVar VAR_SINNOH_40DA, 0
	ReleaseAll
	ReleaseAll
	End

scr_seq_SC06R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1105_SC06R0101_00012
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _028D
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0298
	End

_028D:
	NPCMsg msg_1105_SC06R0101_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0298:
	NPCMsg msg_1105_SC06R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC06R0101_0180:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SC06R0101_0188:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC06R0101_0190:
	.short 32, 1
	.short 12, 3
	.short 15, 1
	.short 12, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC06R0101_01A8:
	.short 32, 1
	.short 12, 4
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SC06R0101_01B8:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC06R0101_0234:
	.short 13, 5
	EndMovement

	.balign 4, 0
mv_SC06R0101_023C:
	.short 0, 1
	.short 12, 1
	.short 69, 1
	EndMovement


	.balign 4, 0
