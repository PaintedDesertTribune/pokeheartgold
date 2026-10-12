#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_R206.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnResume _EV_scr_seq_R206_001 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_R206_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_R206_map_scripts
	InitScriptEntryEnd

scr_seq_R206_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_411C, 1, _EV_scr_seq_R206_007 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
