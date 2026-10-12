#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0501.h"
#include "msgdata/msg/msg_0840_C02R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0501_000
	ScrDef scr_seq_C02R0501_001
	ScrDef scr_seq_C02R0501_002
	ScrDefEnd

scr_seq_C02R0501_000:
	CompareVarToValue VAR_SINNOH_4106, 0
	GoToIf 1, _0037
	CompareVarToValue VAR_SINNOH_4106, 3
	CallIf 1, _0073
	CompareVarToValue VAR_SINNOH_4106, 1
	CallIf 4, _007B

_0035:
	End

_0037:
	CheckFlag FLAG_SINNOH_300
	GoToIf 1, _0035
	CheckGameClearFlag 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0035
	NatDexFlagAction 2, 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0035
	SetVar VAR_SINNOH_4106, 1
	Call _007B
	End

_0073:
	SetVar VAR_SINNOH_4106, 0
	Return

_007B:
	MovePerson 0, 8, 6
	SetObjectFacing 0, 1
	SetObjectMovementType 0, 0
	MovePerson 1, 9, 6
	SetObjectFacing 1, 2
	Return

scr_seq_C02R0501_002:
	CopyVar 0x8008, VAR_SINNOH_4106
	CompareVarToValue 0x8008, 1
	GoToIf 1, _00E5
	CompareVarToValue 0x8008, 2
	GoToIf 1, _00E5
	CompareVarToValue 0x8008, 3
	GoToIf 1, _00F8
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0840_C02R0501_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E5:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0840_C02R0501_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F8:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0840_C02R0501_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0501_001:
	CompareVarToValue VAR_SINNOH_4106, 1
	GoToIf 1, _0158
	CompareVarToValue VAR_SINNOH_4106, 2
	GoToIf 1, _0158
	CompareVarToValue VAR_SINNOH_4106, 3
	GoToIf 1, _0145
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0840_C02R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0145:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0840_C02R0501_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0158:
	CheckFlag FLAG_SINNOH_307
	GoToIf 0, _01EA
	CheckFlag FLAG_SINNOH_287
	GoToIf 0, _01D9
	HasItem 453, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D9
	PlayFanfare 1500
	LockAll
	SetFlag FLAG_SINNOH_300
	SetVar VAR_SINNOH_4106, 3
	TakeItem 453, 1, 0x800C
	BufferPlayersName 0
	NPCMsg msg_0840_C02R0501_00002
	NPCMsg msg_0840_C02R0501_00003
	PlaySE 1166
	// Diamond ScrCmd_PlaySoundWait dropped: waits for the current sound effect; HeartGold's WaitSE needs the effect id
	CloseMsg
	Wait 15, 0x800C
	Call _01FC
	NPCMsg msg_0840_C02R0501_00005
	Call _0256
	NPCMsg msg_0840_C02R0501_00006
	Call _0262
	NPCMsg msg_0840_C02R0501_00007
	CloseMsg
	Call _026E
	ReleaseAll
	End

_01D9:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0840_C02R0501_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01EA:
	SetFlag FLAG_SINNOH_307
	SetVar VAR_SINNOH_4106, 2
	GoTo _01D9

_01FC:
	PlayFanfare 1539
	WaitSE 1539
	ClearFlag FLAG_SINNOH_633
	ShowPerson 2
	Wait 5, 0x800C
	ApplyMovement 1, mv_C02R0501_0294
	ApplyMovement 0, mv_C02R0501_0294
	ApplyMovement obj_player, mv_C02R0501_0294
	WaitMovement
	ApplyMovement 2, mv_C02R0501_02B4
	WaitMovement
	ApplyMovement obj_player, mv_C02R0501_02C0
	WaitMovement
	ApplyMovement 2, mv_C02R0501_02D4
	WaitMovement
	ApplyMovement obj_player, mv_C02R0501_029C
	WaitMovement
	Return

_0256:
	ApplyMovement 2, mv_C02R0501_02A4
	WaitMovement
	Return

_0262:
	ApplyMovement 2, mv_C02R0501_02AC
	WaitMovement
	Return

_026E:
	ApplyMovement obj_player, mv_C02R0501_0294
	ApplyMovement 2, mv_C02R0501_02DC
	WaitMovement
	SetFlag FLAG_SINNOH_633
	HidePerson 2
	PlayFanfare 1539
	WaitSE 1539
	Return

	.balign 4, 0
mv_C02R0501_0294:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_029C:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_02A4:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_02AC:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_02B4:
	.short 12, 2
	.short 15, 2
	EndMovement

	.balign 4, 0
mv_C02R0501_02C0:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_02D4:
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_C02R0501_02DC:
	.short 14, 3
	.short 13, 2
	EndMovement

	.balign 4, 0
