#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST05.h"
#include "msgdata/msg/msg_1046_ST05.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST05_000
	ScrDef scr_seq_ST05_001
	ScrDef scr_seq_ST05_002
	ScrDef scr_seq_ST05_003
	ScrDef scr_seq_ST05_004
	ScrDef scr_seq_ST05_005
	ScrDef scr_seq_ST05_006
	ScrDef scr_seq_ST05_007
	ScrDef scr_seq_ST05_008
	ScrDef scr_seq_ST05_009
	ScrDef scr_seq_ST05_010
	ScrDefEnd

scr_seq_ST05_000:
	SetFlag FLAG_SINNOH_2432
	End

scr_seq_ST05_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1046_ST05_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006A
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005F
	End

_005F:
	NPCMsg msg_1046_ST05_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006A:
	NPCMsg msg_1046_ST05_00002
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GALACTIC_GRUNT_11, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _018D
	NPCMsg msg_1046_ST05_00004
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00B8
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00E8
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0110
	End

_00B8:
	ApplyMovement 2, mv_ST05_0194
	ApplyMovement obj_player, mv_ST05_01DC
	WaitMovement
	Call _0138
	ApplyMovement 3, mv_ST05_01B0
	ApplyMovement obj_player, mv_ST05_0200
	WaitMovement
	GoTo _0162

_00E8:
	ApplyMovement 2, mv_ST05_0194
	ApplyMovement obj_player, mv_ST05_01EC
	WaitMovement
	Call _0138
	ApplyMovement 3, mv_ST05_01BC
	WaitMovement
	GoTo _0162

_0110:
	ApplyMovement 2, mv_ST05_01A0
	ApplyMovement obj_player, mv_ST05_01F8
	WaitMovement
	Call _0138
	ApplyMovement 3, mv_ST05_01CC
	WaitMovement
	GoTo _0162

_0138:
	HidePerson 2
	HidePerson 3
	MovePerson 3, 466, 531
	SetObjectFacing 3, 0
	SetObjectMovementType 3, 14
	ClearFlag FLAG_SINNOH_458
	ShowPerson 3
	Lock 3
	Return

_0162:
	NPCMsg msg_1046_ST05_00005
	BufferPlayersName 0
	BufferItemName 1, 439
	PlaySE 1158
	NPCMsg msg_1046_ST05_00006
	WaitSE 1158
	TakeItem 439, 1, 0x800C
	SetFlag FLAG_SINNOH_166
	NPCMsg msg_1046_ST05_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_018D:
	WhiteOut
	ReleaseAll
	End

scr_seq_ST05_002:
	LockAll
	ApplyMovement obj_player, mv_ST05_025C
	ApplyMovement 3, mv_ST05_0254
	WaitMovement
	Call _0242
	ReleaseAll
	End

_0242:
	SetVar VAR_SINNOH_40F1, 1
	NPCMsg msg_1046_ST05_00000
	WaitButton
	CloseMsg
	Return

scr_seq_ST05_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_166
	GoToIf 1, _0281
	Call _0242
	ReleaseAll
	End

_0281:
	NPCMsg msg_1046_ST05_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05_004:
	LockAll
	ApplyMovement obj_player, mv_ST05_02D8
	WaitMovement
	Wait 15, 0x800C
	NPCMsg msg_1046_ST05_00009
	CloseMsg
	ApplyMovement 4, mv_ST05_02EC
	WaitMovement
	NPCMsg msg_1046_ST05_00010
	CloseMsg
	ApplyMovement 4, mv_ST05_02F4
	ApplyMovement obj_player, mv_ST05_02E0
	WaitMovement
	HidePerson 4
	SetFlag FLAG_SINNOH_165
	SetVar VAR_SINNOH_4074, 2
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST05_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1046_ST05_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1046_ST05_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1046_ST05_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05_008:
	DirectionSignpost msg_1046_ST05_00014, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST05_009:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1046_ST05_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05_010:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1046_ST05_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST05_0194:
	.short 18, 3
	.short 17, 9
	EndMovement

	.balign 4, 0
mv_ST05_01A0:
	.short 17, 2
	.short 18, 3
	.short 17, 7
	EndMovement

	.balign 4, 0
mv_ST05_01B0:
	.short 12, 8
	.short 14, 2
	EndMovement

	.balign 4, 0
mv_ST05_01BC:
	.short 12, 8
	.short 14, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST05_01CC:
	.short 12, 8
	.short 14, 4
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST05_01DC:
	.short 34, 1
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST05_01EC:
	.short 63, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST05_01F8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST05_0200:
	.short 63, 8
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST05_0254:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST05_025C:
	.short 2, 1
	EndMovement

	.balign 4, 0
mv_ST05_02D8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST05_02E0:
	.short 63, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST05_02EC:
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_ST05_02F4:
	.short 14, 2
	.short 13, 9
	EndMovement


	.balign 4, 0
