#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR224.h"
#include "msgdata/msg/msg_1212_SR224.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR224_000
	ScrDef scr_seq_SR224_001
	ScrDef scr_seq_SR224_002
	ScrDef scr_seq_SR224_003
	ScrDefEnd

scr_seq_SR224_000:
	CheckFlag FLAG_SINNOH_301
	GoToIf 1, _006B
	CheckGameClearFlag 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _006B
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _006B
	HasItem 452, 1, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _006B
	SetVar 0x4000, 0   // Diamond ScrCmd_CheckEventValidity: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _006B
	ClearFlag FLAG_SINNOH_624

_006B:
	End

scr_seq_SR224_001:
	CheckFlag FLAG_SINNOH_301
	GoToIf 1, _0085
	CompareVarToValue VAR_SINNOH_408D, 1
	CallIf 1, _0087

_0085:
	End

_0087:
	// TODO Diamond ScrCmd_SetEventDirection 0x18c args [3, 0]: no HeartGold mapping yet
	Return

scr_seq_SR224_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_301
	GoToIf 1, _00AD
	NPCMsg msg_1212_SR224_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00AD:
	// TODO Diamond ScrCmd_GetWhiteRockInscription 0x272 args [1]: no HeartGold mapping yet
	NPCMsg msg_1212_SR224_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR224_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_301
	GoToIf 1, _01B8
	SetVar VAR_SINNOH_408D, 1
	BufferPlayersName 0
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01A4
	NPCMsg msg_1212_SR224_00000

_00EB:
	CloseMsg
	Call _01CB
	BufferPlayersName 0
	NPCMsg msg_1212_SR224_00002
	CloseMsg

_00FB:
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_WriteWhiteRockInscription 0x271 args [32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01AD
	BufferPlayersName 0
	// TODO Diamond ScrCmd_GetWhiteRockInscription 0x272 args [1]: no HeartGold mapping yet
	NPCMsg msg_1212_SR224_00003
	YesNo 0x800C
	CloseMsg
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00FB
	Call _0225
	Wait 15, 0x800C
	// TODO Diamond ScrCmd_FadeOutBgm 0x054 args [0, 10]: no HeartGold mapping yet
	FadeScreen 6, 6, 0, 32767
	WaitFade
	// Diamond ScrCmd_Unk0270 dropped: Diamond save-flag toggle of unknown purpose
	Warp MAP_SINNOH_ROUTE_224, 0, 908, 492, 0
	Wait 15, 0x800C
	FadeScreen 6, 6, 1, 32767
	WaitFade
	Call _0239
	NPCMsg msg_1212_SR224_00004
	WaitButton
	CloseMsg
	// TODO Diamond ScrCmd_FadeInBgm 0x055 args [10]: no HeartGold mapping yet
	SetFlag FLAG_SINNOH_301
	SetFlag FLAG_SINNOH_624
	SetVar VAR_SINNOH_408D, 0
	ReleaseAll
	End

_01A4:
	NPCMsg msg_1212_SR224_00001
	GoTo _00EB

_01AD:
	NPCMsg msg_1212_SR224_00005
	CloseMsg
	GoTo _00FB

_01B8:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1212_SR224_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01CB:
	GetPlayerCoords 0x8000, 0x8001
	CopyVar 0x8008, 0x8000
	CompareVarToValue 0x8008, 909
	GoToIf 1, _01FD
	CompareVarToValue 0x8008, 910
	GoToIf 1, _0211
	ApplyMovement obj_player, mv_SR224_029C
	WaitMovement
	Return

_01FD:
	ApplyMovement obj_player, mv_SR224_02AC
	ApplyMovement 3, mv_SR224_02D8
	WaitMovement
	Return

_0211:
	ApplyMovement obj_player, mv_SR224_02C0
	ApplyMovement 3, mv_SR224_02E4
	WaitMovement
	Return

_0225:
	ApplyMovement obj_player, mv_SR224_02F8
	ApplyMovement 3, mv_SR224_02F8
	WaitMovement
	Return

_0239:
	ApplyMovement 3, mv_SR224_0378
	ApplyMovement obj_player, mv_SR224_033C
	ApplyMovement 16, mv_SR224_03A4
	WaitMovement
	PlayCry 492, 0
	WaitCry
	ApplyMovement 3, mv_SR224_0300
	ApplyMovement 16, mv_SR224_0324
	ApplyMovement obj_player, mv_SR224_0310
	WaitMovement
	ApplyMovement 16, mv_SR224_03AC
	WaitMovement
	SetFlag FLAG_SINNOH_634
	HidePerson 16
	PlayCry 492, 0
	WaitCry
	ApplyMovement 3, mv_SR224_0334
	WaitMovement
	Return

	.balign 4, 0
mv_SR224_029C:
	.short 0, 1
	.short 65, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SR224_02AC:
	.short 14, 1
	.short 12, 1
	.short 65, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SR224_02C0:
	.short 13, 1
	.short 14, 2
	.short 12, 1
	.short 65, 1
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SR224_02D8:
	.short 63, 1
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SR224_02E4:
	.short 63, 1
	.short 1, 1
	.short 63, 2
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SR224_02F8:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SR224_0300:
	.short 3, 1
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR224_0310:
	.short 65, 1
	.short 3, 1
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR224_0324:
	.short 2, 1
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR224_0334:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_SR224_033C:
	.short 2, 1
	.short 65, 1
	.short 1, 1
	.short 65, 1
	.short 3, 1
	.short 65, 1
	.short 1, 1
	.short 65, 1
	.short 2, 1
	.short 65, 1
	.short 0, 1
	.short 65, 1
	.short 1, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR224_0378:
	.short 1, 1
	.short 65, 1
	.short 3, 1
	.short 65, 1
	.short 1, 1
	.short 65, 1
	.short 2, 1
	.short 65, 1
	.short 0, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SR224_03A4:
	.short 13, 12
	EndMovement

	.balign 4, 0
mv_SR224_03AC:
	.short 0, 1
	.short 65, 1
	.short 76, 12
	EndMovement

	.balign 4, 0
