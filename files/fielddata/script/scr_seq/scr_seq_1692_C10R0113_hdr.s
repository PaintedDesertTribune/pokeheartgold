#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_C10R0113.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnFrameTable scr_seq_C10R0113_map_scripts
	InitScriptEntryEnd

scr_seq_C10R0113_map_scripts:
	InitScriptGoToIfEqual 0x4003, 0, _EV_scr_seq_C10R0113_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
