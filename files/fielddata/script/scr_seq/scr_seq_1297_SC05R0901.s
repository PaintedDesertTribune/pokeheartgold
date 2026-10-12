#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05R0901.h"
#include "msgdata/msg/msg_0995_SC05R0901.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05R0901_000
	ScrDefEnd

scr_seq_SC05R0901_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_305
	GoToIf 1, _012E
	CheckFlag FLAG_SINNOH_2430
	GoToIf 1, _0033
	SetFlag FLAG_SINNOH_2430
	NPCMsg msg_0995_SC05R0901_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0033:
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0050
	NPCMsg msg_0995_SC05R0901_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0050:
	CheckFlag FLAG_SINNOH_306
	GoToIf 1, _0079
	SetFlag FLAG_SINNOH_306
	NPCMsg msg_0995_SC05R0901_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0093
	GoTo _0123

_0079:
	NPCMsg msg_0995_SC05R0901_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0093
	GoTo _0123

_0093:
	GetPartyCount 0x800C
	CompareVarToValue 0x800C, 6
	GoToIf 1, _0118
	NPCMsg msg_0995_SC05R0901_00004
	BufferPlayersName 0
	PlaySE SEQ_ME_ITEM
	NPCMsg msg_0995_SC05R0901_00005
	WaitSE SEQ_ME_ITEM
	GiveMon 133, 5, 0, 0, 0, 0x800C
	SetFlag FLAG_SINNOH_305
	NPCMsg msg_0995_SC05R0901_00006
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E4
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0112
	End

_00E4:
	CloseMsg
	GetPartyCount 0x4000
	SubVar 0x4000, 1
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_NamePokemonScreen 0x0bb args [16384, 32780]: no HeartGold mapping yet
	FadeScreen 6, 1, 1, 0
	WaitFade
	ReleaseAll
	End

_0112:
	CloseMsg
	ReleaseAll
	End

_0118:
	NPCMsg msg_0995_SC05R0901_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0123:
	NPCMsg msg_0995_SC05R0901_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012E:
	NPCMsg msg_0995_SC05R0901_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
