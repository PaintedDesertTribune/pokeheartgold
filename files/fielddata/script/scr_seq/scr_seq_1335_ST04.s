#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST04.h"
#include "msgdata/msg/msg_1014_ST04.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST04_000
	ScrDef scr_seq_ST04_001
	ScrDef scr_seq_ST04_002
	ScrDef scr_seq_ST04_003
	ScrDef scr_seq_ST04_004
	ScrDef scr_seq_ST04_005
	ScrDef scr_seq_ST04_006
	ScrDef scr_seq_ST04_007
	ScrDef scr_seq_ST04_008
	ScrDef scr_seq_ST04_009
	ScrDef scr_seq_ST04_010
	ScrDefEnd

scr_seq_ST04_010:
	End

scr_seq_ST04_009:
	SetFlag FLAG_SINNOH_412
	// TODO Diamond ScrCmd_Unk01BF 0x1bf args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 0
	GoToIf 5, _0047
	End

_0047:
	SetObjectFacing 3, 3
	End

scr_seq_ST04_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1014_ST04_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 4, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0088
	NPCMsg msg_1014_ST04_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0088:
	NPCMsg msg_1014_ST04_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1014_ST04_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1014_ST04_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1014_ST04_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0118
	// TODO Diamond ScrCmd_CountSinnohDexSeen 0x11e args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 50
	GoToIf 0, _010D
	NPCMsg msg_1014_ST04_00007
	SetVar 0x8004, 9
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010D:
	NPCMsg msg_1014_ST04_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0118:
	NPCMsg msg_1014_ST04_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04_006:
	DirectionSignpost msg_1014_ST04_00009, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST04_007:
	DirectionSignpost msg_1014_ST04_00010, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_ST04_008:
	DirectionSignpost msg_1014_ST04_00011, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End



	.balign 4, 0
