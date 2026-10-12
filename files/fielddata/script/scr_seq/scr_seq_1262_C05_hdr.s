#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C05.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_C05_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_C05_map_scripts
	InitScriptEntryEnd

scr_seq_C05_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40D1, 1, _EV_scr_seq_C05_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
