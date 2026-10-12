#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST04R0501.h"
#include "msgdata/msg/msg_1022_ST04R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST04R0501_000
	ScrDef scr_seq_ST04R0501_001
	ScrDefEnd

scr_seq_ST04R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_279
	GoToIf 0, _00FC
	CheckFlag FLAG_SINNOH_1
	CallIf 0, _00F4
	GetPartyLead 0x8004
	GetPartyMonSpecies 0x8004, 0x8005
	CompareVarToValue 0x8005, 201
	GoToIf 1, _004C
	NPCMsg msg_1022_ST04R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_004C:
	// TODO Diamond ScrCmd_GetPokemonForm 0x095 args [32772, 32774]: no HeartGold mapping yet
	CompareVarToVar 0x4000, 0x8006
	GoToIf 1, _00E9
	GoTo _0065

_0065:
	SetVar 0x8007, 50
	AddVar 0x8007, 32774
	// TODO Diamond ScrCmd_GetSealCountFromId 0x093 args [32775, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 99
	GoToIf 1, _00E9
	BufferSpeciesName 0, 0x8004, 0, 0
	NPCMsg msg_1022_ST04R0501_00001
	SetVar 0x8000, 10
	// TODO Diamond ScrCmd_GetSealCountFromId 0x093 args [32775, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 89
	GoToIf 3, _00B1
	SubVar 0x800C, 89
	SubVar 0x8000, 32780

_00B1:
	// TODO Diamond ScrCmd_GiveSeals 0x094 args [32775, 32768]: no HeartGold mapping yet
	CopyVar 0x4000, 0x8006
	SetFlag FLAG_SINNOH_1
	CompareVarToValue 0x8000, 1
	GoToIf 1, _00D9
	// TODO Diamond ScrCmd_GetSealNamePlural 0x2cd args [0, 32775]: no HeartGold mapping yet
	GoTo _00DE

_00D9:
	// TODO Diamond ScrCmd_GetSealName 0x2b3 args [0, 32775]: no HeartGold mapping yet

_00DE:
	NPCMsg msg_1022_ST04R0501_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E9:
	NPCMsg msg_1022_ST04R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F4:
	SetVar 0x4000, 65535
	Return

_00FC:
	NPCMsg msg_1022_ST04R0501_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_279
	GoToIf 1, _013C
	NPCMsg msg_1022_ST04R0501_00005
	SetVar 0x8004, 434
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_279
	NPCMsg msg_1022_ST04R0501_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013C:
	NPCMsg msg_1022_ST04R0501_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
