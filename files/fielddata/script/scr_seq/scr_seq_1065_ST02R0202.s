#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST02R0202.h"
#include "msgdata/msg/msg_0879_ST02R0202.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST02R0202_000
	ScrDef scr_seq_ST02R0202_001
	ScrDefEnd

scr_seq_ST02R0202_000:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0879_ST02R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST02R0202_001:
	PlayFanfare 1500
	LockAll
	BufferPlayersName 0
	NPCMsg msg_0879_ST02R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
