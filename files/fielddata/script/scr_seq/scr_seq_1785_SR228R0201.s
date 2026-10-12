#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR228R0201.h"
#include "msgdata/msg/msg_1239_SR228R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR228R0201_000
	ScrDef scr_seq_SR228R0201_001
	ScrDefEnd

scr_seq_SR228R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_264
	GoToIf 1, _003B
	SetFlag FLAG_SINNOH_264
	NPCMsg msg_1239_SR228R0201_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0055
	GoTo _028F

_003B:
	NPCMsg msg_1239_SR228R0201_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0055
	GoTo _028F

_0055:
	NPCMsg msg_1239_SR228R0201_00002
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PartySelectUI
	GetPartySelection 0x8000
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x8000, 255
	GoToIf 1, _028F
	GetPartyMonSpecies 0x8000, 0x8001
	CompareVarToValue 0x8001, 0
	GoToIf 1, _02A5
	Call _0195
	CompareVarToValue 0x800C, 0
	GoToIf 1, _029A
	CopyVar 0x8002, 0x800C
	Call _0251
	CompareVarToValue 0x800C, 1
	GoToIf 1, _02BB
	MonGetFriendship 0x800C, 0x8000
	CompareVarToValue 0x800C, 255
	GoToIf 0, _02B0
	BufferSpeciesName 0, 0x8000, 0, 0
	CompareVarToValue 0x8002, 1
	GoToIf 1, _00FE
	CompareVarToValue 0x8002, 2
	GoToIf 1, _011E
	GoTo _013E

_00FE:
	NPCMsg msg_1239_SR228R0201_00009
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _028F
	SetVar 0x8003, 307
	GoTo _015E

_011E:
	NPCMsg msg_1239_SR228R0201_00010
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _028F
	SetVar 0x8003, 308
	GoTo _015E

_013E:
	NPCMsg msg_1239_SR228R0201_00011
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _028F
	SetVar 0x8003, 338
	GoTo _015E

_015E:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	// TODO Diamond ScrCmd_Unk0224 0x224 args [32768, 32771]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0225 0x225 args [32780]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 255
	GoToIf 1, _028F
	ReleaseAll
	End

_0195:
	CompareVarToValue 0x8001, 6
	GoToIf 1, _0239
	CompareVarToValue 0x8001, 157
	GoToIf 1, _0239
	CompareVarToValue 0x8001, 257
	GoToIf 1, _0239
	CompareVarToValue 0x8001, 392
	GoToIf 1, _0239
	CompareVarToValue 0x8001, 9
	GoToIf 1, _0241
	CompareVarToValue 0x8001, 160
	GoToIf 1, _0241
	CompareVarToValue 0x8001, 260
	GoToIf 1, _0241
	CompareVarToValue 0x8001, 395
	GoToIf 1, _0241
	CompareVarToValue 0x8001, 3
	GoToIf 1, _0249
	CompareVarToValue 0x8001, 154
	GoToIf 1, _0249
	CompareVarToValue 0x8001, 254
	GoToIf 1, _0249
	CompareVarToValue 0x8001, 389
	GoToIf 1, _0249
	SetVar 0x800C, 0
	Return

_0239:
	SetVar 0x800C, 1
	Return

_0241:
	SetVar 0x800C, 2
	Return

_0249:
	SetVar 0x800C, 3
	Return

_0251:
	CompareVarToValue 0x8002, 1
	GoToIf 1, _0271
	CompareVarToValue 0x8002, 2
	GoToIf 1, _027B
	GoTo _0285

_0271:
	// TODO Diamond ScrCmd_PartyMonHasMove 0x099 args [32780, 307, 32768]: no HeartGold mapping yet
	Return

_027B:
	// TODO Diamond ScrCmd_PartyMonHasMove 0x099 args [32780, 308, 32768]: no HeartGold mapping yet
	Return

_0285:
	// TODO Diamond ScrCmd_PartyMonHasMove 0x099 args [32780, 338, 32768]: no HeartGold mapping yet
	Return

_028F:
	NPCMsg msg_1239_SR228R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_029A:
	NPCMsg msg_1239_SR228R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02A5:
	NPCMsg msg_1239_SR228R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02B0:
	NPCMsg msg_1239_SR228R0201_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02BB:
	NPCMsg msg_1239_SR228R0201_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR228R0201_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1239_SR228R0201_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
