#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC07R0204.h"
#include "msgdata/msg/msg_1063_SC07R0204.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC07R0204_000
	ScrDef scr_seq_SC07R0204_001
	ScrDef scr_seq_SC07R0204_002
	ScrDef scr_seq_SC07R0204_003
	ScrDef scr_seq_SC07R0204_004
	ScrDef scr_seq_SC07R0204_005
	ScrDefEnd

scr_seq_SC07R0204_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	// Diamond ScrCmd_Unk027E dropped: Diamond progress check (sub_0205F710 >= 5) with no HeartGold equivalent
	CompareVarToValue 0x800C, 1
	GoToIf 1, _005B
	NPCMsg msg_1063_SC07R0204_00000
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_1063_SC07R0204_00010, 0, 1
	MenuItemAdd msg_1063_SC07R0204_00011, 1, 0
	MenuExec
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00BE
	GoTo _00B3

_005B:
	BufferPlayersName 0
	NPCMsg msg_1063_SC07R0204_00001
	MenuInit 1, 1, 0, 1, 0x800C
	MenuItemAdd msg_1063_SC07R0204_00010, 0, 0
	MenuItemAdd msg_1063_SC07R0204_00011, 1, 1
	MenuExec
	CompareVarToValue 0x800C, 0
	GoToIf 5, _00B3
	Random 0x800C, 4
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00BE
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00C9
	CompareVarToValue 0x800C, 2
	GoToIf 1, _00D4
	GoTo _00DF

_00B3:
	NPCMsg msg_1063_SC07R0204_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00BE:
	NPCMsg msg_1063_SC07R0204_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C9:
	NPCMsg msg_1063_SC07R0204_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D4:
	NPCMsg msg_1063_SC07R0204_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	NPCMsg msg_1063_SC07R0204_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0204_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1063_SC07R0204_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0204_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1063_SC07R0204_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC07R0204_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	// TODO Diamond ScrCmd_GoodsMart 0x149 args [0]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC07R0204_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	CloseMsg
	// TODO Diamond ScrCmd_GoodsMart 0x149 args [1]: no HeartGold mapping yet
	ReleaseAll
	End

scr_seq_SC07R0204_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1063_SC07R0204_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
