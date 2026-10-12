#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0202.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_ST01R0202_004 + 1
	InitScriptEntry_OnFrameTable scr_seq_ST01R0202_map_scripts
	InitScriptEntryEnd

scr_seq_ST01R0202_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40F9, 0, _EV_scr_seq_ST01R0202_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
