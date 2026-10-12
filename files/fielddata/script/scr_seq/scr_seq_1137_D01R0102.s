#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D01R0102.h"
#include "msgdata/msg/msg_0915_D01R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D01R0102_000
	ScrDef scr_seq_D01R0102_001
	ScrDef scr_seq_D01R0102_002
	ScrDef scr_seq_D01R0102_003
	ScrDef scr_seq_D01R0102_004
	ScrDefEnd

scr_seq_D01R0102_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GoTo _0034

_0034:
	ApplyMovement 0, mv_D01R0102_00D8
	WaitMovement
	GoTo _0044

_0044:
	NPCMsg msg_0915_D01R0102_00000
	CloseMsg
	// TODO Diamond ScrCmd_Unk029E 0x29e args [2, 32773]: no HeartGold mapping yet
	Wait 10, 0x800C
	HidePerson 1

_0059:
	Wait 1, 0x800C
	CompareVarToValue 0x8005, 0
	GoToIf 1, _0059
	FacePlayer
	NPCMsg msg_0915_D01R0102_00001
	CloseMsg
	GoTo _0091

_0091:
	ApplyMovement 0, mv_D01R0102_00C0
	WaitMovement
	GoTo _00A1

_00A1:
	HidePerson 0
	SetFlag FLAG_SINNOH_122
	SetFlag FLAG_SINNOH_410
	ReleaseAll
	End

scr_seq_D01R0102_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 66, 0
	NPCMsg msg_0915_D01R0102_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D01R0102_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 66, 0
	NPCMsg msg_0915_D01R0102_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D01R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 66, 0
	NPCMsg msg_0915_D01R0102_00004
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D01R0102_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0915_D01R0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_D01R0102_00C0:
	.short 15, 10
	EndMovement

	.balign 4, 0
mv_D01R0102_00D8:
	.short 63, 2
	.short 35, 1
	.short 63, 4
	EndMovement

	.balign 4, 0
