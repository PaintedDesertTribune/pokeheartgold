#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST05.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_ST05_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_ST05_map_scripts
	InitScriptEntryEnd

scr_seq_ST05_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4074, 1, _EV_scr_seq_ST05_004 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
