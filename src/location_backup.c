#include "location_backup.h"

#include "global.h"

#include "constants/maps.h"
#include "hack_config.h"

#include "field_system.h"
#include "save_local_field_data.h"

#if HACK_START_IN_CANALAVE
// Test start for the Sinnoh proof slice: the east bank of Canalave's canal, by the harbor.
static const Location sLocation_PlayerRoom = {
    .mapId = MAP_SINNOH_CANALAVE,
    .warpId = 0xFFFFFFFF,
    .x = 22,
    .y = 30,
    .direction = 0x00000001,
};
#else
static const Location sLocation_PlayerRoom = {
    .mapId = MAP_NEW_BARK_PLAYER_HOUSE_2F,
    .warpId = 0xFFFFFFFF,
    .x = 0x00000006,
    .y = 0x00000006,
    .direction = 0x00000001,
};
#endif

static const Location sLocation_OutsidePlayerHome = {
    .mapId = MAP_NEW_BARK,
    .warpId = 0xFFFFFFFF,
    .x = 0x000002B7,
    .y = 0x0000018D,
    .direction = 0x00000001,
};

void Location_SetToPlayerRoom(Location *dest) {
    const Location *src = &sLocation_PlayerRoom;
    *dest = *src;
}

void Location_SetToOutsidePlayerHome(Location *dest) {
    const Location *src = &sLocation_OutsidePlayerHome;
    *dest = *src;
}

void Save_SetPositionToPlayerRoom(SaveData *saveData) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(saveData));
    Location_SetToPlayerRoom(position);
}
