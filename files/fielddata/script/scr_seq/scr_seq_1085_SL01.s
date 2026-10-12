#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SL01.h"
#include "msgdata/msg/msg_0889_SL01.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SL01_000
	ScrDef scr_seq_SL01_001
	ScrDef scr_seq_SL01_002
	ScrDef scr_seq_SL01_003
	ScrDef scr_seq_SL01_004
	ScrDef scr_seq_SL01_005
	ScrDefEnd

scr_seq_SL01_000:
	CheckFlag FLAG_SINNOH_318
	GoToIf 0, _0032
	CheckFlag FLAG_SINNOH_318
	GoToIf 1, _0044
	End

_0032:
	MoveWarp 2, 80, 840
	MoveWarp 3, 81, 840
	End

_0044:
	MoveWarp 1, 80, 840
	MoveWarp 0, 81, 840
	End

scr_seq_SL01_001:
	CheckFlag FLAG_SINNOH_318
	GoToIf 0, _0032
	CheckFlag FLAG_SINNOH_318
	GoToIf 1, _0044
	End

scr_seq_SL01_002:
	LockAll
	ApplyMovement 242, mv_SL01_0124
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0889_SL01_00000
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 80
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 81
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 82
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 83
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 84
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 85
	GoToIf 1, _00D8
	End

_00D8:
	ApplyMovement obj_player, mv_SL01_0138
	ApplyMovement 242, mv_SL01_012C
	WaitMovement
	GoTo _00F0

_00F0:
	SetVar VAR_SINNOH_4082, 1
	ReleaseAll
	PlayFanfare SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, 0
	WaitFade
	Warp MAP_SINNOH_LAKE_VERITY, 0, 46, 54, 0
	FadeScreen 6, 1, 1, 0
	WaitFade
	End

scr_seq_SL01_003:
	LockAll
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	SetObjectMovementType 254, 15
	ApplyMovement 254, mv_SL01_01DC
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0889_SL01_00002
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 80
	GoToIf 1, _01B6
	CompareVarToValue 0x8004, 81
	GoToIf 1, _01B6
	CompareVarToValue 0x8004, 82
	GoToIf 1, _01B6
	CompareVarToValue 0x8004, 83
	GoToIf 1, _01B6
	CompareVarToValue 0x8004, 84
	GoToIf 1, _01B6
	CompareVarToValue 0x8004, 85
	GoToIf 1, _01B6
	End

_01B6:
	ApplyMovement obj_player, mv_SL01_01EC
	ApplyMovement 254, mv_SL01_01E4
	WaitMovement
	GoTo _01CE

_01CE:
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 254, 48
	ReleaseAll
	End

scr_seq_SL01_004:
	LockAll
	ApplyMovement obj_player, mv_SL01_0254
	ApplyMovement 0, mv_SL01_0234
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0889_SL01_00001
	CloseMsg
	ApplyMovement 0, mv_SL01_0248
	WaitMovement
	// Diamond ScrCmd_Unk0161 dropped: Diamond partner-trainer set; HeartGold's following system differs
	SetObjectMovementType 0, 48
	// Diamond ScrCmd_KeepEvent dropped: Diamond's keep-object-across-load flag; HeartGold objects persist by map data
	// TODO Diamond ScrCmd_EventStopFollowing 0x06e args []: no HeartGold mapping yet
	SetVar VAR_SINNOH_4082, 3
	ReleaseAll
	ReleaseAll
	End

scr_seq_SL01_005:
	DirectionSignpost msg_0889_SL01_00003, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SL01_0124:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL01_012C:
	.short 12, 2
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SL01_0138:
	.short 12, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_SL01_01DC:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL01_01E4:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SL01_01EC:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SL01_0234:
	.short 13, 1
	.short 13, 1
	.short 13, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SL01_0248:
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SL01_0254:
	.short 13, 1
	.short 13, 1
	.short 13, 1
	EndMovement


	.balign 4, 0
