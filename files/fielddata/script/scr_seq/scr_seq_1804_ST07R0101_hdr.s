#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST07R0101.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_ST07R0101_007 + 1
	InitScriptEntry_OnFrameTable scr_seq_ST07R0101_map_scripts
	InitScriptEntryEnd

scr_seq_ST07R0101_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40A7, 0, _EV_scr_seq_ST07R0101_006 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
