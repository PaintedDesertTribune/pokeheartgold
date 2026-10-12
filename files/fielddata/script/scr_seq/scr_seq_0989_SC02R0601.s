#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02R0601.h"
#include "msgdata/msg/msg_0841_SC02R0601.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC02R0601_000
	ScrDef scr_seq_SC02R0601_001
	ScrDefEnd

scr_seq_SC02R0601_001:
	// Diamond ScrCmd_Unk0238 dropped: unknown Diamond variable transform (sub_02042214)
	CompareVarToValue 0x4000, 0
	GoToIf 1, _0023
	ClearFlag FLAG_SINNOH_564
	End

_0023:
	SetFlag FLAG_SINNOH_564
	End

scr_seq_SC02R0601_000:
	End



	.balign 4, 0
