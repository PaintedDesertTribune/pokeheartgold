#ifndef POKEHEARTGOLD_SINNOH_SHIP_CUTSCENE_H
#define POKEHEARTGOLD_SINNOH_SHIP_CUTSCENE_H

// Diamond's ship cutscene (Canalave / Snowpoint ferries), ported for the Sinnoh region.
// Full-screen 3D scene of the ship sailing, followed by a warp to the destination.

#include "overlay_manager.h"
#include "script.h"
#include "task.h"

// Variants of files/arc/ship_demo.narc; match Diamond's ScrCmd_ShipAnimation first argument.
enum SinnohShipTravelDir {
    SINNOH_SHIP_SOUTH_TO_NORTH = 0,
    SINNOH_SHIP_NORTH_TO_SOUTH = 1,
    SINNOH_SHIP_WEST_TO_EAST = 2,
    SINNOH_SHIP_EAST_TO_WEST = 3,
};

void CallTask_SinnohShipCutscene(TaskManager *taskManager, u8 travelDir, u8 exitDir, u32 mapId, int x, int z);
BOOL ScrCmd_SinnohShipCutscene(ScriptContext *ctx);

#endif // POKEHEARTGOLD_SINNOH_SHIP_CUTSCENE_H
