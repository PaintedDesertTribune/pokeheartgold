#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR210A.h"
#include "msgdata/msg/msg_1042_SR210A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR210A_000
	ScrDef scr_seq_SR210A_001
	ScrDef scr_seq_SR210A_002
	ScrDef scr_seq_SR210A_003
	ScrDef scr_seq_SR210A_004
	ScrDef scr_seq_SR210A_005
	ScrDef scr_seq_SR210A_006
	ScrDefEnd

scr_seq_SR210A_006:
	SetVar 0x4000, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0065
	CompareVarToValue 0x4000, 1
	GoToIf 1, _006F
	CompareVarToValue 0x4000, 2
	GoToIf 1, _006F
	CompareVarToValue 0x4000, 3
	GoToIf 1, _006F
	CompareVarToValue 0x4000, 4
	GoToIf 1, _006F
	End

_0065:
	ClearFlag FLAG_SINNOH_655
	SetFlag FLAG_SINNOH_654
	End

_006F:
	ClearFlag FLAG_SINNOH_654
	SetFlag FLAG_SINNOH_655
	End

scr_seq_SR210A_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 464, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A1
	NPCMsg msg_1042_SR210A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A1:
	NPCMsg msg_1042_SR210A_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CA
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C4
	End

_00C4:
	CloseMsg
	ReleaseAll
	End

_00CA:
	BufferPlayersName 0
	BufferItemName 1, 464
	NPCMsg msg_1042_SR210A_00002
	CloseMsg
	PlayCry 54, 0
	WaitCry
	ApplyMovement 27, mv_SR210A_024C
	ApplyMovement 28, mv_SR210A_024C
	ApplyMovement 26, mv_SR210A_024C
	ApplyMovement 19, mv_SR210A_024C
	WaitMovement
	ApplyMovement 27, mv_SR210A_0258
	ApplyMovement 28, mv_SR210A_026C
	ApplyMovement 26, mv_SR210A_0280
	ApplyMovement 19, mv_SR210A_02B4
	WaitMovement
	HidePerson 27
	HidePerson 28
	HidePerson 26
	HidePerson 19
	Wait 45, 0x800C
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 560
	GoToIf 1, _015B
	CompareVarToValue 0x8004, 561
	GoToIf 1, _016F
	End

_015B:
	MovePerson 20, 560, 596
	SetObjectMovementType 20, 14
	GoTo _0183

_016F:
	MovePerson 20, 561, 596
	SetObjectMovementType 20, 14
	GoTo _0183

_0183:
	ClearFlag FLAG_SINNOH_463
	ShowPerson 20
	Lock 20
	ApplyMovement 20, mv_SR210A_02C4
	WaitMovement
	ApplyMovement obj_player, mv_SR210A_02DC
	WaitMovement
	NPCMsg msg_1042_SR210A_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01E9
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01C6
	End

_01C6:
	NPCMsg msg_1042_SR210A_00005
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01E9
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01C6
	End

_01E9:
	SetVar 0x8004, 439
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	NPCMsg msg_1042_SR210A_00004
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 560
	GoToIf 1, _0220
	CompareVarToValue 0x8004, 561
	GoToIf 1, _0230
	End

_0220:
	ApplyMovement 20, mv_SR210A_02CC
	WaitMovement
	GoTo _0240

_0230:
	ApplyMovement 20, mv_SR210A_02D4
	WaitMovement
	GoTo _0240

_0240:
	HidePerson 20
	SetFlag FLAG_SINNOH_263
	ReleaseAll
	End

scr_seq_SR210A_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1042_SR210A_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR210A_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_199
	GoToIf 1, _0364
	NPCMsg msg_1042_SR210A_00007
	SetVar 0x8004, 378
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _036F
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_199
	GoTo _0364

_0364:
	NPCMsg msg_1042_SR210A_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_036F:
	CallStd 2017 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

scr_seq_SR210A_003:
	DirectionSignpost msg_1042_SR210A_00010, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR210A_004:
	DirectionSignpost msg_1042_SR210A_00011, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR210A_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1042_SR210A_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SR210A_024C:
	.short 75, 1
	.short 63, 4
	EndMovement

	.balign 4, 0
mv_SR210A_0258:
	.short 12, 1
	.short 33, 1
	.short 63, 8
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SR210A_026C:
	.short 12, 2
	.short 33, 2
	.short 63, 6
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SR210A_0280:
	.short 35, 1
	.short 34, 1
	.short 35, 1
	.short 63, 2
	.short 32, 1
	.short 16, 2
	.short 63, 2
	.short 14, 3
	.short 35, 1
	.short 75, 1
	.short 19, 3
	.short 16, 8
	EndMovement

	.balign 4, 0
mv_SR210A_02B4:
	.short 12, 2
	.short 63, 8
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SR210A_02C4:
	.short 12, 7
	EndMovement

	.balign 4, 0
mv_SR210A_02CC:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SR210A_02D4:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SR210A_02DC:
	.short 33, 1
	EndMovement

	.balign 4, 0
