#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0205.h"
#include "msgdata/msg/msg_0856_SC01R0205.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0205_000
	ScrDef scr_seq_SC01R0205_001
	ScrDef scr_seq_SC01R0205_002
	ScrDef scr_seq_SC01R0205_003
	ScrDef scr_seq_SC01R0205_004
	ScrDef scr_seq_SC01R0205_005
	ScrDef scr_seq_SC01R0205_006
	ScrDef scr_seq_SC01R0205_007
	ScrDef scr_seq_SC01R0205_008
	ScrDef scr_seq_SC01R0205_009
	ScrDef scr_seq_SC01R0205_010
	ScrDef scr_seq_SC01R0205_011
	ScrDef scr_seq_SC01R0205_012
	ScrDef scr_seq_SC01R0205_013
	ScrDefEnd

scr_seq_SC01R0205_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x8007, 0
	CheckFlag FLAG_SINNOH_136
	CallIf 0, _006F
	CompareVarToValue 0x4001, 0
	GoToIf 1, _0077
	CompareVarToValue 0x4001, 1
	GoToIf 1, _0080
	End

_006F:
	SetVar 0x8007, 1
	Return

_0077:
	NPCMsg msg_0856_SC01R0205_00001
	GoTo _00B5

_0080:
	NPCMsg msg_0856_SC01R0205_00011
	GoTo _00B5

_0089:
	NPCMsg msg_0856_SC01R0205_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00AC
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00F5
	End

_00AC:
	NPCMsg msg_0856_SC01R0205_00006
	GoTo _00D5

_00B5:
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0089
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02B5
	End

_00D5:
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F5
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02B5
	End

_00F5:
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0115
	CompareVarToValue 0x800C, 1
	GoToIf 5, _0121
	End

_0115:
	SetVar 0x4002, 0
	GoTo _016E

_0121:
	NPCMsg msg_0856_SC01R0205_00004
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x4002
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x4002, 255
	GoToIf 1, _02B5
	GetPartyMonSpecies 0x4002, 0x800C
	// TODO unknown Diamond command cmd_800c (0x800c); script truncated here
	End

_016E:
	NPCMsg msg_0856_SC01R0205_00005
	CloseMsg
	GetPlayerFacing 0x8006
	CompareVarToValue 0x8006, 0
	GoToIf 1, _01A0
	CompareVarToValue 0x8006, 2
	GoToIf 1, _01BA
	CompareVarToValue 0x8006, 3
	GoToIf 1, _01D4
	End

_01A0:
	ApplyMovement 0, mv_SC01R0205_0374
	WaitMovement
	ApplyMovement obj_player, mv_SC01R0205_0340
	WaitMovement
	GoTo _01EE

_01BA:
	ApplyMovement 0, mv_SC01R0205_0380
	WaitMovement
	ApplyMovement obj_player, mv_SC01R0205_0348
	WaitMovement
	GoTo _01EE

_01D4:
	ApplyMovement 0, mv_SC01R0205_038C
	WaitMovement
	ApplyMovement obj_player, mv_SC01R0205_0354
	WaitMovement
	GoTo _01EE

_01EE:
	SetFlag FLAG_SINNOH_136
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_DressupPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	ApplyMovement obj_player, mv_SC01R0205_0360
	WaitMovement
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8006, 0
	GoToIf 1, _0247
	CompareVarToValue 0x8006, 2
	GoToIf 1, _0261
	CompareVarToValue 0x8006, 3
	GoToIf 1, _027B
	End

_0247:
	ApplyMovement obj_player, mv_SC01R0205_0368
	WaitMovement
	ApplyMovement 0, mv_SC01R0205_0398
	WaitMovement
	GoTo _0295

_0261:
	ApplyMovement obj_player, mv_SC01R0205_0368
	WaitMovement
	ApplyMovement 0, mv_SC01R0205_03A4
	WaitMovement
	GoTo _0295

_027B:
	ApplyMovement obj_player, mv_SC01R0205_0368
	WaitMovement
	ApplyMovement 0, mv_SC01R0205_03B0
	WaitMovement
	GoTo _0295

_0295:
	CompareVarToValue 0x8005, 0
	GoToIf 1, _0333
	SetVar 0x4001, 1
	NPCMsg msg_0856_SC01R0205_00007
	WaitButton
	CloseMsg
	GoTo _02C9

_02B5:
	NPCMsg msg_0856_SC01R0205_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02C9:
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0243 0x243 args [0, 32780, 32772]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0326
	// TODO Diamond ScrCmd_Unk0130 0x130 args [32772]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0245 0x245 args [0, 32772]: no HeartGold mapping yet
	NPCMsg msg_0856_SC01R0205_00008
	WaitButton
	ApplyMovement 0, mv_SC01R0205_03BC
	WaitMovement
	NPCMsg msg_0856_SC01R0205_00014
	WaitButton
	CloseMsg
	ApplyMovement 0, mv_SC01R0205_03C4
	WaitMovement
	ReleaseAll
	End

_0326:
	NPCMsg msg_0856_SC01R0205_00009
	WaitButton
	CloseMsg
	GoTo _02C9

_0333:
	NPCMsg msg_0856_SC01R0205_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0205_001:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_002:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_003:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_004:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_005:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_006:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_007:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_008:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_009:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_010:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

scr_seq_SC01R0205_011:
	PlayFanfare 1500
	LockAll
	// Diamond ScrCmd_CheckPortraitSlot dropped: Jubilife TV portrait feature dropped
	CompareVarToValue 0x800C, 0
	GoToIf 1, _066B
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_ShowDressedPokemon dropped: Contest dress-up dropped (decision 16)
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_066B:
	NPCMsg msg_0856_SC01R0205_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0205_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0856_SC01R0205_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0205_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0856_SC01R0205_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC01R0205_0340:
	.short 8, 2
	EndMovement

	.balign 4, 0
mv_SC01R0205_0348:
	.short 10, 1
	.short 8, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0354:
	.short 11, 1
	.short 8, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0360:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0368:
	.short 9, 2
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0374:
	.short 14, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0380:
	.short 14, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_038C:
	.short 15, 1
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_0398:
	.short 15, 1
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_03A4:
	.short 15, 1
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_03B0:
	.short 14, 1
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_03BC:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SC01R0205_03C4:
	.short 1, 1
	EndMovement

	.balign 4, 0
