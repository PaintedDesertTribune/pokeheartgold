#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC10R0113.h"
#include "msgdata/msg/msg_1192_SC10R0113.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC10R0113_000
	ScrDefEnd

scr_seq_SC10R0113_000:
	LockAll
	ApplyMovement obj_player, mv_SC10R0113_0128
	WaitMovement
	ApplyMovement 1, mv_SC10R0113_0138
	WaitMovement
	// TODO Diamond ScrCmd_Unk028F 0x28f args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	CallIf 1, _0115
	CompareVarToValue 0x800C, 0
	CallIf 5, _011D
	CloseMsg
	ApplyMovement 1, mv_SC10R0113_0148
	ApplyMovement 0, mv_SC10R0113_0160
	WaitMovement
	Wait 15, 0x800C
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0074
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0080
	ReleaseAll
	End

_0074:
	BufferPlayersName 0
	NPCMsg msg_1192_SC10R0113_00004
	GoTo _008C

_0080:
	BufferPlayersName 0
	NPCMsg msg_1192_SC10R0113_00005
	GoTo _008C

_008C:
	CloseMsg
	ApplyMovement obj_player, mv_SC10R0113_0130
	ApplyMovement 1, mv_SC10R0113_0150
	ApplyMovement 0, mv_SC10R0113_0168
	WaitMovement
	NPCMsg msg_1192_SC10R0113_00006
	CloseMsg
	SetFlag FLAG_SINNOH_2434
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _010E
	CompareVarToValue VAR_SINNOH_40F4, 0
	CallIf 1, _0106
	GetPartyCount 0x800C
	// TODO Diamond ScrCmd_Unk025A 0x25a args [32780]: no HeartGold mapping yet
	FadeScreen 6, 3, 0, 0
	WaitFade
	AddSpecialGameStat 24
	// TODO Diamond ScrCmd_IncrementGameStat 0x1e5 args [46]: no HeartGold mapping yet
	Call _0178
	// TODO Diamond ScrCmd_ShowEndGameScreen 0x0b0 args []: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	ReleaseAll
	End

_0106:
	SetVar VAR_SINNOH_40F4, 1
	Return

_010E:
	// TODO Diamond ScrCmd_Unk0270 0x270 args [2, 1]: no HeartGold mapping yet
	Return

_0115:
	NPCMsg msg_1192_SC10R0113_00000
	NPCMsg msg_1192_SC10R0113_00002
	Return

_011D:
	NPCMsg msg_1192_SC10R0113_00001
	NPCMsg msg_1192_SC10R0113_00003
	Return

_0178:
	ClearFlag FLAG_SINNOH_495
	ClearFlag FLAG_SINNOH_2443
	CheckFlag FLAG_SINNOH_351
	CallIf 0, _01D2
	CheckFlag FLAG_SINNOH_288
	CallIf 0, _01E2
	CheckFlag FLAG_SINNOH_283
	CallIf 0, _01F9
	CheckFlag FLAG_SINNOH_294
	CallIf 0, _0211
	CheckFlag FLAG_SINNOH_295
	CallIf 0, _0217
	CompareVarToValue VAR_SINNOH_410F, 0
	CallIf 1, _01CA
	ClearFlag FLAG_SINNOH_405
	Return

_01CA:
	SetVar VAR_SINNOH_410F, 1
	Return

_01D2:
	SetVar VAR_SINNOH_4098, 5
	// TODO Diamond ScrCmd_DebugWatch 0x1f9 args [16536]: no HeartGold mapping yet
	ClearFlag FLAG_SINNOH_482
	Return

_01E2:
	CheckFlag FLAG_SINNOH_293
	GoToIf 0, _01F7
	ClearFlag FLAG_SINNOH_507
	SetVar VAR_SINNOH_409E, 1

_01F7:
	Return

_01F9:
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _020F
	ClearFlag FLAG_SINNOH_609

_020F:
	Return

_0211:
	ClearFlag FLAG_SINNOH_510
	Return

_0217:
	ClearFlag FLAG_SINNOH_511
	Return

	.balign 4, 0
mv_SC10R0113_0128:
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SC10R0113_0130:
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_SC10R0113_0138:
	.short 32, 1
	.short 63, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC10R0113_0148:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC10R0113_0150:
	.short 63, 1
	.short 35, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC10R0113_0160:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC10R0113_0168:
	.short 63, 1
	.short 34, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
