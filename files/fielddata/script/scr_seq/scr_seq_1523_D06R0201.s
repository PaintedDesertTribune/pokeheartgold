#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D06R0201.h"
#include "msgdata/msg/msg_1108_D06R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_D06R0201_000
	ScrDef scr_seq_D06R0201_001
	ScrDefEnd

scr_seq_D06R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1108_D06R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D06R0201_000:
	DirectionSignpost msg_1108_D06R0201_00001, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
