#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD16R0102.h"
#include "msgdata/msg/msg_1236_SD16R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD16R0102_000
	ScrDef scr_seq_SD16R0102_001
	ScrDef scr_seq_SD16R0102_002
	ScrDef scr_seq_SD16R0102_003
	ScrDef scr_seq_SD16R0102_004
	ScrDef scr_seq_SD16R0102_005
	ScrDefEnd

scr_seq_SD16R0102_005:
	CompareVarToValue VAR_SINNOH_4094, 2
	GoToIf 0, _0029
	End

_0029:
	SetVar VAR_SINNOH_4094, 0
	End

scr_seq_SD16R0102_000:
	LockAll
	PlayerOnBikeSet 0
	ApplyMovement 14, mv_SD16R0102_00D8
	WaitMovement
	BufferPlayersName 0
	CheckFlag FLAG_SINNOH_221
	CallIf 0, _0088
	CheckFlag FLAG_SINNOH_221
	CallIf 1, _008D
	BufferPlayersName 0
	PlaySE 1153
	NPCMsg msg_1236_SD16R0102_00001
	WaitSE 1153
	SetFlag FLAG_SINNOH_221
	SetVar VAR_SINNOH_4094, 1
	NPCMsg msg_1236_SD16R0102_00002
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_403F, 611
	// TODO Diamond ScrCmd_Unk0161 0x161 args []: no HeartGold mapping yet
	SetObjectMovementType 14, 48
	ReleaseAll
	End

_0088:
	NPCMsg msg_1236_SD16R0102_00000
	Return

_008D:
	NPCMsg msg_1236_SD16R0102_00003
	Return

scr_seq_SD16R0102_001:
	LockAll
	ApplyMovement 14, mv_SD16R0102_00E0
	ApplyMovement obj_player, mv_SD16R0102_00C8
	WaitMovement
	NPCMsg msg_1236_SD16R0102_00004
	CloseMsg
	SetVar VAR_SINNOH_4094, 0
	// TODO Diamond ScrCmd_Unk0162 0x162 args []: no HeartGold mapping yet
	SetObjectMovementType 14, 15
	ApplyMovement 14, mv_SD16R0102_00D0
	WaitMovement
	ReleaseAll
	End

scr_seq_SD16R0102_002:
	LockAll
	// TODO Diamond ScrCmd_Unk0162 0x162 args []: no HeartGold mapping yet
	SetObjectMovementType 14, 15
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _010B
	GoTo _0125

_010B:
	ApplyMovement 14, mv_SD16R0102_0184
	ApplyMovement obj_player, mv_SD16R0102_0178
	WaitMovement
	GoTo _013F

_0125:
	ApplyMovement 14, mv_SD16R0102_0190
	ApplyMovement obj_player, mv_SD16R0102_0178
	WaitMovement
	GoTo _013F

_013F:
	ApplyMovement 14, mv_SD16R0102_0198
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_1236_SD16R0102_00005
	CloseMsg
	ApplyMovement 14, mv_SD16R0102_01A8
	WaitMovement
	WaitSE 1500
	PlayFanfare 1539
	HidePerson 14
	WaitSE 1539
	SetVar VAR_SINNOH_4094, 2
	ReleaseAll
	End

scr_seq_SD16R0102_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1236_SD16R0102_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD16R0102_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1236_SD16R0102_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD16R0102_00C8:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_00D0:
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_00D8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_00E0:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_0178:
	.short 14, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_0184:
	.short 12, 1
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_0190:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_0198:
	.short 32, 1
	.short 63, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD16R0102_01A8:
	.short 12, 1
	EndMovement

	.balign 4, 0
