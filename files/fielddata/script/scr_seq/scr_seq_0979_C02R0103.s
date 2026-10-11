#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0103.h"
#include "msgdata/msg/msg_0836_C02R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0103_000
	ScrDef scr_seq_C02R0103_001
	ScrDef scr_seq_C02R0103_002
	ScrDef scr_seq_C02R0103_003
	ScrDef scr_seq_C02R0103_004
	ScrDef scr_seq_C02R0103_005
	ScrDef scr_seq_C02R0103_006
	ScrDef scr_seq_C02R0103_007
	ScrDef scr_seq_C02R0103_008
	ScrDef scr_seq_C02R0103_009
	ScrDef scr_seq_C02R0103_010
	ScrDef scr_seq_C02R0103_011
	ScrDefEnd

scr_seq_C02R0103_000:
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0052
	CompareVarToValue 0x4000, 1
	GoToIf 1, _005A
	End

_0052:
	SetVar VAR_SINNOH_4020, 97
	End

_005A:
	SetVar VAR_SINNOH_4020, 0
	End

scr_seq_C02R0103_001:
	LockAll
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0836_C02R0103_00000
	CloseMsg
	ApplyMovement 4, mv_C02R0103_02D4
	ApplyMovement obj_player, mv_C02R0103_0298
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	// TODO Diamond ScrCmd_LockCamera 0x066 args [32772, 32773]: no HeartGold mapping yet
	ApplyMovement 241, mv_C02R0103_02B0
	WaitMovement
	Wait 30, 0x800C
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0836_C02R0103_00001
	CloseMsg
	ApplyMovement 4, mv_C02R0103_02C0
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00002
	BufferRivalsName 0
	NPCMsg msg_0836_C02R0103_00003
	CloseMsg
	ApplyMovement 4, mv_C02R0103_02CC
	WaitMovement
	Wait 10, 0x800C
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00004
	CloseMsg
	ApplyMovement 2, mv_C02R0103_0250
	WaitMovement
	NPCMsg msg_0836_C02R0103_00005
	CloseMsg
	ApplyMovement 2, mv_C02R0103_025C
	WaitMovement
	NPCMsg msg_0836_C02R0103_00006
	BufferRivalsName 0
	NPCMsg msg_0836_C02R0103_00007
	NPCMsg msg_0836_C02R0103_00008
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0116
	GoTo _0124

_0116:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00009
	GoTo _0132

_0124:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00010
	GoTo _0132

_0132:
	NPCMsg msg_0836_C02R0103_00011
	CloseMsg
	ApplyMovement 2, mv_C02R0103_0268
	ApplyMovement 3, mv_C02R0103_0334
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0162
	GoTo _0173

_0162:
	NPCMsg msg_0836_C02R0103_00012
	// TODO Diamond ScrCmd_GetFriendName 0x0cf args [0]: no HeartGold mapping yet
	NPCMsg msg_0836_C02R0103_00013
	GoTo _0184

_0173:
	NPCMsg msg_0836_C02R0103_00014
	// TODO Diamond ScrCmd_GetFriendName 0x0cf args [0]: no HeartGold mapping yet
	NPCMsg msg_0836_C02R0103_00015
	GoTo _0184

_0184:
	CloseMsg
	ApplyMovement 2, mv_C02R0103_0270
	ApplyMovement 3, mv_C02R0103_033C
	WaitMovement
	BufferRivalsName 0
	NPCMsg msg_0836_C02R0103_00016
	CloseMsg
	ApplyMovement 4, mv_C02R0103_0308
	WaitMovement
	NPCMsg msg_0836_C02R0103_00017
	CloseMsg
	ApplyMovement 4, mv_C02R0103_0310
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00018
	CloseMsg
	WaitSE 1500
	// TODO Diamond ScrCmd_ShakeCamera 0x29f args [1]: no HeartGold mapping yet
	NPCMsg msg_0836_C02R0103_00019
	CloseMsg
	ApplyMovement 3, mv_C02R0103_0318
	ApplyMovement 4, mv_C02R0103_02F0
	ApplyMovement 2, mv_C02R0103_0278
	ApplyMovement 241, mv_C02R0103_02B8
	WaitMovement
	HidePerson 4
	HidePerson 3
	// TODO Diamond ScrCmd_ReleaseCamera 0x067 args []: no HeartGold mapping yet
	ApplyMovement obj_player, mv_C02R0103_0248
	WaitMovement
	NPCMsg msg_0836_C02R0103_00020
	CloseMsg
	// TODO Diamond ScrCmd_StopFanfare 0x04a args [1500]: no HeartGold mapping yet
	ApplyMovement 2, mv_C02R0103_0290
	WaitMovement
	PlayFanfare 1539
	HidePerson 2
	// TODO Diamond ScrCmd_StopFanfare 0x04a args [1539]: no HeartGold mapping yet
	SetVar VAR_SINNOH_4078, 4
	SetVar VAR_SINNOH_40B2, 2
	SetFlag FLAG_SINNOH_168
	SetFlag FLAG_SINNOH_460
	ClearFlag FLAG_SINNOH_465
	ClearFlag FLAG_SINNOH_467
	ClearFlag FLAG_SINNOH_464
	ReleaseAll
	End

scr_seq_C02R0103_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0362
	NPCMsg msg_0836_C02R0103_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0362:
	NPCMsg msg_0836_C02R0103_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _038B
	NPCMsg msg_0836_C02R0103_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_038B:
	NPCMsg msg_0836_C02R0103_00024
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_004:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00025
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03CD
	CompareVarToValue 0x800C, 1
	GoToIf 1, _03BF
	End

_03BF:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03CD:
	NPCMsg msg_0836_C02R0103_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00028
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _040F
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0401
	End

_0401:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_040F:
	NPCMsg msg_0836_C02R0103_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00031
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0451
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0443
	End

_0443:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0451:
	NPCMsg msg_0836_C02R0103_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_007:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00034
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0493
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0485
	End

_0485:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0493:
	NPCMsg msg_0836_C02R0103_00036
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0485
	NPCMsg msg_0836_C02R0103_00037
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0485
	NPCMsg msg_0836_C02R0103_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_008:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00039
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _04FD
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04EF
	End

_04EF:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04FD:
	NPCMsg msg_0836_C02R0103_00041
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04EF
	NPCMsg msg_0836_C02R0103_00042
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04EF
	NPCMsg msg_0836_C02R0103_00043
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_009:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00044
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0567
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0559
	End

_0559:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0567:
	NPCMsg msg_0836_C02R0103_00046
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_010:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00047
	NPCMsg msg_0836_C02R0103_00048
	MenuInit 1, 1, 0, 1, 0x800C
	// TODO Diamond ScrCmd_Unk029D 0x29d args [259, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk029D 0x29d args [260, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk029D 0x29d args [261, 2]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk029D 0x29d args [262, 3]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0043 0x043 args []: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _05CF
	CompareVarToValue 0x800C, 1
	GoToIf 1, _05DA
	CompareVarToValue 0x800C, 2
	GoToIf 1, _05E5
	GoTo _05F0

_05CF:
	NPCMsg msg_0836_C02R0103_00050
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05DA:
	NPCMsg msg_0836_C02R0103_00051
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05E5:
	NPCMsg msg_0836_C02R0103_00052
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05F0:
	BufferPlayersName 0
	NPCMsg msg_0836_C02R0103_00049
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0103_011:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0836_C02R0103_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

mv_C02R0103_0248:
	.short 32, 1
	EndMovement

mv_C02R0103_0250:
	.short 11, 1
	.short 33, 1
	EndMovement

mv_C02R0103_025C:
	.short 14, 1
	.short 32, 1
	EndMovement

mv_C02R0103_0268:
	.short 34, 1
	EndMovement

mv_C02R0103_0270:
	.short 32, 1
	EndMovement

mv_C02R0103_0278:
	.short 15, 1
	.short 12, 5
	.short 14, 5
	.short 12, 2
	.short 33, 1
	EndMovement

mv_C02R0103_0290:
	.short 35, 1
	EndMovement

mv_C02R0103_0298:
	.short 63, 3
	.short 33, 1
	.short 13, 2
	.short 15, 3
	.short 13, 2
	EndMovement

mv_C02R0103_02B0:
	.short 11, 3
	EndMovement

mv_C02R0103_02B8:
	.short 10, 3
	EndMovement

mv_C02R0103_02C0:
	.short 16, 2
	.short 33, 1
	EndMovement

mv_C02R0103_02CC:
	.short 13, 2
	EndMovement

mv_C02R0103_02D4:
	.short 13, 1
	.short 15, 2
	.short 32, 1
	.short 13, 1
	.short 15, 4
	.short 13, 2
	EndMovement

mv_C02R0103_02F0:
	.short 16, 2
	.short 18, 4
	.short 16, 2
	.short 39, 1
	.short 69, 1
	EndMovement

mv_C02R0103_0308:
	.short 39, 1
	EndMovement

mv_C02R0103_0310:
	.short 33, 1
	EndMovement

mv_C02R0103_0318:
	.short 14, 1
	.short 12, 5
	.short 14, 2
	.short 12, 2
	.short 35, 1
	.short 69, 1
	EndMovement

mv_C02R0103_0334:
	.short 35, 1
	EndMovement

mv_C02R0103_033C:
	.short 32, 1
	EndMovement

	.balign 4, 0
