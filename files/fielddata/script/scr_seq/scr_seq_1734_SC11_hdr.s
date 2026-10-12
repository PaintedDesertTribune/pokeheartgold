#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_SC11_014 + 1
	InitScriptEntry_OnFrameTable scr_seq_SC11_map_scripts
	InitScriptEntryEnd

scr_seq_SC11_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4081, 0, _EV_scr_seq_SC11_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
