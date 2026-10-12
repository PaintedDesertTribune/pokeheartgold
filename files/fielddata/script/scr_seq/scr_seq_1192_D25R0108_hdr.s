#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_D25R0108.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_D25R0108_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_D25R0108_map_scripts
	InitScriptEntryEnd

scr_seq_D25R0108_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4111, 1, _EV_scr_seq_D25R0108_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
