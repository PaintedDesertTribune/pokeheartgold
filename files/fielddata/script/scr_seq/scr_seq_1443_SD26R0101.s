#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0101.h"
#include "msgdata/msg/msg_1068_SD26R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0101_000
	ScrDef scr_seq_SD26R0101_001
	ScrDef scr_seq_SD26R0101_002
	ScrDef scr_seq_SD26R0101_003
	ScrDef scr_seq_SD26R0101_004
	ScrDef scr_seq_SD26R0101_005
	ScrDef scr_seq_SD26R0101_006
	ScrDef scr_seq_SD26R0101_007
	ScrDef scr_seq_SD26R0101_008
	ScrDefEnd

scr_seq_SD26R0101_000:
	SetFlag FLAG_SINNOH_2525
	End

scr_seq_SD26R0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0046
	NPCMsg msg_1068_SD26R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0046:
	NPCMsg msg_1068_SD26R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _006F
	NPCMsg msg_1068_SD26R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006F:
	NPCMsg msg_1068_SD26R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _0098
	NPCMsg msg_1068_SD26R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0098:
	NPCMsg msg_1068_SD26R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_350
	GoToIf 1, _00C1
	NPCMsg msg_1068_SD26R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C1:
	NPCMsg msg_1068_SD26R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1068_SD26R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 440, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0107
	NPCMsg msg_1068_SD26R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0107:
	NPCMsg msg_1068_SD26R0101_00010
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _012A
	CompareVarToValue 0x800C, 1
	GoToIf 1, _015E
	End

_012A:
	BufferPlayersName 0
	NPCMsg msg_1068_SD26R0101_00011
	WaitButton
	WaitSE 1500
	PlayFanfare 1544
	ApplyMovement 5, mv_SD26R0101_0164
	ApplyMovement 6, mv_SD26R0101_016C
	WaitMovement
	SetFlag FLAG_SINNOH_578
	HidePerson 5
	HidePerson 6
	CloseMsg
	ReleaseAll
	End

_015E:
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0101_006:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1068_SD26R0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD26R0101_0164:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_SD26R0101_016C:
	.short 19, 1
	EndMovement

scr_seq_SD26R0101_008:
	SetVar VAR_SPECIAL_x8008, 376
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
