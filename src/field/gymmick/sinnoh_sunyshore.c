// Sinnoh port: Sunyshore Gym gears (Diamond overlay 6, ov06_022428D8..ov06_02242AEC) on HeartGold's gymmick framework.
// Each of the three rooms has a set of gear models whose rotation (0-3 quarter turns, shared by the room) decides
// which bridge tiles are solid. The control panels' scripts rotate the gears by a quarter turn either way or a half
// turn. The rotation resets on room entry as Diamond's InitSunyshoreGym does.
#include "field/gymmick/sinnoh_sunyshore.h"

#include "global.h"

#include "constants/sinnoh.h"
#include "constants/sndseq.h"

#include "field/map_prop.h"
#include "field_system.h"
#include "gymmick.h"
#include "heap.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "task.h"
#include "unk_02005D10.h"

#define NUM_ROOMS       3
#define MAX_GEARS       13
#define QUARTER_TURN    0x4000     // 16-bit angle index, as sub_02020D2C reads it
#define TURN_STEP       0x400      // per frame (Diamond: 1 << 10)

typedef struct SunyshoreGear {
    u16 model;
    u8 x, y, z;    // tiles
    u8 flags;      // bits 0-1: base quarter turns; bit 2: turns the other way; bit 3: vertical gear (x axis, raised half a tile)
} SunyshoreGear;

typedef struct SunyshoreRect {
    u8 x, z, w, h;
} SunyshoreRect;

typedef struct SunyshoreLocalData {
    FieldSystem *fieldSystem;
    u8 room;
    s8 rotation;
    u8 gearCount;
    u8 gearProp[MAX_GEARS];
    BOOL turning;
    BOOL backwards;
    u16 total;
    u16 progress;
} SunyshoreLocalData;

typedef struct SunyshoreTurnTask {
    int state;
    FieldSystem *fieldSystem;
    SunyshoreLocalData *local;
} SunyshoreTurnTask;

static const u8 sGearCount[NUM_ROOMS] = { 3, 6, 13 };
static const SunyshoreGear sGears[NUM_ROOMS][MAX_GEARS] = {
    {
        { SINNOH_BM_SUNYSHORE_GEAR_1, 3, 0, 8, 1 },
        { SINNOH_BM_SUNYSHORE_GEAR_2, 8, 0, 8, 6 },
        { SINNOH_BM_SUNYSHORE_GEAR_1, 13, 0, 8, 0 },
    },
    {
        { SINNOH_BM_SUNYSHORE_GEAR_1, 6, 0, 8, 1 },
        { SINNOH_BM_SUNYSHORE_GEAR_0, 11, 0, 8, 7 },
        { SINNOH_BM_SUNYSHORE_GEAR_5, 15, 3, 8, 13 },
        { SINNOH_BM_SUNYSHORE_GEAR_5, 2, 3, 13, 9 },
        { SINNOH_BM_SUNYSHORE_GEAR_0, 6, 0, 13, 6 },
        { SINNOH_BM_SUNYSHORE_GEAR_3, 11, 0, 13, 2 },
    },
    {
        { SINNOH_BM_SUNYSHORE_GEAR_3, 6, 6, 8, 1 },
        { SINNOH_BM_SUNYSHORE_GEAR_2, 11, 6, 8, 4 },
        { SINNOH_BM_SUNYSHORE_GEAR_4, 16, 6, 8, 0 },
        { SINNOH_BM_SUNYSHORE_GEAR_5, 2, 3, 13, 12 },
        { SINNOH_BM_SUNYSHORE_GEAR_2, 6, 6, 13, 5 },
        { SINNOH_BM_SUNYSHORE_GEAR_3, 11, 6, 13, 3 },
        { SINNOH_BM_SUNYSHORE_GEAR_4, 16, 6, 13, 7 },
        { SINNOH_BM_SUNYSHORE_GEAR_5, 20, 3, 13, 9 },
        { SINNOH_BM_SUNYSHORE_GEAR_6, 2, 3, 18, 8 },
        { SINNOH_BM_SUNYSHORE_GEAR_1, 6, 0, 18, 5 },
        { SINNOH_BM_SUNYSHORE_GEAR_4, 11, 0, 18, 3 },
        { SINNOH_BM_SUNYSHORE_GEAR_3, 16, 0, 18, 4 },
        { SINNOH_BM_SUNYSHORE_GEAR_6, 20, 3, 18, 13 },
    },
};
static const u8 sRectCount[NUM_ROOMS] = { 12, 18, 40 };
static const SunyshoreRect sRects[NUM_ROOMS][40] = {
    {
        { 1, 8, 2, 1 },
        { 3, 6, 1, 2 },
        { 4, 8, 2, 1 },
        { 3, 9, 1, 2 },
        { 6, 8, 2, 1 },
        { 8, 6, 1, 2 },
        { 9, 8, 2, 1 },
        { 8, 9, 1, 2 },
        { 11, 8, 2, 1 },
        { 13, 6, 1, 2 },
        { 14, 8, 2, 1 },
        { 13, 9, 1, 2 },
    },
    {
        { 4, 8, 2, 1 },
        { 6, 6, 1, 2 },
        { 7, 8, 2, 1 },
        { 6, 9, 1, 2 },
        { 9, 8, 2, 1 },
        { 11, 6, 1, 2 },
        { 12, 8, 2, 1 },
        { 11, 9, 1, 2 },
        { 15, 6, 1, 5 },
        { 2, 11, 1, 5 },
        { 4, 13, 2, 1 },
        { 6, 11, 1, 2 },
        { 7, 13, 2, 1 },
        { 6, 14, 1, 2 },
        { 9, 13, 2, 1 },
        { 11, 11, 1, 2 },
        { 12, 13, 2, 1 },
        { 11, 14, 1, 2 },
    },
    {
        { 4, 8, 2, 1 },
        { 6, 6, 1, 2 },
        { 7, 8, 2, 1 },
        { 6, 9, 1, 2 },
        { 9, 8, 2, 1 },
        { 11, 6, 1, 2 },
        { 12, 8, 2, 1 },
        { 11, 9, 1, 2 },
        { 14, 8, 2, 1 },
        { 16, 6, 1, 2 },
        { 17, 8, 2, 1 },
        { 16, 9, 1, 2 },
        { 2, 11, 1, 5 },
        { 4, 13, 2, 1 },
        { 6, 11, 1, 2 },
        { 7, 13, 2, 1 },
        { 6, 14, 1, 2 },
        { 9, 13, 2, 1 },
        { 11, 11, 1, 2 },
        { 12, 13, 2, 1 },
        { 11, 14, 1, 2 },
        { 14, 13, 2, 1 },
        { 16, 11, 1, 2 },
        { 17, 13, 2, 1 },
        { 16, 14, 1, 2 },
        { 20, 11, 1, 5 },
        { 2, 16, 1, 5 },
        { 4, 18, 2, 1 },
        { 6, 16, 1, 2 },
        { 7, 18, 2, 1 },
        { 6, 19, 1, 2 },
        { 9, 18, 2, 1 },
        { 11, 16, 1, 2 },
        { 12, 18, 2, 1 },
        { 11, 19, 1, 2 },
        { 14, 18, 2, 1 },
        { 16, 16, 1, 2 },
        { 17, 18, 2, 1 },
        { 16, 19, 1, 2 },
        { 20, 16, 1, 5 },
    },
};
static const u8 sBlockedCount[NUM_ROOMS] = { 6, 11, 14 };
static const u8 sBlocked[NUM_ROOMS][4][14] = {   // [room][rotation] -> rect indices that are solid
    {
        { 0, 3, 6, 7, 8, 9 },
        { 2, 3, 4, 7, 8, 11 },
        { 0, 1, 5, 6, 9, 10 },
        { 1, 2, 4, 5, 10, 11 },
    },
    {
        { 0, 3, 5, 6, 7, 8, 9, 10, 12, 13, 17 },
        { 2, 3, 4, 6, 7, 10, 11, 13, 16, 2, 2 },
        { 1, 2, 4, 5, 7, 8, 9, 10, 11, 12, 15 },
        { 0, 1, 4, 5, 6, 11, 12, 13, 14, 0, 0 },
    },
    {
        { 0, 4, 5, 9, 13, 16, 19, 23, 25, 27, 30, 33, 36, 39 },
        { 2, 6, 7, 11, 14, 15, 17, 21, 25, 28, 29, 31, 38, 39 },
        { 1, 4, 7, 10, 12, 15, 16, 20, 22, 26, 29, 30, 34, 35 },
        { 3, 5, 6, 8, 12, 13, 14, 18, 24, 26, 27, 28, 32, 37 },
    },
};
static const s8 sInitialRotation[NUM_ROOMS] = { 2, 1, 0 };
static const u8 sResetEntryY[NUM_ROOMS] = { 14, 21, 25 };   // entering at this tile row starts the room at rotation 0

static BOOL Task_SunyshoreTurn(TaskManager *taskman);

static inline GymmickUnion *Sunyshore_SaveData(FieldSystem *fieldSystem) {
    return Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINNOH_SUNYSHORE);
}

static void Sunyshore_GearRotation(const SunyshoreGear *gear, int rotation, VecFx32 *rot) {
    int angle = (gear->flags & 3) * QUARTER_TURN;
    int turn = rotation * QUARTER_TURN;
    angle += (gear->flags & 4) ? -turn : turn;
    rot->x = rot->y = rot->z = 0;
    if (gear->flags & 8) {
        rot->x = angle;
    } else {
        rot->y = angle;
    }
}

void GymmickInit_SinnohSunyshore(FieldSystem *fieldSystem) {
    GymmickUnion *data = Sunyshore_SaveData(fieldSystem);
    SunyshoreLocalData *local = Heap_Alloc(HEAP_ID_FIELD1, sizeof(SunyshoreLocalData));
    MI_CpuClear8(local, sizeof(SunyshoreLocalData));
    fieldSystem->unk4->unk24 = local;
    local->fieldSystem = fieldSystem;
    local->room = data->sinnohSunyshore.room < NUM_ROOMS ? data->sinnohSunyshore.room : 0;
    local->rotation = data->sinnohSunyshore.rotation & 3;
    local->gearCount = sGearCount[local->room];
    VecFx32 pos, rot;
    for (int i = 0; i < local->gearCount; i++) {
        const SunyshoreGear *gear = &sGears[local->room][i];
        pos.x = FX32_CONST(gear->x * 16 + 8);
        pos.y = FX32_CONST(gear->y * 16 + ((gear->flags & 8) ? 8 : 0));
        pos.z = FX32_CONST(gear->z * 16 + 8);
        Sunyshore_GearRotation(gear, local->rotation, &rot);
        local->gearProp[i] = MapPropManager_LoadOne(fieldSystem->mapPropManager, gear->model, &pos, &rot, fieldSystem->mapPropAnimationManager);
    }
}

void GymmickFree_SinnohSunyshore(FieldSystem *fieldSystem) {
    if (fieldSystem->unk4->unk24 != NULL) {
        Heap_Free(fieldSystem->unk4->unk24);
        fieldSystem->unk4->unk24 = NULL;
    }
}

BOOL GymmickCheckCollision_SinnohSunyshore(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    SunyshoreLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL) {
        return FALSE;
    }
    const u8 *blocked = sBlocked[local->room][local->rotation & 3];
    for (int i = 0; i < sBlockedCount[local->room]; i++) {
        const SunyshoreRect *r = &sRects[local->room][blocked[i]];
        if (tileX >= r->x && tileX < (u32)(r->x + r->w) && tileZ >= r->z && tileZ < (u32)(r->z + r->h)) {
            *isColliding = TRUE;
            return TRUE;
        }
    }
    return FALSE;
}

static void Sunyshore_StartTurn(FieldSystem *fieldSystem, int direction) {
    SunyshoreLocalData *local = fieldSystem->unk4->unk24;
    GymmickUnion *data = Sunyshore_SaveData(fieldSystem);
    if (local == NULL || local->turning) {
        return;
    }
    int rotation = local->rotation;
    switch (direction) {
    case 0:
        rotation = (rotation + 1) & 3;
        local->total = QUARTER_TURN;
        local->backwards = FALSE;
        break;
    case 1:
        rotation = (rotation + 3) & 3;
        local->total = QUARTER_TURN;
        local->backwards = TRUE;
        break;
    default:
        rotation = (rotation + 2) & 3;
        local->total = 2 * QUARTER_TURN;
        local->backwards = FALSE;
        break;
    }
    local->rotation = rotation;
    data->sinnohSunyshore.rotation = rotation;
    local->progress = 0;
    local->turning = TRUE;
    PlaySE(SEQ_SE_DP_VSDEMO07);
    SunyshoreTurnTask *task = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(SunyshoreTurnTask));
    task->state = 0;
    task->fieldSystem = fieldSystem;
    task->local = local;
    TaskManager_Call(fieldSystem->taskman, Task_SunyshoreTurn, task);
}

static BOOL Task_SunyshoreTurn(TaskManager *taskman) {
    SunyshoreTurnTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    SunyshoreLocalData *local = task->local;

    if (task->state == 0) {
        u16 step = TURN_STEP;
        if (local->progress + step > local->total) {
            step = local->total - local->progress;
        }
        local->progress += step;
        int delta = local->backwards ? -(int)step : (int)step;
        for (int i = 0; i < local->gearCount; i++) {
            const SunyshoreGear *gear = &sGears[local->room][i];
            VecFx32 *rot = MapProp_GetRotation(MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, local->gearProp[i]));
            int d = (gear->flags & 4) ? -delta : delta;
            if (gear->flags & 8) {
                rot->x = (rot->x + d) & 0xFFFF;
            } else {
                rot->y = (rot->y + d) & 0xFFFF;
            }
        }
        if (local->progress >= local->total) {
            task->state++;
        }
        return FALSE;
    }
    local->turning = FALSE;
    Heap_Free(task);
    return TRUE;
}

// Script command (Diamond's InitSunyshoreGym room): run by each gear room's level script on entry.
BOOL ScrCmd_SinnohSunyshoreGymInit(ScriptContext *ctx) {
    u8 room = ScriptReadByte(ctx);
    if (room >= NUM_ROOMS) {
        room = 0;
    }
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    GymmickUnion *data = Save_Gymmick_Init(gymmick, GYMMICK_SINNOH_SUNYSHORE);
    data->sinnohSunyshore.room = room;
    data->sinnohSunyshore.rotation = sInitialRotation[room];
    if (fieldSystem->location->y == sResetEntryY[room]) {
        data->sinnohSunyshore.rotation = 0;
    }
    return FALSE;
}

// Script command (Diamond's RotateSunyshoreGymGear dir): 0 = quarter turn, 1 = quarter turn back, 2 = half turn.
BOOL ScrCmd_SinnohSunyshoreGymRotate(ScriptContext *ctx) {
    u8 direction = ScriptReadByte(ctx);
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(ctx->fieldSystem))) == GYMMICK_SINNOH_SUNYSHORE) {
        Sunyshore_StartTurn(ctx->fieldSystem, direction);
    }
    return TRUE;
}
