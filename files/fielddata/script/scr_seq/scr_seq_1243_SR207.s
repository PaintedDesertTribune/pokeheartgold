#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR207.h"
#include "msgdata/msg/msg_0968_SR207.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR207_000
	ScrDef scr_seq_SR207_001
	ScrDef scr_seq_SR207_002
	ScrDef scr_seq_SR207_003
	ScrDef scr_seq_SR207_004
	ScrDef scr_seq_SR207_005
	ScrDef scr_seq_SR207_006
	ScrDefEnd

scr_seq_SR207_000:
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _003E
	CompareVarToValue 0x4000, 1
	GoToIf 1, _0046
	End

_003E:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_0046:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_SR207_001:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 300
	GoToIf 1, _00C0
	CompareVarToValue 0x8004, 301
	GoToIf 1, _00E6
	CompareVarToValue 0x8004, 302
	GoToIf 1, _010C
	CompareVarToValue 0x8004, 303
	GoToIf 1, _0132
	CompareVarToValue 0x8004, 304
	GoToIf 1, _0158
	CompareVarToValue 0x8004, 305
	GoToIf 1, _017E
	CompareVarToValue 0x8004, 306
	GoToIf 1, _01A4
	CompareVarToValue 0x8004, 307
	GoToIf 1, _01CA
	End

_00C0:
	MovePerson 18, 301, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0344
	ApplyMovement obj_player, mv_SR207_0320
	WaitMovement
	GoTo _0202

_00E6:
	MovePerson 18, 302, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0344
	ApplyMovement obj_player, mv_SR207_0320
	WaitMovement
	GoTo _0202

_010C:
	MovePerson 18, 303, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0344
	ApplyMovement obj_player, mv_SR207_0320
	WaitMovement
	GoTo _0202

_0132:
	MovePerson 18, 304, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0344
	ApplyMovement obj_player, mv_SR207_0320
	WaitMovement
	GoTo _0202

_0158:
	MovePerson 18, 305, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0344
	ApplyMovement obj_player, mv_SR207_0320
	WaitMovement
	GoTo _0202

_017E:
	MovePerson 18, 304, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0350
	ApplyMovement obj_player, mv_SR207_032C
	WaitMovement
	GoTo _0202

_01A4:
	MovePerson 18, 305, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0350
	ApplyMovement obj_player, mv_SR207_032C
	WaitMovement
	GoTo _0202

_01CA:
	MovePerson 18, 306, 716
	Call _01F0
	ApplyMovement 18, mv_SR207_0350
	ApplyMovement obj_player, mv_SR207_032C
	WaitMovement
	GoTo _0202

_01F0:
	ClearFlag FLAG_SINNOH_490
	ShowPerson 18
	Lock 18
	CallStd 2040 /* TODO Diamond std script */
	Return

_0202:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0219
	GoTo _0257

_0219:
	BufferPlayersName 0
	NPCMsg msg_0968_SR207_00000
	// TODO Diamond ScrCmd_Unk0044 0x044 args [30, 13, 0, 0, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [137, 255, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [138, 255, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0047 0x047 args []: no HeartGold mapping yet
	NPCMsg msg_0968_SR207_00001
	Call _0295
	NPCMsg msg_0968_SR207_00002
	Call _02AB
	NPCMsg msg_0968_SR207_00003
	GoTo _02BC

_0257:
	BufferPlayersName 0
	NPCMsg msg_0968_SR207_00004
	// TODO Diamond ScrCmd_Unk0044 0x044 args [30, 13, 0, 0, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [137, 255, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [138, 255, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0047 0x047 args []: no HeartGold mapping yet
	NPCMsg msg_0968_SR207_00005
	Call _0295
	NPCMsg msg_0968_SR207_00006
	Call _02AB
	NPCMsg msg_0968_SR207_00007
	GoTo _02BC

_0295:
	SetFlag FLAG_SINNOH_2431
	SetVar 0x8004, 443
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	Return

_02AB:
	SetVar 0x8004, 6
	CallStd 2009 /* TODO Diamond std script */
	// TODO Diamond ScrCmd_GetPoketchAppName 0x0d7 args [1, 6]: no HeartGold mapping yet
	Return

_02BC:
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 300
	GoToIf 1, _02EF
	GoTo _02D7

_02D7:
	ApplyMovement 18, mv_SR207_035C
	ApplyMovement obj_player, mv_SR207_0338
	WaitMovement
	GoTo _0307

_02EF:
	ApplyMovement 18, mv_SR207_0364
	ApplyMovement obj_player, mv_SR207_0338
	WaitMovement
	GoTo _0307

_0307:
	HidePerson 18
	CallStd 2041 /* TODO Diamond std script */
	SetVar VAR_SINNOH_408C, 1
	SetVar VAR_SINNOH_411B, 2
	ReleaseAll
	End

scr_seq_SR207_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0968_SR207_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR207_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_130
	GoToIf 1, _03A5
	NPCMsg msg_0968_SR207_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03A5:
	NPCMsg msg_0968_SR207_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR207_004:
	DirectionSignpost msg_0968_SR207_00011, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR207_005:
	DirectionSignpost msg_0968_SR207_00012, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR207_006:
	SetSignpostMap 3, 0
	SetSignpostAction 3
	WaitSignpostAction
	TrainerTips msg_0968_SR207_00013, 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_SR207_0320:
	.short 63, 8
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR207_032C:
	.short 63, 8
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR207_0338:
	.short 63, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SR207_0344:
	.short 12, 8
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SR207_0350:
	.short 12, 8
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SR207_035C:
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SR207_0364:
	.short 12, 1
	.short 15, 1
	.short 12, 7
	EndMovement

	.balign 4, 0
