#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC06R0401.h"
#include "msgdata/msg/msg_1100_SC06R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC06R0401_000
	ScrDefEnd

scr_seq_SC06R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_GetItemNameWithIndefArticle 0x2c4 args [4, 93]: no HeartGold mapping yet
	CheckFlag FLAG_SINNOH_233
	GoToIf 0, _0039
	HasItem 93, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005B
	GoTo _0066

_0039:
	SetFlag FLAG_SINNOH_233
	NPCMsg msg_1100_SC06R0401_00000
	HasItem 93, 1, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005B
	GoTo _0066

_005B:
	NPCMsg msg_1100_SC06R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0066:
	NPCMsg msg_1100_SC06R0401_00001
	NPCMsg msg_1100_SC06R0401_00003
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8005
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8005, 255
	GoToIf 1, _005B
	GetPartyMonSpecies 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0116
	// TODO Diamond ScrCmd_Unk021F 0x21f args [32780, 32773]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _010B
	NPCMsg msg_1100_SC06R0401_00004
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0221 0x221 args [32773]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0223 0x223 args [32780]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _005B
	TakeItem 93, 1, 0x800C
	BufferPlayersName 3
	NPCMsg msg_1100_SC06R0401_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010B:
	NPCMsg msg_1100_SC06R0401_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0116:
	NPCMsg msg_1100_SC06R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
