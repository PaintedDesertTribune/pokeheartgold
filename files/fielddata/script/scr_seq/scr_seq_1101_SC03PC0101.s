#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC03PC0101.h"
#include "msgdata/msg/msg_0897_SC03PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC03PC0101_000
	ScrDef scr_seq_SC03PC0101_001
	ScrDef scr_seq_SC03PC0101_002
	ScrDef scr_seq_SC03PC0101_003
	ScrDefEnd

scr_seq_SC03PC0101_000:
	SetVar 0x8007, 3
	CallStd std_nurse_joy
	End

scr_seq_SC03PC0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0897_SC03PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03PC0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0897_SC03PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC03PC0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_112
	GoToIf 1, _0060
	NPCMsg msg_0897_SC03PC0101_00002
	GoTo _006C

_0060:
	// TODO Diamond ScrCmd_Unk00D9 0x0d9 args [0]: no HeartGold mapping yet
	NPCMsg msg_0897_SC03PC0101_00007
	GoTo _006C

_006C:
	NPCMsg msg_0897_SC03PC0101_00003
	// TODO Diamond ScrCmd_Unk0154 0x154 args []: no HeartGold mapping yet
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 50, 0
	ScrCmd_066 51, 1
	ScrCmd_066 52, 2
	ScrCmd_066 53, 3
	ScrCmd_066 43, 4
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CopyVar 0x8004, 0x800C
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 4
	GoToIf 1, _00DD
	CompareVarToValue 0x8008, 65534
	GoToIf 1, _00DD
	// TODO Diamond ScrCmd_Unk0155 0x155 args [32772, 32773]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CC 0x2cc args [0, 32773]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_CapitalizeFirstChar 0x2ce args [0]: no HeartGold mapping yet
	NPCMsg msg_0897_SC03PC0101_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00E8
	GoTo _006C

_00DD:
	NPCMsg msg_0897_SC03PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E8:
	// TODO Diamond ScrCmd_Unk02CC 0x2cc args [0, 32773]: no HeartGold mapping yet
	NPCMsg msg_0897_SC03PC0101_00005
	SetFlag FLAG_SINNOH_112
	// TODO Diamond ScrCmd_Unk029C 0x29c args [32772, 32773]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_SetPlayerAvatar 0x156 args [32773]: no HeartGold mapping yet
	GoTo _00DD



	.balign 4, 0
