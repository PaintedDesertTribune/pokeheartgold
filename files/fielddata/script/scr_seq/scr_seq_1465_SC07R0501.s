#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0501.h"
#include "msgdata/msg/msg_1079_SC07R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0501_000
	ScrDef scr_seq_SC07R0501_001
	ScrDefEnd

scr_seq_SC07R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_188
	GoToIf 1, _00EF
	NPCMsg msg_1079_SC07R0501_00000
	NPCMsg msg_1079_SC07R0501_00001
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 2
	GoToIf 1, _005F
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006F
	CompareVarToValue 0x800C, 3
	GoToIf 1, _007F
	CompareVarToValue 0x800C, 1
	GoToIf 1, _008F
	End

_005F:
	ApplyMovement 0, mv_SC07R0501_0144
	WaitMovement
	GoTo _009F

_006F:
	ApplyMovement 0, mv_SC07R0501_0168
	WaitMovement
	GoTo _009F

_007F:
	ApplyMovement 0, mv_SC07R0501_00FC
	WaitMovement
	GoTo _009F

_008F:
	ApplyMovement 0, mv_SC07R0501_0120
	WaitMovement
	GoTo _009F

_009F:
	NPCMsg msg_1079_SC07R0501_00002
	MenuInit 1, 1, 0, 0, 0x8000
	ScrCmd_066 174, 0
	ScrCmd_066 175, 1
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	Random 0x800C, 2
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E4
	NPCMsg msg_1079_SC07R0501_00004
	SetVar 0x8004, 444
	SetVar 0x8005, 1
	SetFlag FLAG_SINNOH_188
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_00E4:
	NPCMsg msg_1079_SC07R0501_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00EF:
	NPCMsg msg_1079_SC07R0501_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1079_SC07R0501_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC07R0501_00FC:
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	EndMovement

	.balign 4, 0
mv_SC07R0501_0120:
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	EndMovement

	.balign 4, 0
mv_SC07R0501_0144:
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	EndMovement

	.balign 4, 0
mv_SC07R0501_0168:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	EndMovement


	.balign 4, 0
