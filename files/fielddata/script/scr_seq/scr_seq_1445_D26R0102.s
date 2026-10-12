#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D26R0102.h"
#include "msgdata/msg/msg_1069_D26R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D26R0102_000
	ScrDef scr_seq_D26R0102_001
	ScrDef scr_seq_D26R0102_002
	ScrDef scr_seq_D26R0102_003
	ScrDef scr_seq_D26R0102_004
	ScrDef scr_seq_D26R0102_005
	ScrDefEnd

scr_seq_D26R0102_000:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _003A
	GoTo _0070

_003A:
	BufferPlayersName 0
	NPCMsg msg_1069_D26R0102_00001
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE 1166
	WaitSE 1166
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	BufferPlayersName 0
	NPCMsg msg_1069_D26R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0070:
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_002:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_004:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D26R0102_005:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_1069_D26R0102_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
