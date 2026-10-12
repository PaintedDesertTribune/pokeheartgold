#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC11R0101.h"
#include "constants/init_script_types.h"
#include "macros/script.inc"


	InitScriptEntry_OnTransition _EV_scr_seq_SC11R0101_006 + 1
	InitScriptEntry_OnFrameTable scr_seq_SC11R0101_map_scripts
	InitScriptEntryEnd

scr_seq_SC11R0101_map_scripts:
	InitScriptGoToIfEqual VAR_SINNOH_4113, 0, _EV_scr_seq_SC11R0101_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
