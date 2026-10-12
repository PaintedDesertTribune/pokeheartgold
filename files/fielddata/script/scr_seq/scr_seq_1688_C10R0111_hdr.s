#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C10R0111.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_C10R0111_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_C10R0111_map_scripts
	InitScriptEntryEnd

scr_seq_C10R0111_map_scripts:
	InitScriptGoToIfEqual 0x4003, 0, _EV_scr_seq_C10R0111_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
