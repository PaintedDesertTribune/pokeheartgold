#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0103.h"
#include "msgdata/msg/msg_1250_ST07R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST07R0103_000
	ScrDefEnd

scr_seq_ST07R0103_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	CopyVar 0x8008, VAR_SINNOH_40CE
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0034
	CompareVarToValue 0x8008, 1
	GoToIf 1, _003F
	End

_0034:
	BufferInt 0, 2
	GoTo _004A

_003F:
	BufferInt 0, 1
	GoTo _004A

_004A:
	// Diamond ScrCmd_ShowCurrentFloorNumber dropped: elevator floor box (cosmetic)
	NPCMsg msg_1250_ST07R0103_00000
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 117, 0
	ScrCmd_066 116, 1
	ScrCmd_066 124, 2
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _008F
	CompareVarToValue 0x8008, 1
	GoToIf 1, _00CA
	GoTo _0152

_008F:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 462, 0, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 0
	GoToIf 1, _0164
	SetVar 0x8004, 0
	Call _0105
	SetVar VAR_SINNOH_40CE, 0
	GoTo _0147

_00CA:
	Wait 1, 0x800C
	GetDynamicWarpFloorNo VAR_SINNOH_40CE
	SetDynamicWarp 461, 1, 18, 2, 1
	CompareVarToValue VAR_SINNOH_40CE, 1
	GoToIf 1, _0164
	SetVar 0x8004, 1
	Call _0105
	SetVar VAR_SINNOH_40CE, 1
	GoTo _0147

_0105:
	SetVar VAR_SINNOH_40CE, 65535
	CompareVarToValue 0x8004, 1
	CallIf 1, _013D
	CompareVarToValue 0x8004, 0
	CallIf 1, _0142
	CloseMsg
	ApplyMovement 0, mv_ST07R0103_017C
	WaitMovement
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim 0x8004, 4
	Return

_013D:
	NPCMsg msg_1250_ST07R0103_00002
	Return

_0142:
	NPCMsg msg_1250_ST07R0103_00001
	Return

_0147:
	NPCMsg msg_1250_ST07R0103_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0152:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	CloseMsg
	ReleaseAll
	End

_0164:
	SetVar VAR_SINNOH_40CE, 65535
	Wait 1, 0x800C
	NPCMsg msg_1250_ST07R0103_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST07R0103_017C:
	.short 33, 1
	EndMovement


	.balign 4, 0
