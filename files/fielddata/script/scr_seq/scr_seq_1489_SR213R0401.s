#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR213R0401.h"
#include "msgdata/msg/msg_1091_SR213R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR213R0401_000
	ScrDefEnd

scr_seq_SR213R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1091_SR213R0401_00000
	Random 0x800C, 4
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0044
	CompareVarToValue 0x800C, 1
	GoToIf 1, _004F
	CompareVarToValue 0x800C, 2
	GoToIf 1, _005A
	GoTo _0065

_0044:
	NPCMsg msg_1091_SR213R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_004F:
	NPCMsg msg_1091_SR213R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_005A:
	NPCMsg msg_1091_SR213R0401_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0065:
	NPCMsg msg_1091_SR213R0401_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
