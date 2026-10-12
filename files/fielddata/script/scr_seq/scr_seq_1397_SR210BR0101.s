#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR210BR0101.h"
#include "msgdata/msg/msg_1045_SR210BR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR210BR0101_000
	ScrDef scr_seq_SR210BR0101_001
	ScrDefEnd

scr_seq_SR210BR0101_000:
	SetFlag FLAG_SINNOH_2538
	End

scr_seq_SR210BR0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_256
	GoToIf 1, _0041
	SetFlag FLAG_SINNOH_256
	NPCMsg msg_1045_SR210BR0101_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	GoTo _00A2

_0041:
	NPCMsg msg_1045_SR210BR0101_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	GoTo _00A2

_005B:
	NPCMsg msg_1045_SR210BR0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0066:
	NPCMsg msg_1045_SR210BR0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0071:
	NPCMsg msg_1045_SR210BR0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_007C:
	NPCMsg msg_1045_SR210BR0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0087:
	// TODO Diamond ScrCmd_GetMoveName 0x0d4 args [0, 434]: no HeartGold mapping yet
	NPCMsg msg_1045_SR210BR0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0097:
	NPCMsg msg_1045_SR210BR0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A2:
	GetPartyCount 0x4000

_00A6:
	SubVar 0x4000, 1
	GetPartyMonSpecies 0x4000, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00FC
	// TODO Diamond ScrCmd_GetPartyMonTypes 0x248 args [32772, 32773, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x8004, 16
	GoToIf 1, _00E7
	CompareVarToValue 0x8005, 16
	GoToIf 1, _00E7
	GoTo _00FC

_00E7:
	// TODO Diamond ScrCmd_PartyMonHasMove 0x099 args [32780, 434, 16384]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _010F

_00FC:
	CompareVarToValue 0x4000, 0
	GoToIf 5, _00A6
	GoTo _0066

_010F:
	NPCMsg msg_1045_SR210BR0101_00004
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8000, 255
	GoToIf 1, _005B
	GetPartyMonSpecies 0x8000, 0x8001
	CompareVarToValue 0x8001, 0
	GoToIf 1, _007C
	Call _01D9
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0071
	// TODO Diamond ScrCmd_PartyMonHasMove 0x099 args [32780, 434, 32768]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0087
	MonGetFriendship 0x800C, 0x8000
	CompareVarToValue 0x800C, 255
	GoToIf 0, _0097
	SetVar 0x8003, 434
	GoTo _019D

_019D:
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0224 0x224 args [32768, 434]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0225 0x225 args [32780]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _005B
	NPCMsg msg_1045_SR210BR0101_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01D9:
	// TODO Diamond ScrCmd_GetPartyMonTypes 0x248 args [32772, 32773, 32768]: no HeartGold mapping yet
	CompareVarToValue 0x8004, 16
	GoToIf 1, _0203
	CompareVarToValue 0x8005, 16
	GoToIf 1, _0203
	SetVar 0x800C, 0
	Return

_0203:
	SetVar 0x800C, 1
	Return



	.balign 4, 0
