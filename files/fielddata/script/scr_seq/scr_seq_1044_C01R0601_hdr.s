#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C01R0601.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnResume _EV_scr_seq_C01R0601_010 + 1
	InitScriptEntry_OnFrameTable scr_seq_C01R0601_map_scripts
	InitScriptEntryEnd

scr_seq_C01R0601_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_40D5, 6, _EV_scr_seq_C01R0601_009 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
