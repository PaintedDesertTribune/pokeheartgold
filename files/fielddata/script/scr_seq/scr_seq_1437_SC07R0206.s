#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0206.h"
#include "msgdata/msg/msg_1065_SC07R0206.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0206_000
	ScrDefEnd

scr_seq_SC07R0206_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	CopyVar 0x8008, VAR_SINNOH_40CE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _005B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0066
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0071
	CompareVarToValue 0x8008, 3
	GoToIf 1, _007C
	CompareVarToValue 0x8008, 4
	GoToIf 1, _0087
	End

_005B:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 5]: no HeartGold mapping yet
	GoTo _0092

_0066:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 4]: no HeartGold mapping yet
	GoTo _0092

_0071:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 3]: no HeartGold mapping yet
	GoTo _0092

_007C:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 2]: no HeartGold mapping yet
	GoTo _0092

_0087:
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 1]: no HeartGold mapping yet
	GoTo _0092

_0092:
	// Diamond ScrCmd_ShowCurrentFloorNumber dropped: elevator floor box (cosmetic)
	NPCMsg msg_1065_SC07R0206_00000
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 120, 0
	ScrCmd_066 119, 1
	ScrCmd_066 118, 2
	ScrCmd_066 117, 3
	ScrCmd_066 116, 4
	ScrCmd_066 124, 5
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0246
	CompareVarToValue 0x8008, 1
	GoToIf 1, _01F7
	CompareVarToValue 0x8008, 2
	GoToIf 1, _01A8
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0159
	CompareVarToValue 0x8008, 4
	GoToIf 1, _010A
	GoTo _0368

_010A:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 137, 2, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 4
	GoToIf 1, _0351
	CompareVarToValue VAR_SINNOH_40CE, 4
	CallIf 2, _0295
	CompareVarToValue VAR_SINNOH_40CE, 4
	CallIf 0, _02A0
	Call _02AB
	SetVar VAR_SINNOH_40CE, 4
	GoTo _02C9

_0159:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 138, 2, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 3
	GoToIf 1, _0351
	CompareVarToValue VAR_SINNOH_40CE, 3
	CallIf 2, _0295
	CompareVarToValue VAR_SINNOH_40CE, 3
	CallIf 0, _02A0
	Call _02AB
	SetVar VAR_SINNOH_40CE, 3
	GoTo _02C9

_01A8:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 139, 2, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 2
	GoToIf 1, _0351
	CompareVarToValue VAR_SINNOH_40CE, 2
	CallIf 2, _0295
	CompareVarToValue VAR_SINNOH_40CE, 2
	CallIf 0, _02A0
	Call _02AB
	SetVar VAR_SINNOH_40CE, 2
	GoTo _02C9

_01F7:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 140, 2, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 1
	GoToIf 1, _0351
	CompareVarToValue VAR_SINNOH_40CE, 1
	CallIf 2, _0295
	CompareVarToValue VAR_SINNOH_40CE, 1
	CallIf 0, _02A0
	Call _02AB
	SetVar VAR_SINNOH_40CE, 1
	GoTo _02C9

_0246:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 141, 1, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 0
	GoToIf 1, _0351
	CompareVarToValue VAR_SINNOH_40CE, 0
	CallIf 2, _0295
	CompareVarToValue VAR_SINNOH_40CE, 0
	CallIf 0, _02A0
	Call _02AB
	SetVar VAR_SINNOH_40CE, 0
	GoTo _02C9

_0295:
	NPCMsg msg_1065_SC07R0206_00002
	SetVar 0x8004, 0
	Return

_02A0:
	NPCMsg msg_1065_SC07R0206_00003
	SetVar 0x8004, 1
	Return

_02AB:
	SetVar VAR_SINNOH_40CE, 65535
	CloseMsg
	ApplyMovement 0, mv_SC07R0206_0380
	WaitMovement
	WaitSE 1500
	ElevatorAnim 0x8004, 4
	Return

_02C9:
	CopyVar 0x8008, VAR_SINNOH_40CE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0312
	CompareVarToValue 0x8008, 1
	GoToIf 1, _031D
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0328
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0333
	CompareVarToValue 0x8008, 4
	GoToIf 1, _033E
	End

_0312:
	NPCMsg msg_1065_SC07R0206_00009
	GoTo _0349

_031D:
	NPCMsg msg_1065_SC07R0206_00008
	GoTo _0349

_0328:
	NPCMsg msg_1065_SC07R0206_00007
	GoTo _0349

_0333:
	NPCMsg msg_1065_SC07R0206_00006
	GoTo _0349

_033E:
	NPCMsg msg_1065_SC07R0206_00005
	GoTo _0349

_0349:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0351:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	NPCMsg msg_1065_SC07R0206_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0368:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	NPCMsg msg_1065_SC07R0206_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC07R0206_0380:
	.short 33, 1
	EndMovement

	.balign 4, 0
