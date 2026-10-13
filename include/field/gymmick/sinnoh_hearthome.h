#ifndef POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_HEARTHOME_H
#define POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_HEARTHOME_H

#include "field_system.h"
#include "script.h"

void GymmickInit_SinnohHearthome(FieldSystem *fieldSystem);
void GymmickFree_SinnohHearthome(FieldSystem *fieldSystem);
BOOL ScrCmd_SinnohHearthomeGymInit(ScriptContext *ctx);
BOOL ScrCmd_SinnohHearthomeGymElevator(ScriptContext *ctx);

#endif // POKEHEARTGOLD_FIELD_GYMMICK_SINNOH_HEARTHOME_H
