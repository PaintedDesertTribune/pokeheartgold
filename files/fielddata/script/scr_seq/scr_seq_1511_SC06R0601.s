#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0601.h"
#include "msgdata/msg/msg_1102_SC06R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0601_000
	ScrDef scr_seq_SC06R0601_001
	ScrDef scr_seq_SC06R0601_002
	ScrDefEnd

scr_seq_SC06R0601_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x8000
	CheckFlag FLAG_SINNOH_320
	GoToIf 0, _005C
	CheckFlag FLAG_SINNOH_321
	GoToIf 0, _005C
	CheckFlag FLAG_SINNOH_322
	GoToIf 0, _005C
	CheckFlag FLAG_SINNOH_323
	GoToIf 0, _005C
	CheckFlag FLAG_SINNOH_324
	GoToIf 0, _005C
	NPCMsg msg_1102_SC06R0601_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005C:
	NPCMsg msg_1102_SC06R0601_00000
	NPCMsg msg_1102_SC06R0601_00001
	Call _021C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00D7
	Call _024C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0118
	Call _027C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0159
	Call _02AC
	CompareVarToValue 0x800C, 1
	GoToIf 1, _019A
	Call _02DC
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01DB
	NPCMsg msg_1102_SC06R0601_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00CC:
	NPCMsg msg_1102_SC06R0601_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D7:
	SetVar 0x8004, 260
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CC
	BufferSpeciesName 0, 0x8000, 0, 0
	BufferItemName 1, 260
	NPCMsg msg_1102_SC06R0601_00004
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_320
	NPCMsg msg_1102_SC06R0601_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0118:
	SetVar 0x8004, 261
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CC
	BufferSpeciesName 0, 0x8000, 0, 0
	BufferItemName 1, 261
	NPCMsg msg_1102_SC06R0601_00004
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_321
	NPCMsg msg_1102_SC06R0601_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0159:
	SetVar 0x8004, 262
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CC
	BufferSpeciesName 0, 0x8000, 0, 0
	BufferItemName 1, 262
	NPCMsg msg_1102_SC06R0601_00004
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_322
	NPCMsg msg_1102_SC06R0601_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_019A:
	SetVar 0x8004, 263
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CC
	BufferSpeciesName 0, 0x8000, 0, 0
	BufferItemName 1, 263
	NPCMsg msg_1102_SC06R0601_00004
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_323
	NPCMsg msg_1102_SC06R0601_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01DB:
	SetVar 0x8004, 264
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00CC
	BufferSpeciesName 0, 0x8000, 0, 0
	BufferItemName 1, 264
	NPCMsg msg_1102_SC06R0601_00004
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_324
	NPCMsg msg_1102_SC06R0601_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_021C:
	CheckFlag FLAG_SINNOH_320
	GoToIf 1, _0244
	// TODO Diamond ScrCmd_GetPartyMonContestCondition 0x281 args [32768, 0, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 0, _0244
	SetVar 0x800C, 1
	Return

_0244:
	SetVar 0x800C, 0
	Return

_024C:
	CheckFlag FLAG_SINNOH_321
	GoToIf 1, _0274
	// TODO Diamond ScrCmd_GetPartyMonContestCondition 0x281 args [32768, 1, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 0, _0274
	SetVar 0x800C, 1
	Return

_0274:
	SetVar 0x800C, 0
	Return

_027C:
	CheckFlag FLAG_SINNOH_322
	GoToIf 1, _02A4
	// TODO Diamond ScrCmd_GetPartyMonContestCondition 0x281 args [32768, 2, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 0, _02A4
	SetVar 0x800C, 1
	Return

_02A4:
	SetVar 0x800C, 0
	Return

_02AC:
	CheckFlag FLAG_SINNOH_323
	GoToIf 1, _02D4
	// TODO Diamond ScrCmd_GetPartyMonContestCondition 0x281 args [32768, 3, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 0, _02D4
	SetVar 0x800C, 1
	Return

_02D4:
	SetVar 0x800C, 0
	Return

_02DC:
	CheckFlag FLAG_SINNOH_324
	GoToIf 1, _0304
	// TODO Diamond ScrCmd_GetPartyMonContestCondition 0x281 args [32768, 4, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 0, _0304
	SetVar 0x800C, 1
	Return

_0304:
	SetVar 0x800C, 0
	Return

scr_seq_SC06R0601_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1102_SC06R0601_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC06R0601_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_1102_SC06R0601_00012
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
