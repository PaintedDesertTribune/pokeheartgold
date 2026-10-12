#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC02.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_SC02_000 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_SC02_023 + 1
	InitScriptEntry_OnFrameTable scr_seq_SC02_map_scripts
	InitScriptEntryEnd

scr_seq_SC02_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4078, 2, _EV_scr_seq_SC02_003 + 1
	InitScriptGoToIfEqual VAR_SINNOH_4078, 4, _EV_scr_seq_SC02_004 + 1
	InitScriptGoToIfEqual VAR_SINNOH_40F8, 3, _EV_scr_seq_SC02_022 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
