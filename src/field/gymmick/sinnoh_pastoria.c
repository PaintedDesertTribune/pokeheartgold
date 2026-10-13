// Sinnoh port: Pastoria Gym water level (Diamond overlay 6, ov06_02241230..ov06_0224158C) on HeartGold's gymmick
// framework. The pool's surface is a dynamic terrain height over the whole room, so the player rides it; platform
// tiles (behaviours 0x56/0x57/0x58) can only be stood on when the player's height matches their level (0, 32 or 64
// units); ten button props set the water to level 0, 1 or 2, animating it one unit per frame.
#include "field/gymmick/sinnoh_pastoria.h"

#include "global.h"

#include "constants/sinnoh.h"
#include "constants/sndseq.h"

#include "field/map_prop.h"
#include "field/overlay_01_021FB368.h"
#include "field_system.h"
#include "gymmick.h"
#include "heap.h"
#include "player_avatar.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_02054648.h"

#define WATER_REGION      0                       // dynamic terrain height slot (Violet's elevator also uses 0, in its own gym)
#define WATER_SPEED       FX32_ONE                // Diamond: 1 << 12 per frame
#define LEVEL_HEIGHT(l)   FX32_CONST(32 * (l))    // levels 0, 1, 2 -> 0, 32, 64 units

typedef struct PastoriaButton {
    u8 x, z, level;
} PastoriaButton;

typedef struct PastoriaLocalData {
    FieldSystem *fieldSystem;
    u8 waterProp;
    BOOL moving;
    fx32 target;
} PastoriaLocalData;

typedef struct PastoriaWaterTask {
    int state;
    FieldSystem *fieldSystem;
    PastoriaLocalData *local;
} PastoriaWaterTask;

static const PastoriaButton sButtons[] = {
    SINNOH_PASTORIA_BUTTONS
};

static BOOL Task_PastoriaWater(TaskManager *taskman);

static inline GymmickUnion *Pastoria_SaveData(FieldSystem *fieldSystem) {
    return Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINNOH_PASTORIA);
}

void GymmickInit_SinnohPastoria(FieldSystem *fieldSystem) {
    GymmickUnion *data = Pastoria_SaveData(fieldSystem);
    PastoriaLocalData *local = Heap_Alloc(HEAP_ID_FIELD1, sizeof(PastoriaLocalData));
    MI_CpuClear8(local, sizeof(PastoriaLocalData));
    fieldSystem->unk4->unk24 = local;
    local->fieldSystem = fieldSystem;
    u8 level = data->sinnohPastoria.level > 2 ? 0 : data->sinnohPastoria.level;
    VecFx32 pos = { FX32_CONST(256), LEVEL_HEIGHT(level), FX32_CONST(256) };   // Diamond: (0x100000, y, 0x100000)
    local->waterProp = MapPropManager_LoadOne(fieldSystem->mapPropManager, SINNOH_BM_PASTORIA_WATER, &pos, NULL, fieldSystem->mapPropAnimationManager);
    ov01_021FB3E4(WATER_REGION, 1, 2, 25, 38, LEVEL_HEIGHT(level), fieldSystem->dynamicTerrainHeightManager);   // the pool, as Diamond registers it
}

void GymmickFree_SinnohPastoria(FieldSystem *fieldSystem) {
    if (fieldSystem->unk4->unk24 != NULL) {
        Heap_Free(fieldSystem->unk4->unk24);
        fieldSystem->unk4->unk24 = NULL;
    }
}

BOOL GymmickCheckCollision_SinnohPastoria(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    u8 behavior = GetMetatileBehavior(fieldSystem, tileX, tileZ);
    fx32 need;
    switch (behavior) {
    case 0x56:
        need = LEVEL_HEIGHT(0);
        break;
    case 0x57:
        need = LEVEL_HEIGHT(1);
        break;
    case 0x58:
        need = LEVEL_HEIGHT(2);
        break;
    default:
        return FALSE;
    }
    *isColliding = (fx32)height != need;
    return TRUE;
}

static BOOL Task_PastoriaWater(TaskManager *taskman) {
    PastoriaWaterTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    PastoriaLocalData *local = task->local;
    MapProp *prop = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, local->waterProp);
    VecFx32 pos;

    switch (task->state) {
    case 0:
        PlaySE(SEQ_SE_DP_131);
        task->state++;
        break;
    case 1:
        MapProp_GetTranslation(&pos, prop);
        if (pos.y < local->target) {
            pos.y += WATER_SPEED;
            if (pos.y >= local->target) {
                pos.y = local->target;
                task->state++;
            }
        } else {
            pos.y -= WATER_SPEED;
            if (pos.y <= local->target) {
                pos.y = local->target;
                task->state++;
            }
        }
        MapProp_SetTranslation(prop, &pos);
        ov01_021FB4A0(WATER_REGION, pos.y, fieldSystem->dynamicTerrainHeightManager);
        break;
    case 2:
        StopSE(SEQ_SE_DP_131, 0);
        task->state++;
        break;
    default:
        local->moving = FALSE;
        Heap_Free(task);
        return TRUE;
    }
    return FALSE;
}

// Script command (Diamond's InitPastoriaGym): the gym's level script on entry.
BOOL ScrCmd_SinnohPastoriaGymInit(ScriptContext *ctx) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(ctx->fieldSystem));
    GymmickUnion *data = Save_Gymmick_Init(gymmick, GYMMICK_SINNOH_PASTORIA);
    data->sinnohPastoria.level = 0;
    return FALSE;
}

// Script command (Diamond's CheckPastoriaGymButton): the button scripts call it with the player on the button tile.
BOOL ScrCmd_SinnohPastoriaGymButton(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_SINNOH_PASTORIA) {
        return FALSE;
    }
    PastoriaLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL || local->moving) {
        return FALSE;
    }
    int x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    for (u32 i = 0; i < NELEMS(sButtons); i++) {
        if (sButtons[i].x == x && sButtons[i].z == z) {
            GymmickUnion *data = Pastoria_SaveData(fieldSystem);
            data->sinnohPastoria.level = sButtons[i].level;
            local->target = LEVEL_HEIGHT(sButtons[i].level);
            local->moving = TRUE;
            PastoriaWaterTask *task = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(PastoriaWaterTask));
            task->state = 0;
            task->fieldSystem = fieldSystem;
            task->local = local;
            TaskManager_Call(fieldSystem->taskman, Task_PastoriaWater, task);
            return TRUE;
        }
    }
    return FALSE;
}
