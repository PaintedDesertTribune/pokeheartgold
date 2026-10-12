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
	// Diamond ScrCmd_Unk0285 dropped: Great Marsh area shuttle warp
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
	BufferInt 0, 0x8004
	BufferInt 1, 0x8005
	NPCMsg msg_1257_SD17R0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
