#ifndef POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_SUNYSHORE_H
#define POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_SUNYSHORE_H

#include "field_system.h"
#include "script.h"

void GymmickInit_SinnohSunyshore(FieldSystem *fieldSystem);
void GymmickFree_SinnohSunyshore(FieldSystem *fieldSystem);
BOOL GymmickCheckCollision_SinnohSunyshore(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding);
BOOL ScrCmd_SinnohSunyshoreGymInit(ScriptContext *ctx);
BOOL ScrCmd_SinnohSunyshoreGymRotate(ScriptContext *ctx);

#endif // POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_SUNYSHORE_H
