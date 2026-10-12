// Sinnoh port: Veilstone Gym punching bags (Diamond overlay 6, ov06_0224249C..ov06_02242744) on HeartGold's gymmick
// framework. Twelve bags each slide one tile along their row between two positions; standing on a trigger tile and
// pressing toward a bag pushes it, and the bag's current position blocks the tiles listed for it. States reset on
// entry, as Diamond's InitVeilstoneGym does.
#include "field/gymmick/sinnoh_veilstone.h"

#include "global.h"

#include "constants/movements.h"
#include "constants/sinnoh.h"
#include "constants/sndseq.h"

#include "field/map_prop.h"
#include "field_system.h"
#include "gymmick.h"
#include "heap.h"
#include "map_object.h"
#include "player_avatar.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_02062108.h"

#define NUM_BAGS   12
#define BAG_SPEED  FX32_CONST(2)       // one tile over a normal step (Diamond: 2 << 12 per frame)
#define BAG_X(t)   FX32_CONST(((t) + 2) * 16)   // Diamond places the model two tiles east of its logical tile
#define BAG_Y      FX32_CONST(-16)
#define BAG_Z(t)   FX32_CONST((t) * 16 + 8)

typedef struct BagSegment {
    u8 x, len;   // tiles [x, x + len) on the bag's row are blocked
} BagSegment;

typedef struct VeilstoneBag {
    u16 model;
    u8 z, xA, xB;
    BagSegment blockA[2];
    BagSegment blockB[2];
} VeilstoneBag;

typedef struct VeilstoneTrigger {
    u8 x, z;      // where the player stands
    u8 side;      // 0: bag must be at A and the player pushes east; 1: bag at B, pushes west
    u8 bag;
} VeilstoneTrigger;

typedef struct VeilstoneLocalData {
    FieldSystem *fieldSystem;
    u8 prop[NUM_BAGS];
    u8 posX[NUM_BAGS];
    BOOL pushing;
    u8 active;
    BOOL east;
    fx32 target;
} VeilstoneLocalData;

typedef struct VeilstonePushTask {
    int state;
    FieldSystem *fieldSystem;
    VeilstoneLocalData *local;
} VeilstonePushTask;

static const VeilstoneBag sBags[NUM_BAGS] = {
    { SINNOH_BM_VEILSTONE_BAG_5, 9, 9, 10, { { 9, 2 }, { 12, 1 } }, { { 10, 2 }, { 13, 1 } } },
    { SINNOH_BM_VEILSTONE_BAG_1, 10, 3, 4, { { 3, 1 }, { 5, 2 } }, { { 4, 1 }, { 6, 2 } } },
    { SINNOH_BM_VEILSTONE_BAG_1, 10, 11, 12, { { 11, 1 }, { 13, 2 } }, { { 12, 1 }, { 14, 2 } } },
    { SINNOH_BM_VEILSTONE_BAG_3, 10, 17, 18, { { 18, 1 }, { 20, 1 } }, { { 19, 1 }, { 21, 1 } } },
    { SINNOH_BM_VEILSTONE_BAG_4, 12, 1, 5, { { 4, 1 }, { 0, 0 } }, { { 5, 4 }, { 0, 0 } } },
    { SINNOH_BM_VEILSTONE_BAG_0, 13, 16, 20, { { 16, 4 }, { 0, 0 } }, { { 20, 1 }, { 0, 0 } } },
    { SINNOH_BM_VEILSTONE_BAG_6, 14, 19, 20, { { 19, 4 }, { 0, 0 } }, { { 22, 1 }, { 0, 0 } } },
    { SINNOH_BM_VEILSTONE_BAG_5, 16, 4, 7, { { 4, 2 }, { 7, 1 } }, { { 7, 2 }, { 10, 1 } } },
    { SINNOH_BM_VEILSTONE_BAG_5, 16, 16, 17, { { 16, 2 }, { 19, 1 } }, { { 17, 2 }, { 20, 1 } } },
    { SINNOH_BM_VEILSTONE_BAG_4, 18, 1, 5, { { 4, 1 }, { 0, 0 } }, { { 5, 4 }, { 0, 0 } } },
    { SINNOH_BM_VEILSTONE_BAG_6, 19, 19, 20, { { 19, 4 }, { 0, 0 } }, { { 22, 1 }, { 0, 0 } } },
    { SINNOH_BM_VEILSTONE_BAG_2, 20, 3, 8, { { 3, 4 }, { 0, 0 } }, { { 8, 4 }, { 0, 0 } } },
};

static const VeilstoneTrigger sTriggers[] = {
    { 12, 20, 1, 11 },
    { 2, 20, 0, 11 },
    { 18, 19, 0, 10 },
    { 9, 18, 1, 9 },
    { 21, 16, 1, 8 },
    { 15, 16, 0, 8 },
    { 11, 16, 1, 7 },
    { 18, 14, 0, 6 },
    { 15, 13, 0, 5 },
    { 9, 12, 1, 4 },
    { 22, 10, 1, 3 },
    { 16, 10, 1, 2 },
    { 2, 10, 0, 1 },
    { 8, 9, 0, 0 },
};

static const u8 sInitialBits[NUM_BAGS] = { 0, 0, 1, 1, 1, 0, 0, 1, 0, 1, 0, 1 };

static BOOL Task_VeilstonePush(TaskManager *taskman);

static inline GymmickUnion *Veilstone_SaveData(FieldSystem *fieldSystem) {
    return Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINNOH_VEILSTONE);
}

void GymmickInit_SinnohVeilstone(FieldSystem *fieldSystem) {
    GymmickUnion *data = Veilstone_SaveData(fieldSystem);
    VeilstoneLocalData *local = Heap_Alloc(HEAP_ID_FIELD1, sizeof(VeilstoneLocalData));
    MI_CpuClear8(local, sizeof(VeilstoneLocalData));
    fieldSystem->unk4->unk24 = local;
    local->fieldSystem = fieldSystem;
    VecFx32 pos;
    for (int k = 0; k < NUM_BAGS; k++) {
        BOOL atB = (data->sinnohVeilstone.bagBits >> k) & 1;
        local->posX[k] = atB ? sBags[k].xB : sBags[k].xA;
        pos.x = BAG_X(local->posX[k]);
        pos.y = BAG_Y;
        pos.z = BAG_Z(sBags[k].z);
        local->prop[k] = MapPropManager_LoadOne(fieldSystem->mapPropManager, sBags[k].model, &pos, NULL, fieldSystem->mapPropAnimationManager);
    }
}

void GymmickFree_SinnohVeilstone(FieldSystem *fieldSystem) {
    if (fieldSystem->unk4->unk24 != NULL) {
        Heap_Free(fieldSystem->unk4->unk24);
        fieldSystem->unk4->unk24 = NULL;
    }
}

BOOL GymmickCheckCollision_SinnohVeilstone(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    VeilstoneLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL) {
        return FALSE;
    }
    for (int k = 0; k < NUM_BAGS; k++) {
        if (tileZ != sBags[k].z) {
            continue;
        }
        const BagSegment *seg = local->posX[k] == sBags[k].xB ? sBags[k].blockB : sBags[k].blockA;
        for (int i = 0; i < 2; i++) {
            if (seg[i].len != 0 && tileX >= seg[i].x && tileX < (u32)(seg[i].x + seg[i].len)) {
                *isColliding = TRUE;
                return TRUE;
            }
        }
    }
    return FALSE;
}

// Called from the field input handler with the direction the player is pressing (DIR_*), every frame.
BOOL SinnohVeilstoneGymmick_TryPush(FieldSystem *fieldSystem, int direction) {
    VeilstoneLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL || local->pushing) {
        return FALSE;
    }
    if (direction != PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar)) {
        return FALSE;
    }
    LocalMapObject *player = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    if (!MapObject_AreBitsSetForMovementScriptInit(player)) {
        return FALSE;
    }
    int x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    for (u32 i = 0; i < NELEMS(sTriggers); i++) {
        const VeilstoneTrigger *t = &sTriggers[i];
        if (t->x != x || t->z != z) {
            continue;
        }
        u8 k = t->bag;
        u8 need = t->side ? sBags[k].xB : sBags[k].xA;
        int needDir = t->side ? DIR_WEST : DIR_EAST;
        if (local->posX[k] != need || direction != needDir) {
            continue;
        }
        GymmickUnion *data = Veilstone_SaveData(fieldSystem);
        data->sinnohVeilstone.bagBits ^= 1u << k;
        local->east = !t->side;
        local->posX[k] = t->side ? sBags[k].xA : sBags[k].xB;
        local->target = BAG_X(local->posX[k]);
        local->active = k;
        local->pushing = TRUE;
        VeilstonePushTask *task = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(VeilstonePushTask));
        task->state = 0;
        task->fieldSystem = fieldSystem;
        task->local = local;
        TaskManager_Call(fieldSystem->taskman, Task_VeilstonePush, task);
        return TRUE;
    }
    return FALSE;
}

static BOOL Task_VeilstonePush(TaskManager *taskman) {
    VeilstonePushTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    VeilstoneLocalData *local = task->local;
    LocalMapObject *player = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    MapProp *prop = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, local->prop[local->active]);
    VecFx32 pos;

    switch (task->state) {
    case 0:
        PlaySE(SEQ_SE_DP_CON_026);
        MapObject_SetHeldMovement(player, local->east ? MOVEMENT_STEP_RIGHT : MOVEMENT_STEP_LEFT);
        task->state++;
        break;
    case 1:
        MapProp_GetTranslation(&pos, prop);
        if (local->east) {
            pos.x += BAG_SPEED;
            if (pos.x >= local->target) {
                pos.x = local->target;
                task->state++;
            }
        } else {
            pos.x -= BAG_SPEED;
            if (pos.x <= local->target) {
                pos.x = local->target;
                task->state++;
            }
        }
        MapProp_SetTranslation(prop, &pos);
        break;
    case 2:
        if (MapObject_ClearHeldMovementIfActive(player)) {
            MapObject_ClearHeldMovement(player);
            StopSE(SEQ_SE_DP_CON_026, 0);
            task->state++;
        }
        break;
    default:
        local->pushing = FALSE;
        Heap_Free(task);
        return TRUE;
    }
    return FALSE;
}

// Script command (Diamond's InitVeilstoneGym): run by the gym's level script on every entry.
BOOL ScrCmd_SinnohVeilstoneGymInit(ScriptContext *ctx) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(ctx->fieldSystem));
    GymmickUnion *data = Save_Gymmick_Init(gymmick, GYMMICK_SINNOH_VEILSTONE);
    u32 bits = 0;
    for (int k = 0; k < NUM_BAGS; k++) {
        if (sInitialBits[k]) {
            bits |= 1u << k;
        }
    }
    data->sinnohVeilstone.bagBits = bits;
    return FALSE;
}
