#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0101.h"
#include "msgdata/msg/msg_0849_SC01R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0101_000
	ScrDef scr_seq_SC01R0101_001
	ScrDef scr_seq_SC01R0101_002
	ScrDef scr_seq_SC01R0101_003
	ScrDefEnd

scr_seq_SC01R0101_003:
	// Diamond ScrCmd_Unk0238 dropped: unknown Diamond variable transform (sub_02042214)
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0038
	CompareVarToValue VAR_SINNOH_4077, 2
	GoToIf 0, _0038
	ClearFlag FLAG_SINNOH_560
	End

_0038:
	SetFlag FLAG_SINNOH_560
	End

scr_seq_SC01R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0849_SC01R0101_00000
	CountBadges 0x8000
	CompareVarToValue 0x8000, 0
	GoToIf 1, _017D
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00C1
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00D8
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00EF
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0106
	HasItem 431, 1, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01B4
	GoTo _01A9

_00C1:
	CountBadges 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 4, _011D
	GoTo _017D

_00D8:
	CountBadges 0x800C
	CompareVarToValue 0x800C, 3
	GoToIf 4, _0135
	GoTo _0188

_00EF:
	CountBadges 0x800C
	CompareVarToValue 0x800C, 5
	GoToIf 4, _014D
	GoTo _0193

_0106:
	CountBadges 0x800C
	CompareVarToValue 0x800C, 7
	GoToIf 4, _0165
	GoTo _019E

_011D:
	NPCMsg msg_0849_SC01R0101_00002
	SetVar 0x8004, 2
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	NPCMsg msg_0849_SC01R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0135:
	NPCMsg msg_0849_SC01R0101_00005
	SetVar 0x8004, 12
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	NPCMsg msg_0849_SC01R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_014D:
	NPCMsg msg_0849_SC01R0101_00008
	SetVar 0x8004, 13
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	NPCMsg msg_0849_SC01R0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0165:
	NPCMsg msg_0849_SC01R0101_00011
	SetVar 0x8004, 15
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	NPCMsg msg_0849_SC01R0101_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_017D:
	NPCMsg msg_0849_SC01R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0188:
	NPCMsg msg_0849_SC01R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0193:
	NPCMsg msg_0849_SC01R0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019E:
	NPCMsg msg_0849_SC01R0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01A9:
	NPCMsg msg_0849_SC01R0101_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01B4:
	NPCMsg msg_0849_SC01R0101_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0849_SC01R0101_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0849_SC01R0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
