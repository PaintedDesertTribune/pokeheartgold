#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD27R0101.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_SD27R0101_000 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_SD27R0101_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_SD27R0101_map_scripts
	InitScriptEntryEnd

scr_seq_SD27R0101_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4095, 0, _EV_scr_seq_SD27R0101_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
