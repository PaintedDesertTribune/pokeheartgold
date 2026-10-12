#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T02.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_T02_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_T02_map_scripts
	InitScriptEntryEnd

scr_seq_T02_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4071, 1, _EV_scr_seq_T02_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
