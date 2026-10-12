#ifndef POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_CANALAVE_H
#define POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_CANALAVE_H

#include "field_system.h"
#include "script.h"

void GymmickInit_SinnohCanalave(FieldSystem *fieldSystem);
void GymmickFree_SinnohCanalave(FieldSystem *fieldSystem);
BOOL GymmickCheckCollision_SinnohCanalave(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding);
BOOL SinnohCanalaveGymmick_ProcessStep(FieldSystem *fieldSystem);
BOOL ScrCmd_SinnohCanalaveGymInit(ScriptContext *ctx);

#endif // POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_CANALAVE_H
