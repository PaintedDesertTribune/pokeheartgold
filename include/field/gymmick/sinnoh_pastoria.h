#ifndef POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_PASTORIA_H
#define POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_PASTORIA_H

#include "field_system.h"
#include "script.h"

void GymmickInit_SinnohPastoria(FieldSystem *fieldSystem);
void GymmickFree_SinnohPastoria(FieldSystem *fieldSystem);
BOOL GymmickCheckCollision_SinnohPastoria(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding);
BOOL ScrCmd_SinnohPastoriaGymInit(ScriptContext *ctx);
BOOL ScrCmd_SinnohPastoriaGymButton(ScriptContext *ctx);

#endif // POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_PASTORIA_H
