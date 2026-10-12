#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0501.h"
#include "msgdata/msg/msg_0864_SC01R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0501_000
	ScrDef scr_seq_SC01R0501_001
	ScrDef scr_seq_SC01R0501_002
	ScrDef scr_seq_SC01R0501_003
	ScrDefEnd

scr_seq_SC01R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0864_SC01R0501_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_0864_SC01R0501_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0501_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 417, 0
	NPCMsg msg_0864_SC01R0501_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0501_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_191
	GoToIf 1, _00B7
	BufferItemName 0, 217
	NPCMsg msg_0864_SC01R0501_00003
	SetVar 0x8004, 217
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00AD
	SetFlag FLAG_SINNOH_191
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_00AD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_00B7:
	NPCMsg msg_0864_SC01R0501_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
