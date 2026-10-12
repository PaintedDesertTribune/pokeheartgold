#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_L01.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnLoad _EV_scr_seq_L01_000 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_L01_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_L01_map_scripts
	InitScriptEntryEnd

scr_seq_L01_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4082, 2, _EV_scr_seq_L01_004 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
