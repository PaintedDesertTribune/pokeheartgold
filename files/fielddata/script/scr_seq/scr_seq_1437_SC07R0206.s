#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0206.h"
#include "msgdata/msg/msg_1065_SC07R0206.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0206_000
	ScrDefEnd

scr_seq_SC07R0206_000:
	PlayFanfare SEQ_SE_DP_SELECT
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
	BufferInt 0, 5
	GoTo _0092

_0066:
	BufferInt 0, 4
	GoTo _0092

_0071:
	BufferInt 0, 3
	GoTo _0092

_007C:
	BufferInt 0, 2
	GoTo _0092

_0087:
	BufferInt 0, 1
	GoTo _0092

_0092:
	// Diamond ScrCmd_ShowCurrentFloorNumber dropped: elevator floor box (cosmetic)
	NPCMsg msg_1065_SC07R0206_00000
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_1065_SC07R0206_00010, 0, 0
	MenuItemAdd msg_1065_SC07R0206_00011, 1, 1
	MenuItemAdd msg_1065_SC07R0206_00012, 2, 2
	MenuItemAdd msg_1065_SC07R0206_00013, 3, 3
	MenuItemAdd msg_1065_SC07R0206_00014, 4, 4
	MenuItemAdd msg_1065_SC07R0206_00015, 5, 5
	MenuExec
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
	WaitSE SEQ_SE_DP_SELECT
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
