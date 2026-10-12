#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC08R0701.h"
#include "msgdata/msg/msg_1167_SC08R0701.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC08R0701_000
	ScrDefEnd

scr_seq_SC08R0701_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40B5, 1
	GoToIf 4, _002C
	SetVar VAR_SINNOH_40B5, 1
	NPCMsg msg_1167_SC08R0701_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002C:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0125
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00A7
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0089
	GoTo _006B

_006B:
	// TODO Diamond ScrCmd_FindPartyMonWithNature 0x213 args [32768, 12]: no HeartGold mapping yet
	CompareVarToValue 0x8000, 255
	GoToIf 5, _00C5
	NPCMsg msg_1167_SC08R0701_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0089:
	// TODO Diamond ScrCmd_FindPartyMonWithNature 0x213 args [32768, 14]: no HeartGold mapping yet
	CompareVarToValue 0x8000, 255
	GoToIf 5, _00E5
	NPCMsg msg_1167_SC08R0701_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A7:
	// TODO Diamond ScrCmd_FindPartyMonWithNature 0x213 args [32768, 24]: no HeartGold mapping yet
	CompareVarToValue 0x8000, 255
	GoToIf 5, _0105
	NPCMsg msg_1167_SC08R0701_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C5:
	GetPartyMonSpecies 0x8000, 0x8001
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1167_SC08R0701_00004
	SetVar 0x8004, 16
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E5:
	GetPartyMonSpecies 0x8000, 0x8001
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1167_SC08R0701_00005
	SetVar 0x8004, 17
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0105:
	GetPartyMonSpecies 0x8000, 0x8001
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_1167_SC08R0701_00006
	SetVar 0x8004, 18
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0125:
	NPCMsg msg_1167_SC08R0701_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
