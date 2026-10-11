#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C02R0401.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_C02R0401_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_C02R0401_map_scripts
	InitScriptEntryEnd

scr_seq_C02R0401_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40F8, 1, _EV_scr_seq_C02R0401_001 + 1
	InitScriptGoToIfEqual VAR_SINNOH_40F8, 2, _EV_scr_seq_C02R0401_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
