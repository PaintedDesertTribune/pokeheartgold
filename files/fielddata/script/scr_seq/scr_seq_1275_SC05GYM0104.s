#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05GYM0104.h"
#include "msgdata/msg/msg_0984_SC05GYM0104.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05GYM0104_000
	ScrDef scr_seq_SC05GYM0104_001
	ScrDef scr_seq_SC05GYM0104_002
	ScrDef scr_seq_SC05GYM0104_003
	ScrDefEnd

scr_seq_SC05GYM0104_000:
	// TODO Diamond ScrCmd_InitHearthomeGym 0x171 args []: no HeartGold mapping yet
	End

scr_seq_SC05GYM0104_001:
	// TODO Diamond ScrCmd_MoveHearthomeGymElevator 0x172 args []: no HeartGold mapping yet
	End

scr_seq_SC05GYM0104_002:
	LockAll
	PlayFanfare 1572
	NPCMsg msg_0984_SC05GYM0104_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05GYM0104_003:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0984_SC05GYM0104_00000
	PlayFanfare 1591
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
