#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D03R0101.h"
#include "msgdata/msg/msg_0934_D03R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D03R0101_000
	ScrDef scr_seq_D03R0101_001
	ScrDef scr_seq_D03R0101_002
	ScrDef scr_seq_D03R0101_003
	ScrDef scr_seq_D03R0101_004
	ScrDef scr_seq_D03R0101_005
	ScrDef scr_seq_D03R0101_006
	ScrDef scr_seq_D03R0101_007
	ScrDef scr_seq_D03R0101_008
	ScrDef scr_seq_D03R0101_009
	ScrDef scr_seq_D03R0101_010
	ScrDef scr_seq_D03R0101_011
	ScrDefEnd

scr_seq_D03R0101_011:
	CheckFlag FLAG_SINNOH_227
	GoToIf 0, _003F
	End

_003F:
	SetVar VAR_SINNOH_40B1, 0
	End

scr_seq_D03R0101_000:
	LockAll
	PlayerOnBikeSet 0
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 28
	GoToIf 1, _006E
	CompareVarToValue 0x8004, 29
	GoToIf 1, _007E
	End

_006E:
	ApplyMovement 0, mv_D03R0101_00E8
	WaitMovement
	GoTo _008E

_007E:
	ApplyMovement 0, mv_D03R0101_00F4
	WaitMovement
	GoTo _008E

_008E:
	CheckFlag FLAG_SINNOH_139
	CallIf 0, _00D8
	CheckFlag FLAG_SINNOH_139
	CallIf 1, _00E0
	BufferPlayersName 0
	PlaySE 1153
	NPCMsg msg_0934_D03R0101_00001
	WaitSE 1153
	SetFlag FLAG_SINNOH_139
	SetVar VAR_SINNOH_40B1, 1
	NPCMsg msg_0934_D03R0101_00002
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_403F, 608
	// TODO Diamond ScrCmd_Unk0161 0x161 args []: no HeartGold mapping yet
	SetObjectMovementType 0, 48
	// TODO Diamond ScrCmd_KeepEvent 0x06c args [0, 1]: no HeartGold mapping yet
	ReleaseAll
	End

_00D8:
	BufferPlayersName 0
	NPCMsg msg_0934_D03R0101_00000
	Return

_00E0:
	BufferPlayersName 0
	NPCMsg msg_0934_D03R0101_00003
	Return

scr_seq_D03R0101_001:
	LockAll
	// TODO Diamond ScrCmd_Unk0162 0x162 args []: no HeartGold mapping yet
	SetObjectMovementType 0, 15
	// TODO Diamond ScrCmd_KeepEvent 0x06c args [0, 0]: no HeartGold mapping yet
	ApplyMovement 0, mv_D03R0101_0190
	WaitMovement
	NPCMsg msg_0934_D03R0101_00004
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 28
	GoToIf 1, _0148
	CompareVarToValue 0x8004, 29
	GoToIf 1, _0158
	End

_0148:
	ApplyMovement 0, mv_D03R0101_0174
	WaitMovement
	GoTo _0168

_0158:
	ApplyMovement 0, mv_D03R0101_0180
	WaitMovement
	GoTo _0168

_0168:
	SetVar VAR_SINNOH_40B1, 0
	ReleaseAll
	End

scr_seq_D03R0101_002:
	LockAll
	ApplyMovement 0, mv_D03R0101_02B0
	ApplyMovement obj_player, mv_D03R0101_031C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0934_D03R0101_00005
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 34
	GoToIf 1, _0203
	CompareVarToValue 0x8005, 35
	GoToIf 1, _021B
	CompareVarToValue 0x8005, 36
	GoToIf 1, _0233
	CompareVarToValue 0x8005, 37
	GoToIf 1, _024B
	CompareVarToValue 0x8005, 38
	GoToIf 1, _0263
	GoTo _027B

_0203:
	ApplyMovement 0, mv_D03R0101_02BC
	ApplyMovement obj_player, mv_D03R0101_0328
	WaitMovement
	GoTo _0293

_021B:
	ApplyMovement 0, mv_D03R0101_02CC
	ApplyMovement obj_player, mv_D03R0101_033C
	WaitMovement
	GoTo _0293

_0233:
	ApplyMovement 0, mv_D03R0101_02DC
	ApplyMovement obj_player, mv_D03R0101_0350
	WaitMovement
	GoTo _0293

_024B:
	ApplyMovement 0, mv_D03R0101_02EC
	ApplyMovement obj_player, mv_D03R0101_0364
	WaitMovement
	GoTo _0293

_0263:
	ApplyMovement 0, mv_D03R0101_02FC
	ApplyMovement obj_player, mv_D03R0101_0378
	WaitMovement
	GoTo _0293

_027B:
	ApplyMovement 0, mv_D03R0101_030C
	ApplyMovement obj_player, mv_D03R0101_038C
	WaitMovement
	GoTo _0293

_0293:
	PlayFanfare 1539
	// TODO Diamond ScrCmd_Unk0162 0x162 args []: no HeartGold mapping yet
	HidePerson 0
	WaitSE 1539
	SetFlag FLAG_SINNOH_227
	SetVar VAR_SINNOH_40B1, 2
	ReleaseAll
	End

scr_seq_D03R0101_003:
	LockAll
	BufferPlayersName 0
	ReleaseAll
	End

scr_seq_D03R0101_004:
	LockAll
	BufferPlayersName 0
	ReleaseAll
	End

scr_seq_D03R0101_005:
	LockAll
	SetVar VAR_SINNOH_40CD, 1
	ReleaseAll
	End

scr_seq_D03R0101_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0934_D03R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D03R0101_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0934_D03R0101_00009
	CloseMsg
	ApplyMovement 24, mv_D03R0101_047C
	WaitMovement
	NPCMsg msg_0934_D03R0101_00010
	FacePlayer
	NPCMsg msg_0934_D03R0101_00011
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _042C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _043E
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0450
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0462
	End

_042C:
	ApplyMovement 24, mv_D03R0101_0490
	WaitMovement
	GoTo _0474

_043E:
	ApplyMovement 24, mv_D03R0101_0484
	WaitMovement
	GoTo _0474

_0450:
	ApplyMovement 24, mv_D03R0101_0484
	WaitMovement
	GoTo _0474

_0462:
	ApplyMovement 24, mv_D03R0101_0484
	WaitMovement
	GoTo _0474

_0474:
	HidePerson 24
	ReleaseAll
	End

scr_seq_D03R0101_008:
	DirectionSignpost msg_0934_D03R0101_00012, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_D03R0101_009:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0934_D03R0101_00013, 0x800C
	CallStd std_signpost
	End

scr_seq_D03R0101_010:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0934_D03R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_D03R0101_00E8:
	.short 75, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_00F4:
	.short 75, 1
	.short 13, 1
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0174:
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0180:
	.short 12, 2
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0190:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02B0:
	.short 35, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02BC:
	.short 13, 2
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02CC:
	.short 13, 1
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02DC:
	.short 13, 1
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02EC:
	.short 12, 1
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_02FC:
	.short 12, 1
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_030C:
	.short 12, 2
	.short 15, 5
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_031C:
	.short 63, 3
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0328:
	.short 63, 2
	.short 33, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_033C:
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0350:
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0364:
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0378:
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_038C:
	.short 63, 2
	.short 32, 1
	.short 63, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_047C:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_D03R0101_0484:
	.short 13, 2
	.short 15, 9
	EndMovement

	.balign 4, 0
mv_D03R0101_0490:
	.short 14, 1
	.short 13, 2
	.short 15, 10
	EndMovement

	.balign 4, 0
