#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD25R0102.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_SD25R0102_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_SD25R0102_map_scripts
	InitScriptEntryEnd

scr_seq_SD25R0102_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4110, 1, _EV_scr_seq_SD25R0102_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
