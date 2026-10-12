#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0201.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_ST01R0201_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_ST01R0201_map_scripts
	InitScriptEntryEnd

scr_seq_ST01R0201_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40A4, 0, _EV_scr_seq_ST01R0201_001 + 1
	InitScriptGoToIfEqual VAR_SINNOH_410F, 1, _EV_scr_seq_ST01R0201_010 + 1
	InitScriptGoToIfEqual VAR_SINNOH_40A4, 3, _EV_scr_seq_ST01R0201_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
