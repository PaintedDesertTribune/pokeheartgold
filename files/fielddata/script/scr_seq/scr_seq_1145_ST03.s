#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST03.h"
#include "msgdata/msg/msg_0919_ST03.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST03_000
	ScrDef scr_seq_ST03_001
	ScrDef scr_seq_ST03_002
	ScrDef scr_seq_ST03_003
	ScrDef scr_seq_ST03_004
	ScrDef scr_seq_ST03_005
	ScrDef scr_seq_ST03_006
	ScrDef scr_seq_ST03_007
	ScrDef scr_seq_ST03_008
	ScrDef scr_seq_ST03_009
	ScrDef scr_seq_ST03_010
	ScrDefEnd

scr_seq_ST03_000:
	End

scr_seq_ST03_001:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 170
	GoToIf 1, _0061
	CompareVarToValue 0x8004, 171
	GoToIf 1, _0071
	CompareVarToValue 0x8004, 172
	GoToIf 1, _0081
	End

_0061:
	ApplyMovement 3, mv_ST03_0108
	WaitMovement
	GoTo _0091

_0071:
	ApplyMovement 3, mv_ST03_0118
	WaitMovement
	GoTo _0091

_0081:
	ApplyMovement 3, mv_ST03_0120
	WaitMovement
	GoTo _0091

_0091:
	NPCMsg msg_0919_ST03_00000
	NPCMsg msg_0919_ST03_00001
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 170
	GoToIf 1, _00C8
	CompareVarToValue 0x8004, 171
	GoToIf 1, _00D8
	CompareVarToValue 0x8004, 172
	GoToIf 1, _00E8
	End

_00C8:
	ApplyMovement 3, mv_ST03_0130
	WaitMovement
	GoTo _00F8

_00D8:
	ApplyMovement 3, mv_ST03_0138
	WaitMovement
	GoTo _00F8

_00E8:
	ApplyMovement 3, mv_ST03_0140
	WaitMovement
	GoTo _00F8

_00F8:
	HidePerson 3
	SetVar VAR_SINNOH_4072, 1
	ReleaseAll
	End

scr_seq_ST03_002:
	PlayFanfare 1500
	LockAll
	ApplyMovement 7, mv_ST03_0174
	WaitMovement
	NPCMsg msg_0919_ST03_00005
	CloseMsg
	ApplyMovement 8, mv_ST03_017C
	WaitMovement
	NPCMsg msg_0919_ST03_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40CF, 2
	GoToIf 4, _01B1
	NPCMsg msg_0919_ST03_00007
	ApplyMovement 2, mv_ST03_01BC
	WaitMovement
	NPCMsg msg_0919_ST03_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B1:
	NPCMsg msg_0919_ST03_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0919_ST03_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0919_ST03_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0919_ST03_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0919_ST03_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST03_008:
	DirectionSignpost msg_0919_ST03_00014, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST03_009:
	DirectionSignpost msg_0919_ST03_00015, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST03_010:
	DirectionSignpost msg_0919_ST03_00016, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

	.balign 4, 0
mv_ST03_0108:
	.short 13, 2
	.short 14, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST03_0118:
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_ST03_0120:
	.short 13, 2
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST03_0130:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_ST03_0138:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_ST03_0140:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_ST03_0174:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST03_017C:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST03_01BC:
	.short 0, 1
	.short 63, 3
	EndMovement

	.balign 4, 0
