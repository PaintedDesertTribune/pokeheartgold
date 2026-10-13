// Sinnoh port: Hearthome Gym elevator (Diamond overlay 6, ov06_0224186C and MoveHearthomeGymElevator) on HeartGold's
// gymmick framework, modelled on Violet's elevator: a platform prop at the lift tile rides between the two floors
// (0 and 160 units) with the player on it, and the lift tile's dynamic terrain height follows the platform.
#include "field/gymmick/sinnoh_hearthome.h"

#include "global.h"

#include "constants/sinnoh.h"
#include "constants/sndseq.h"

#include "field/map_prop.h"
#include "field/overlay_01_021FB368.h"
#include "field_system.h"
#include "gymmick.h"
#include "heap.h"
#include "overlay_01_022053EC.h"
#include "player_avatar.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "task.h"
#include "unk_02005D10.h"

#define LIFT_REGION   0
#define LIFT_DOWN     0
#define LIFT_UP       FX32_CONST(160)
#define LIFT_SPEED    FX32_ONE          // Diamond: 1 << 12 per frame

typedef struct HearthomeLocalData {
    FieldSystem *fieldSystem;
    u8 liftProp;
    BOOL riding;
    fx32 target;
} HearthomeLocalData;

typedef struct HearthomeLiftTask {
    int state;
    FieldSystem *fieldSystem;
    HearthomeLocalData *local;
} HearthomeLiftTask;

static BOOL Task_HearthomeLift(TaskManager *taskman);

static inline GymmickUnion *Hearthome_SaveData(FieldSystem *fieldSystem) {
    return Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINNOH_HEARTHOME);
}

void GymmickInit_SinnohHearthome(FieldSystem *fieldSystem) {
    GymmickUnion *data = Hearthome_SaveData(fieldSystem);
    HearthomeLocalData *local = Heap_Alloc(HEAP_ID_FIELD1, sizeof(HearthomeLocalData));
    MI_CpuClear8(local, sizeof(HearthomeLocalData));
    fieldSystem->unk4->unk24 = local;
    local->fieldSystem = fieldSystem;
    fx32 y = data->sinnohHearthome.liftUp ? LIFT_UP : LIFT_DOWN;
    VecFx32 pos = { FX32_CONST(152), y, FX32_CONST(216) };   // Diamond: (0x98000, y, 0xD8000) = tile (9, 13)
    local->liftProp = MapPropManager_LoadOne(fieldSystem->mapPropManager, SINNOH_BM_HEARTHOME_LIFT, &pos, NULL, fieldSystem->mapPropAnimationManager);
    ov01_021FB3E4(LIFT_REGION, 8, 13, 3, 2, y, fieldSystem->dynamicTerrainHeightManager);
}

void GymmickFree_SinnohHearthome(FieldSystem *fieldSystem) {
    if (fieldSystem->unk4->unk24 != NULL) {
        Heap_Free(fieldSystem->unk4->unk24);
        fieldSystem->unk4->unk24 = NULL;
    }
}

static BOOL Task_HearthomeLift(TaskManager *taskman) {
    HearthomeLiftTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    HearthomeLocalData *local = task->local;
    MapProp *prop = MapPropManager_GetMapPropByIndex(fieldSystem->mapPropManager, local->liftProp);
    VecFx32 pos;

    switch (task->state) {
    case 0:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        task->state++;
        break;
    case 1:
        MapProp_GetTranslation(&pos, prop);
        if (pos.y < local->target) {
            pos.y += LIFT_SPEED;
            if (pos.y >= local->target) {
                pos.y = local->target;
                task->state++;
            }
        } else {
            pos.y -= LIFT_SPEED;
            if (pos.y <= local->target) {
                pos.y = local->target;
                task->state++;
            }
        }
        MapProp_SetTranslation(prop, &pos);
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, pos.y);
        ov01_02205A34(fieldSystem, pos.y);
        ov01_021FB4A0(LIFT_REGION, pos.y, fieldSystem->dynamicTerrainHeightManager);
        break;
    case 2:
        StopSE(SEQ_SE_DP_ELEBETA, 0);
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        task->state++;
        break;
    default:
        local->riding = FALSE;
        Heap_Free(task);
        return TRUE;
    }
    return FALSE;
}

// Script command (Diamond's InitHearthomeGym): the lift starts down when you come in through the entrance.
BOOL ScrCmd_SinnohHearthomeGymInit(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem));
    GymmickUnion *data = Save_Gymmick_Init(gymmick, GYMMICK_SINNOH_HEARTHOME);
    data->sinnohHearthome.liftUp = fieldSystem->location->y != 22;
    return FALSE;
}

// Script command (Diamond's MoveHearthomeGymElevator): ride to the other floor.
BOOL ScrCmd_SinnohHearthomeGymElevator(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    if (Save_Gymmick_GetType(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem))) != GYMMICK_SINNOH_HEARTHOME) {
        return FALSE;
    }
    HearthomeLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL || local->riding) {
        return FALSE;
    }
    GymmickUnion *data = Hearthome_SaveData(fieldSystem);
    VecFx32 playerPos;
    PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPos);
    BOOL goUp = playerPos.y < LIFT_UP / 2;
    local->target = goUp ? LIFT_UP : LIFT_DOWN;
    data->sinnohHearthome.liftUp = goUp;
    local->riding = TRUE;
    HearthomeLiftTask *task = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(HearthomeLiftTask));
    task->state = 0;
    task->fieldSystem = fieldSystem;
    task->local = local;
    TaskManager_Call(fieldSystem->taskman, Task_HearthomeLift, task);
    return TRUE;
}
