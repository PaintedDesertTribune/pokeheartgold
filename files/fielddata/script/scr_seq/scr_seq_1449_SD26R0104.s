#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD26R0104.h"
#include "msgdata/msg/msg_1071_SD26R0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD26R0104_000
	ScrDef scr_seq_SD26R0104_001
	ScrDef scr_seq_SD26R0104_002
	ScrDef scr_seq_SD26R0104_003
	ScrDefEnd

scr_seq_SD26R0104_000:
	LockAll
	ApplyMovement 0, mv_SD26R0104_00E8
	WaitMovement
	NPCMsg msg_1071_SD26R0104_00000
	CloseMsg
	ApplyMovement 0, mv_SD26R0104_00F0
	WaitMovement
	NPCMsg msg_1071_SD26R0104_00001
	CloseMsg
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 8
	GoToIf 1, _0054
	CompareVarToValue 0x8004, 9
	GoToIf 1, _0064
	End

_0054:
	ApplyMovement 0, mv_SD26R0104_00F8
	WaitMovement
	GoTo _0074

_0064:
	ApplyMovement 0, mv_SD26R0104_0100
	WaitMovement
	GoTo _0074

_0074:
	TrainerBattle TRAINER_SINNOH_GALACTIC_BOSS_CYRUS, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E1
	NPCMsg msg_1071_SD26R0104_00002
	SetVar 0x8004, 1
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _00DB
	NPCMsg msg_1071_SD26R0104_00003
	CloseMsg
	ApplyMovement 0, mv_SD26R0104_0110
	WaitMovement
	NPCMsg msg_1071_SD26R0104_00004
	CloseMsg
	ApplyMovement 0, mv_SD26R0104_0124
	WaitMovement
	HidePerson 0
	SetVar VAR_SINNOH_40D6, 1
	ReleaseAll
	End

_00DB:
	CallStd std_obtain_item_verbose
	Return

_00E1:
	WhiteOut
	ReleaseAll
	End

scr_seq_SD26R0104_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	HasItem 440, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0154
	NPCMsg msg_1071_SD26R0104_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0154:
	NPCMsg msg_1071_SD26R0104_00006
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0177
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01AB
	End

_0177:
	BufferPlayersName 0
	NPCMsg msg_1071_SD26R0104_00007
	WaitButton
	WaitSE 1500
	PlayFanfare 1544
	ApplyMovement 1, mv_SD26R0104_01B4
	ApplyMovement 2, mv_SD26R0104_01BC
	WaitMovement
	SetFlag FLAG_SINNOH_580
	HidePerson 1
	HidePerson 2
	CloseMsg
	ReleaseAll
	End

_01AB:
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0104_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1071_SD26R0104_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD26R0104_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1071_SD26R0104_00009
	GoTo _01E6

_01E6:
	NPCMsg msg_1071_SD26R0104_00010
	MenuInit 1, 1, 0, 1, 0x800C
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0240
	CompareVarToValue 0x8008, 1
	GoToIf 1, _024B
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0256
	GoTo _0261

_0240:
	NPCMsg msg_1071_SD26R0104_00011
	GoTo _01E6

_024B:
	NPCMsg msg_1071_SD26R0104_00012
	GoTo _01E6

_0256:
	NPCMsg msg_1071_SD26R0104_00013
	GoTo _01E6

_0261:
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD26R0104_00E8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_00F0:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_00F8:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_0100:
	.short 13, 1
	.short 15, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_0110:
	.short 12, 1
	.short 15, 4
	.short 12, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_0124:
	.short 15, 7
	EndMovement

	.balign 4, 0
mv_SD26R0104_01B4:
	.short 18, 1
	EndMovement

	.balign 4, 0
mv_SD26R0104_01BC:
	.short 19, 1
	EndMovement


	.balign 4, 0
