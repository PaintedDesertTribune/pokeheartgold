#ifndef POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_VEILSTONE_H
#define POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_VEILSTONE_H

#include "field_system.h"
#include "script.h"

void GymmickInit_SinnohVeilstone(FieldSystem *fieldSystem);
void GymmickFree_SinnohVeilstone(FieldSystem *fieldSystem);
BOOL GymmickCheckCollision_SinnohVeilstone(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding);
BOOL SinnohVeilstoneGymmick_TryPush(FieldSystem *fieldSystem, int direction);
BOOL ScrCmd_SinnohVeilstoneGymInit(ScriptContext *ctx);

#endif // POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_VEILSTONE_H
