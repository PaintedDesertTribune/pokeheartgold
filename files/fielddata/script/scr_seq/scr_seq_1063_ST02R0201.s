#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST02R0201.h"
#include "msgdata/msg/msg_0878_ST02R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST02R0201_000
	ScrDef scr_seq_ST02R0201_001
	ScrDefEnd

scr_seq_ST02R0201_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _002F
	NPCMsg msg_0878_ST02R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002F:
	NPCMsg msg_0878_ST02R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02R0201_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _009A
	GoTo _005A

_005A:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _007A
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0086
	End

_007A:
	BufferPlayersName 0
	NPCMsg msg_0878_ST02R0201_00002
	GoTo _0092

_0086:
	BufferPlayersName 0
	NPCMsg msg_0878_ST02R0201_00003
	GoTo _0092

_0092:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009A:
	CheckFlag FLAG_SINNOH_2404
	GoToIf 0, _005A
	CheckFlag FLAG_SINNOH_240
	GoToIf 1, _00C4
	SetFlag FLAG_SINNOH_240
	// TODO Diamond ScrCmd_Unk021B 0x21b args []: no HeartGold mapping yet
	BufferPlayersName 0
	NPCMsg msg_0878_ST02R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C4:
	BufferPlayersName 0
	// TODO Diamond ScrCmd_GetSwarmInfo 0x0e3 args [16385, 16384]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetMapName 0x0e2 args [1, 16385]: no HeartGold mapping yet
	// Diamond ScrCmd_Unk00DA dropped: buffers a message from Diamond's common text bank
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00FA
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0103
	End

_00FA:
	NPCMsg msg_0878_ST02R0201_00005
	GoTo _010F

_0103:
	BufferPlayersName 0
	NPCMsg msg_0878_ST02R0201_00006
	GoTo _010F

_010F:
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
