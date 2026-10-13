#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0203.h"
#include "msgdata/msg/msg_1062_SC07R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0203_000
	ScrDef scr_seq_SC07R0203_001
	ScrDef scr_seq_SC07R0203_002
	ScrDef scr_seq_SC07R0203_003
	ScrDef scr_seq_SC07R0203_004
	ScrDef scr_seq_SC07R0203_005
	ScrDefEnd

scr_seq_SC07R0203_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	// Diamond ScrCmd_Unk027E dropped: Diamond progress check (sub_0205F710 >= 5) with no HeartGold equivalent
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	NPCMsg msg_1062_SC07R0203_00000
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_1062_SC07R0203_00010, 0, 1
	MenuItemAdd msg_1062_SC07R0203_00011, 1, 0
	MenuExec
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00BE
	GoTo _00B3

_005B:
	BufferPlayersName 0
	NPCMsg msg_1062_SC07R0203_00001
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_1062_SC07R0203_00010, 0, 0
	MenuItemAdd msg_1062_SC07R0203_00011, 1, 1
	MenuExec
	CompareVarToValue 0x800C, 0
	GoToIf 5, _00B3
	// TODO Diamond ScrCmd_DummyRandom 0x1b8 args [32780, 4]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BE
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C9
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00D4
	GoTo _00DF

_00B3:
	NPCMsg msg_1062_SC07R0203_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_1062_SC07R0203_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	NPCMsg msg_1062_SC07R0203_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D4:
	NPCMsg msg_1062_SC07R0203_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	NPCMsg msg_1062_SC07R0203_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1062_SC07R0203_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1062_SC07R0203_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0203_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	SpecialMartBuy 42
	ReleaseAll
	End

scr_seq_SC07R0203_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	SpecialMartBuy 43
	ReleaseAll
	End

scr_seq_SC07R0203_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1062_SC07R0203_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
