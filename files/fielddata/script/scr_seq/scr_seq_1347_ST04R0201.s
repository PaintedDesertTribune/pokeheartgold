#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST04R0201.h"
#include "msgdata/msg/msg_1020_ST04R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST04R0201_000
	ScrDef scr_seq_ST04R0201_001
	ScrDefEnd

scr_seq_ST04R0201_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	GetPartyLead 0x800C
	// TODO Diamond ScrCmd_GetPartyMonNature 0x212 args [32772, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_GetNatureName 0x17c args [0, 32772]: no HeartGold mapping yet
	NPCMsg msg_1020_ST04R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST04R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1020_ST04R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
