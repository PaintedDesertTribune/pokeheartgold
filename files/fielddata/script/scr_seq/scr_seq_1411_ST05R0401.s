#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST05R0401.h"
#include "msgdata/msg/msg_1052_ST05R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST05R0401_000
	ScrDef scr_seq_ST05R0401_001
	ScrDefEnd

scr_seq_ST05R0401_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 1
	GoToIf 1, _003A
	NPCMsg msg_1052_ST05R0401_00000
	SetVar 0x8004, 11
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_003A:
	NPCMsg msg_1052_ST05R0401_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST05R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 440, 0
	NPCMsg msg_1052_ST05R0401_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
