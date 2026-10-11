#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0101.h"
#include "msgdata/msg/msg_0834_C02R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_C02R0101_000
	ScrDef scr_seq_C02R0101_001
	ScrDef scr_seq_C02R0101_002
	ScrDef scr_seq_C02R0101_003
	ScrDefEnd

scr_seq_C02R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0030
	NPCMsg msg_0834_C02R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0030:
	NPCMsg msg_0834_C02R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0101_001:
	PlayFanfare 1500
	LockAll
	CheckFlag FLAG_SINNOH_168
	GoToIf 1, _0064
	NPCMsg msg_0834_C02R0101_00002
	FacePlayer
	NPCMsg msg_0834_C02R0101_00003
	CloseMsg
	ApplyMovement 1, mv_C02R0101_0074
	WaitMovement
	ReleaseAll
	End

_0064:
	FacePlayer
	NPCMsg msg_0834_C02R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0101_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0834_C02R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_C02R0101_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0834_C02R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

mv_C02R0101_0074:
	.short 0, 1
	EndMovement

	.balign 4, 0
