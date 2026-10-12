#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC09R0201.h"
#include "msgdata/msg/msg_1145_SC09R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC09R0201_000
	ScrDefEnd

scr_seq_SC09R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_2733
	GoToIf 1, _0060
	// TODO Diamond ScrCmd_Unk027F 0x27f args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0076
	NPCMsg msg_1145_SC09R0201_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _006B
	// TODO Diamond ScrCmd_BufferRandomTrendySaying 0x27d args [32780, 0]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 65535
	GoToIf 1, _0076
	SetFlag FLAG_SINNOH_2733
	NPCMsg msg_1145_SC09R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0060:
	NPCMsg msg_1145_SC09R0201_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006B:
	NPCMsg msg_1145_SC09R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0076:
	NPCMsg msg_1145_SC09R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
