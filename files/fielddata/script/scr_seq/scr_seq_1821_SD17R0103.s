#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD17R0103.h"
#include "msgdata/msg/msg_1257_SD17R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD17R0103_000
	ScrDef scr_seq_SD17R0103_001
	ScrDefEnd

scr_seq_SD17R0103_000:
	Call _0018
	// TODO Diamond ScrCmd_Unk0285 0x285 args [16651, 16652]: no HeartGold mapping yet
	End

_0018:
	AddVar VAR_SINNOH_410B, 1
	AddVar VAR_SINNOH_410C, 1
	Return

scr_seq_SD17R0103_001:
	PlayFanfare 1500
	LockAll
	CopyVar 0x8004, VAR_SINNOH_410B
	CopyVar 0x8005, VAR_SINNOH_410C
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 32772]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [1, 32773]: no HeartGold mapping yet
	NPCMsg msg_1257_SD17R0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
