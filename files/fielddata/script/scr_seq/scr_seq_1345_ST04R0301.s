#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST04R0301.h"
#include "msgdata/msg/msg_1019_ST04R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST04R0301_000
	ScrDef scr_seq_ST04R0301_001
	ScrDef scr_seq_ST04R0301_002
	ScrDefEnd

scr_seq_ST04R0301_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_220
	GoToIf 1, _0206
	CheckFlag FLAG_SINNOH_2737
	GoToIf 1, _028F
	CheckFlag FLAG_SINNOH_216
	GoToIf 0, _004A
	CompareVarToValue VAR_SINNOH_40E5, 0
	GoToIf 1, _0057
	GoTo _0081

_004A:
	SetFlag FLAG_SINNOH_216
	NPCMsg msg_1019_ST04R0301_00000
	GoTo _0060

_0057:
	NPCMsg msg_1019_ST04R0301_00001
	GoTo _0060

_0060:
	// TODO Diamond ScrCmd_Unk0218 0x218 args [32780]: no HeartGold mapping yet
	CopyVar VAR_SINNOH_40E5, 0x800C
	// TODO Diamond ScrCmd_Unk0219 0x219 args [1]: no HeartGold mapping yet
	// Diamond ScrCmd_Unk00DA dropped: buffers a message from Diamond's common text bank
	NPCMsg msg_1019_ST04R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0081:
	NPCMsg msg_1019_ST04R0301_00003
	// TODO Diamond ScrCmd_Unk021A 0x21a args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _027E
	PlayerHasSpecies 0x800C, VAR_SINNOH_40E5
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0262
	GoTo _00AE

_00AE:
	// Diamond ScrCmd_Unk00DA dropped: buffers a message from Diamond's common text bank
	NPCMsg msg_1019_ST04R0301_00004
	Random 0x800C, 12
	CompareVarToValue 0x800C, 0
	CallIf 1, _0189
	CompareVarToValue 0x800C, 1
	CallIf 1, _0191
	CompareVarToValue 0x800C, 2
	CallIf 1, _0199
	CompareVarToValue 0x800C, 3
	CallIf 1, _01A1
	CompareVarToValue 0x800C, 4
	CallIf 1, _01A9
	CompareVarToValue 0x800C, 5
	CallIf 1, _01B1
	CompareVarToValue 0x800C, 6
	CallIf 1, _01B9
	CompareVarToValue 0x800C, 7
	CallIf 1, _01C1
	CompareVarToValue 0x800C, 8
	CallIf 1, _01C9
	CompareVarToValue 0x800C, 9
	CallIf 1, _01D1
	CompareVarToValue 0x800C, 10
	CallIf 1, _01D9
	CompareVarToValue 0x800C, 11
	CallIf 1, _01E1
	SetVar 0x8005, 3
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 5, _01E9
	SetFlag FLAG_SINNOH_2737
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0236
	End

_0189:
	SetVar 0x8004, 2
	Return

_0191:
	SetVar 0x8004, 3
	Return

_0199:
	SetVar 0x8004, 4
	Return

_01A1:
	SetVar 0x8004, 6
	Return

_01A9:
	SetVar 0x8004, 7
	Return

_01B1:
	SetVar 0x8004, 8
	Return

_01B9:
	SetVar 0x8004, 9
	Return

_01C1:
	SetVar 0x8004, 10
	Return

_01C9:
	SetVar 0x8004, 11
	Return

_01D1:
	SetVar 0x8004, 13
	Return

_01D9:
	SetVar 0x8004, 14
	Return

_01E1:
	SetVar 0x8004, 15
	Return

_01E9:
	CallStd std_obtain_item_verbose
	ClearFlag FLAG_SINNOH_220
	SetVar VAR_SINNOH_40E5, 0
	SetFlag FLAG_SINNOH_2737
	NPCMsg msg_1019_ST04R0301_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0206:
	CopyVar 0x8004, VAR_SINNOH_4117
	SetVar 0x8005, 3
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0236
	CompareVarToValue 0x800C, 0
	GoToIf 5, _024B
	End

_0236:
	CopyVar VAR_SINNOH_4117, 0x8004
	SetFlag FLAG_SINNOH_220
	NPCMsg msg_1019_ST04R0301_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_024B:
	NPCMsg msg_1019_ST04R0301_00007
	ClearFlag FLAG_SINNOH_220
	SetVar VAR_SINNOH_40E5, 0
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_0262:
	// Diamond ScrCmd_Unk00DA dropped: buffers a message from Diamond's common text bank
	// TODO Diamond ScrCmd_Unk021A 0x21a args [32780]: no HeartGold mapping yet
	BufferInt 1, 0x800C
	NPCMsg msg_1019_ST04R0301_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_027E:
	NPCMsg msg_1019_ST04R0301_00009
	SetVar VAR_SINNOH_40E5, 0
	WaitButton
	CloseMsg
	ReleaseAll
	End

_028F:
	NPCMsg msg_1019_ST04R0301_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04R0301_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1019_ST04R0301_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04R0301_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1019_ST04R0301_00012
	NPCMsg msg_1019_ST04R0301_00013
	MenuInit 18, 1, 0, 1, 0x800C
	MenuItemAdd msg_1019_ST04R0301_00017, 0, 0
	MenuItemAdd msg_1019_ST04R0301_00018, 1, 1
	MenuItemAdd msg_1019_ST04R0301_00019, 2, 2
	MenuItemAdd msg_1019_ST04R0301_00020, 3, 3
	MenuExec
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0310
	CompareVarToValue 0x8008, 1
	GoToIf 1, _031B
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0326
	GoTo _0331

_0310:
	NPCMsg msg_1019_ST04R0301_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031B:
	NPCMsg msg_1019_ST04R0301_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0326:
	NPCMsg msg_1019_ST04R0301_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0331:
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
