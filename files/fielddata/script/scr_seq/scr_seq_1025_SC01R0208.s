#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0208.h"
#include "msgdata/msg/msg_0859_SC01R0208.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0208_000
	ScrDefEnd

scr_seq_SC01R0208_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	CopyVar 0x8008, VAR_SINNOH_40CE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _004E
	CompareVarToValue 0x8008, 1
	GoToIf 1, _005B
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0068
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0075
	End

_004E:
	BufferInt 0, 4
	GoTo _0082

_005B:
	BufferInt 0, 3
	GoTo _0082

_0068:
	BufferInt 0, 2
	GoTo _0082

_0075:
	BufferInt 0, 1
	GoTo _0082

_0082:
	// Diamond ScrCmd_ShowCurrentFloorNumber dropped: elevator floor box (cosmetic)
	NPCMsg msg_0859_SC01R0208_00000
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_0859_SC01R0208_00006, 0, 0
	MenuItemAdd msg_0859_SC01R0208_00007, 1, 1
	MenuItemAdd msg_0859_SC01R0208_00008, 2, 2
	MenuItemAdd msg_0859_SC01R0208_00009, 3, 3
	MenuItemAdd msg_0859_SC01R0208_00010, 4, 4
	MenuExec
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _01DE
	CompareVarToValue 0x8008, 1
	GoToIf 1, _018D
	CompareVarToValue 0x8008, 2
	GoToIf 1, _013C
	CompareVarToValue 0x8008, 3
	GoToIf 1, _00EB
	GoTo _0285

_00EB:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 11, 2, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 3
	GoToIf 1, _026E
	CompareVarToValue VAR_SINNOH_40CE, 3
	CallIf 2, _022F
	CompareVarToValue VAR_SINNOH_40CE, 3
	CallIf 0, _023A
	Call _0245
	SetVar VAR_SINNOH_40CE, 3
	GoTo _0263

_013C:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 12, 3, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 2
	GoToIf 1, _026E
	CompareVarToValue VAR_SINNOH_40CE, 2
	CallIf 2, _022F
	CompareVarToValue VAR_SINNOH_40CE, 2
	CallIf 0, _023A
	Call _0245
	SetVar VAR_SINNOH_40CE, 2
	GoTo _0263

_018D:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 13, 4, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 1
	GoToIf 1, _026E
	CompareVarToValue VAR_SINNOH_40CE, 1
	CallIf 2, _022F
	CompareVarToValue VAR_SINNOH_40CE, 1
	CallIf 0, _023A
	Call _0245
	SetVar VAR_SINNOH_40CE, 1
	GoTo _0263

_01DE:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 14, 1, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 0
	GoToIf 1, _026E
	CompareVarToValue VAR_SINNOH_40CE, 0
	CallIf 2, _022F
	CompareVarToValue VAR_SINNOH_40CE, 0
	CallIf 0, _023A
	Call _0245
	SetVar VAR_SINNOH_40CE, 0
	GoTo _0263

_022F:
	NPCMsg msg_0859_SC01R0208_00002
	SetVar 0x8004, 0
	Return

_023A:
	NPCMsg msg_0859_SC01R0208_00003
	SetVar 0x8004, 1
	Return

_0245:
	SetVar VAR_SINNOH_40CE, 65535
	CloseMsg
	ApplyMovement 0, mv_SC01R0208_029C
	WaitMovement
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim 0x8004, 4
	Return

_0263:
	NPCMsg msg_0859_SC01R0208_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_026E:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	NPCMsg msg_0859_SC01R0208_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0285:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	NPCMsg msg_0859_SC01R0208_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC01R0208_029C:
	.short 33, 1
	EndMovement


	.balign 4, 0
