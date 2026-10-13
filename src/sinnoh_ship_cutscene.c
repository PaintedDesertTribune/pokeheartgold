// Diamond's ship cutscene, ported for the Sinnoh region (tools/sinnoh_port step 4).
// Modelled on Platinum's boat_cutscene.c / canalave_ship.c: a full-screen 3D scene plays the
// ship model with its four animations from files/arc/ship_demo.narc, then the player is warped
// to the destination map. The in-field part (boat prop sliding out, Canalave drawbridge) is a
// later job; the script fades to black before calling the command.

#include "sinnoh_ship_cutscene.h"

#include "global.h"

#include "constants/sndseq.h"

#include "camera.h"
#include "constants/gx.h"
#include "constants/sinnoh.h"
#include "field/map_prop.h"
#include "map_object.h"
#include "player_avatar.h"
#include "field_system.h"
#include "field_bgm.h"
#include "field_warp_tasks.h"
#include "gf_3d_render.h"
#include "gf_3d_vramman.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "heap.h"
#include "screen_fade.h"
#include "sound.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"
#include "unk_02026E30.h"

#define SINNOH_SHIP_NUM_ANIMS  4
#define SINNOH_SHIP_HEAP_SIZE  0x20000

// Platinum's camera for the scene.
#define SINNOH_SHIP_CAMERA_DISTANCE 0x29AEC1
#define SINNOH_SHIP_CAMERA_ANGLE_X  ((u16)-10750)
#define SINNOH_SHIP_CAMERA_FOVY     1473

typedef struct SinnohShipArgs {
    u8 travelDir;
} SinnohShipArgs;

typedef struct SinnohShipScene {
    Camera *camera;
    GF3DVramMan *vramMan;
    NNSG3dRenderObj renderObj;
    NNSG3dResMdl *model;
    NNSG3dResFileHeader *modelFile;
    void *animFiles[SINNOH_SHIP_NUM_ANIMS];
    NNSFndAllocator allocator;
    NNSG3dAnmObj *anmObjs[SINNOH_SHIP_NUM_ANIMS];
    GXRgb edgeColorTable[8];
    u8 travelDir;
    u8 firstAnimDone;
} SinnohShipScene;

typedef struct SinnohShipTaskEnv {
    int state;
    u8 travelDir;
    u8 exitDir;
    u32 mapId;
    int x;
    int z;
    Location location;
    SinnohShipArgs args;
    // in-field departure (Diamond sub_020607D4): the harbor's ship prop slides away under a fixed camera
    MapProp *ship;
    VecFx32 cameraTarget;
    fx32 speed;
    fx32 travelled;
    fx32 travelDistance;
    fx32 cameraPan;
    u8 accelTimer;
} SinnohShipTaskEnv;

#define SHIP_PRE_STATES     100   // task states before the full-screen scene
#define SHIP_SPEED_START    (FX32_ONE / 4)     // Diamond: 0x400 per frame, +1.0 every 24 frames until >= 1.0
#define SHIP_PAN_TILES      FX32_CONST(32)     // Diamond pans the fixed camera two tiles while the ship leaves

static void SinnohShip_SlideStep(SinnohShipTaskEnv *env) {
    VecFx32 pos;
    MapProp_GetTranslation(&pos, env->ship);
    switch (env->travelDir) {
    case 0:
        pos.z += env->speed;
        break;
    case 1:
        pos.x -= env->speed;
        break;
    case 2:
        pos.x += env->speed;
        break;
    default:
        pos.z -= env->speed;
        break;
    }
    MapProp_SetTranslation(env->ship, &pos);
    env->travelled += env->speed;
    if (env->speed < FX32_ONE && ++env->accelTimer >= 24) {
        env->speed += FX32_ONE;
        env->accelTimer = 0;
    }
    if (env->cameraPan < SHIP_PAN_TILES) {   // Diamond: dir 3 pans x by 1 unit, dir 2 pans z by half a unit per frame
        if (env->travelDir == 3) {
            env->cameraTarget.x += FX32_ONE;
            env->cameraPan += FX32_ONE;
        } else if (env->travelDir == 2) {
            env->cameraTarget.z += FX32_ONE / 2;
            env->cameraPan += FX32_ONE / 2;
        } else {
            env->cameraPan = SHIP_PAN_TILES;
        }
    }
}

// Member indices into ship_demo.narc: one model plus four animations per travel direction.
static const struct {
    u16 model;
    u16 anims[SINNOH_SHIP_NUM_ANIMS];
} sShipNarcMembers[4] = {
    { 2,  { 0, 1, 3, 4 } },
    { 7,  { 5, 6, 8, 9 } },
    { 12, { 10, 11, 13, 14 } },
    { 17, { 15, 16, 18, 19 } },
};

static BOOL SinnohShipScene_Init(OverlayManager *ovy, int *state);
static BOOL SinnohShipScene_Main(OverlayManager *ovy, int *state);
static BOOL SinnohShipScene_Exit(OverlayManager *ovy, int *state);
static void SinnohShipScene_SetGxBanks(void);
static void SinnohShipScene_Init3D(SinnohShipScene *scene);
static void SinnohShipScene_LoadModelAndAnims(SinnohShipScene *scene);
static BOOL Task_SinnohShipCutscene(TaskManager *taskManager);

static const OverlayManagerTemplate sSinnohShipSceneTemplate = {
    SinnohShipScene_Init,
    SinnohShipScene_Main,
    SinnohShipScene_Exit,
    FS_OVERLAY_ID_NONE,
};

// ---- full-screen scene ------------------------------------------------------------------

static BOOL SinnohShipScene_Init(OverlayManager *ovy, int *state) {
    SinnohShipScene *scene;
    SinnohShipArgs *args;
    VecFx32 target = { 0, 0, 0 };
    CameraAngle angle;

    Heap_Create(HEAP_ID_3, HEAP_ID_SINNOH_SHIP, SINNOH_SHIP_HEAP_SIZE);
    scene = OverlayManager_CreateAndGetData(ovy, sizeof(SinnohShipScene), HEAP_ID_SINNOH_SHIP);
    MI_CpuClear8(scene, sizeof(SinnohShipScene));
    args = OverlayManager_GetArgs(ovy);
    scene->travelDir = args->travelDir & 3;
    scene->firstAnimDone = FALSE;

    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    SinnohShipScene_SetGxBanks();
    SinnohShipScene_Init3D(scene);
    GfGfx_SwapDisplay();

    HeapExp_FndInitAllocator(&scene->allocator, HEAP_ID_SINNOH_SHIP, 4);
    SinnohShipScene_LoadModelAndAnims(scene);

    scene->camera = Camera_New(HEAP_ID_SINNOH_SHIP);
    angle.x = SINNOH_SHIP_CAMERA_ANGLE_X;
    angle.y = 0;
    angle.z = 0;
    angle.unused = 0;
    Camera_Init_FromTargetDistanceAndAngle(&target, SINNOH_SHIP_CAMERA_DISTANCE, &angle, SINNOH_SHIP_CAMERA_FOVY, 0, FALSE, scene->camera);
    Camera_SetStaticPtr(scene->camera);

    // Diamond takes these from the area's light table; a sun from the upper front is close enough.
    NNS_G3dGlbLightVector(GX_LIGHTID_0, 0, -0x2D41, -0x2D41);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbLightVector(GX_LIGHTID_1, 0, -FX16_ONE, 0);
    NNS_G3dGlbLightColor(GX_LIGHTID_1, GX_RGB(16, 16, 16));
    NNS_G3dGlbMaterialColorDiffAmb(RGB_WHITE, GX_RGB(16, 16, 16), FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(RGB_BLACK, RGB_BLACK, FALSE);

    BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, HEAP_ID_SINNOH_SHIP);
    return TRUE;
}

static BOOL SinnohShipScene_Main(OverlayManager *ovy, int *state) {
    SinnohShipScene *scene = OverlayManager_GetData(ovy);
    MtxFx33 rotation;
    VecFx32 scale = { FX32_ONE, FX32_ONE, FX32_ONE };
    VecFx32 position = { 0, 0, 0 };
    int i;

    switch (*state) {
    case 0:
        PlaySE(SEQ_SE_DP_SHIP01);
        (*state)++;
        break;
    case 1:
        if (!scene->firstAnimDone) {
            if (scene->anmObjs[0]->frame + FX32_ONE >= NNS_G3dAnmObjGetNumFrame(scene->anmObjs[0])) {
                scene->firstAnimDone = TRUE;
                BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, HEAP_ID_SINNOH_SHIP);
            }
        } else if (IsPaletteFadeFinished()) {
            return TRUE;
        }
        break;
    }

    for (i = 0; i < SINNOH_SHIP_NUM_ANIMS; i++) {
        if (scene->anmObjs[i]->frame + FX32_ONE < NNS_G3dAnmObjGetNumFrame(scene->anmObjs[i])) {
            NNS_G3dAnmObjSetFrame(scene->anmObjs[i], scene->anmObjs[i]->frame + FX32_ONE);
        }
    }

    MTX_Identity33(&rotation);
    Thunk_G3X_Reset();
    NNS_G3dGePushMtx();
    Camera_PushLookAtToNNSGlb();
    GF3dRender_DrawModel(&scene->renderObj, &position, &rotation, &scale);
    NNS_G3dGePopMtx(1);
    RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_W);
    return FALSE;
}

static BOOL SinnohShipScene_Exit(OverlayManager *ovy, int *state) {
    SinnohShipScene *scene = OverlayManager_GetData(ovy);
    int i;

    for (i = 0; i < SINNOH_SHIP_NUM_ANIMS; i++) {
        NNS_G3dFreeAnmObj(&scene->allocator, scene->anmObjs[i]);
        Heap_Free(scene->animFiles[i]);
    }
    Heap_Free(scene->modelFile);
    Camera_UnsetStaticPtr();
    Camera_Delete(scene->camera);
    GF_3DVramMan_Delete(scene->vramMan);
    OverlayManager_FreeData(ovy);
    Heap_Destroy(HEAP_ID_SINNOH_SHIP);
    return TRUE;
}

static void SinnohShipScene_SetGxBanks(void) {
    const struct GraphicsBanks banks = {
        GX_VRAM_BG_128_C,
        GX_VRAM_BGEXTPLTT_NONE,
        GX_VRAM_SUB_BG_32_H,
        GX_VRAM_SUB_BGEXTPLTT_NONE,
        GX_VRAM_OBJ_16_F,
        GX_VRAM_OBJEXTPLTT_NONE,
        GX_VRAM_SUB_OBJ_16_I,
        GX_VRAM_SUB_OBJEXTPLTT_NONE,
        GX_VRAM_TEX_01_AB,
        GX_VRAM_TEXPLTT_0123_E,
    };
    GfGfx_SetBanks(&banks);
}

static void SinnohShipScene_Init3D(SinnohShipScene *scene) {
    struct GraphicsModes modes;
    int i;

    modes.dispMode = GX_DISPMODE_GRAPHICS;
    modes.bgMode = GX_BGMODE_0;
    modes.subMode = GX_BGMODE_0;
    modes._2d3dMode = GX_BG0_AS_3D;
    SetBothScreensModesAndDisable(&modes);

    scene->vramMan = GF_3DVramMan_Create(HEAP_ID_SINNOH_SHIP, 0, 2, 0, 4, NULL);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(TRUE);
    scene->edgeColorTable[0] = GX_RGB(0, 0, 0);
    for (i = 1; i < 8; i++) {
        scene->edgeColorTable[i] = GX_RGB(4, 4, 4);
    }
    G3X_SetEdgeColorTable(scene->edgeColorTable);
    G3X_SetClearColor(RGB_BLACK, 0, GF_GX_CLEARCOLORDEPTH_MAX, 0x3F, FALSE);

    GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
}

static void SinnohShipScene_LoadModelAndAnims(SinnohShipScene *scene) {
    NNSG3dResTex *tex;
    void *anim;
    int i;
    int variant = scene->travelDir;

    scene->modelFile = GfGfxLoader_LoadFromNarc(NARC_arc_ship_demo, sShipNarcMembers[variant].model, FALSE, HEAP_ID_SINNOH_SHIP, FALSE);
    scene->model = NNS_G3dGetMdlByIdx(NNS_G3dGetMdlSet(scene->modelFile), 0);
    tex = NNS_G3dGetTex(scene->modelFile);
    GF3dRender_AllocAndLoadTexResources(tex);
    GF3dRender_BindModelSet(scene->modelFile, tex);
    NNS_G3dRenderObjInit(&scene->renderObj, scene->model);

    NNS_G3dMdlUseGlbDiff(scene->model);
    NNS_G3dMdlUseGlbAmb(scene->model);
    NNS_G3dMdlUseGlbSpec(scene->model);
    NNS_G3dMdlUseGlbEmi(scene->model);

    for (i = 0; i < SINNOH_SHIP_NUM_ANIMS; i++) {
        scene->animFiles[i] = GfGfxLoader_LoadFromNarc(NARC_arc_ship_demo, sShipNarcMembers[variant].anims[i], FALSE, HEAP_ID_SINNOH_SHIP, FALSE);
        anim = NNS_G3dGetAnmByIdx(scene->animFiles[i], 0);
        scene->anmObjs[i] = NNS_G3dAllocAnmObj(&scene->allocator, anim, scene->model);
        NNS_G3dAnmObjInit(scene->anmObjs[i], anim, scene->model, tex);
        NNS_G3dRenderObjAddAnmObj(&scene->renderObj, scene->anmObjs[i]);
    }
}

// ---- field task -------------------------------------------------------------------------
// Same shape as the naming screen's task: leave the overworld, run the application, change
// location, restore the overworld. (Task_ScriptWarp cannot be used after an application because
// its leave step asserts that the field process is still alive.)

static BOOL Task_SinnohShipCutscene(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    SinnohShipTaskEnv *env = TaskManager_GetEnvironment(taskManager);

    switch (env->state) {
    case SHIP_PRE_STATES: {
        // Diamond's ShipAnimation first slides the harbor's ship out of frame (Canalave: build model 0x22 going
        // north 25 tiles; the islands' boat 0x1C1 going east 12 tiles) under a camera fixed on the dock.
        int model = env->travelDir == 3 ? SINNOH_BM_CANALAVE_SHIP : (env->travelDir == 2 ? SINNOH_BM_ISLAND_SHIP : -1);
        env->ship = model >= 0 ? MapPropManager_FindMapPropByBuildModel(fieldSystem->mapPropManager, model) : NULL;
        if (env->ship == NULL) {
            env->state = SHIP_PRE_STATES + 2;   // no ship here (other harbors): just fade and go
            break;
        }
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &env->cameraTarget);
        Camera_ClearFixedTarget(fieldSystem->camera);
        Camera_SetFixedTarget(&env->cameraTarget, fieldSystem->camera);
        MapObject_SetVisible(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar), FALSE);   // the player is aboard
        env->speed = SHIP_SPEED_START;
        env->travelDistance = env->travelDir == 3 ? FX32_CONST(400) : FX32_CONST(192);
        PlaySE(SEQ_SE_DP_W092);
        env->state++;
    } break;
    case SHIP_PRE_STATES + 1:
        SinnohShip_SlideStep(env);
        if (env->travelled >= env->travelDistance) {
            env->state++;
        }
        break;
    case SHIP_PRE_STATES + 2:
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_OUT, FADE_TYPE_BRIGHTNESS_OUT, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
        GF_SndStartFadeOutBGM(0, 6);
        env->state++;
        break;
    case SHIP_PRE_STATES + 3:
        if (!IsPaletteFadeFinished() || GF_SndGetFadeTimer() != 0) {
            break;
        }
        if (env->ship != NULL) {
            Camera_ClearFixedTarget(fieldSystem->camera);
        }
        env->state = 0;
        break;
    case 0:
        CallTask_LeaveOverworld(taskManager);
        env->state++;
        break;
    case 1:
        if (GF_SndGetFadeTimer() != 0) {
            break;
        }
        env->args.travelDir = env->travelDir;
        CallApplicationAsTask(taskManager, &sSinnohShipSceneTemplate, &env->args);
        env->state++;
        break;
    case 2:
        InitLocation(&env->location, env->mapId, -1, env->x, env->z, env->exitDir);
        sub_020537A8(taskManager, &env->location);
        env->state++;
        break;
    case 3:
        FieldBGM_PlayForMapHeader(fieldSystem, env->mapId, FALSE);
        CallTask_RestoreOverworld(taskManager);
        env->state++;
        break;
    case 4:
        BeginNormalPaletteFade(FADE_BOTH_SCREENS, FADE_TYPE_BRIGHTNESS_IN, FADE_TYPE_BRIGHTNESS_IN, RGB_BLACK, 6, 1, HEAP_ID_FIELD1);
        env->state++;
        break;
    case 5:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        Heap_Free(env);
        return TRUE;
    }
    return FALSE;
}

void CallTask_SinnohShipCutscene(TaskManager *taskManager, u8 travelDir, u8 exitDir, u32 mapId, int x, int z) {
    SinnohShipTaskEnv *env = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(SinnohShipTaskEnv));
    MI_CpuClear8(env, sizeof(SinnohShipTaskEnv));
    env->travelDir = travelDir;
    env->exitDir = exitDir;
    env->mapId = mapId;
    env->x = x;
    env->z = z;
    env->state = SHIP_PRE_STATES;
    TaskManager_Call(taskManager, Task_SinnohShipCutscene, env);
}

// Script command 853: .byte travelDir, .byte exitDir, .short map, .short x, .short z
// (same layout as Diamond's ScrCmd_ShipAnimation).
BOOL ScrCmd_SinnohShipCutscene(ScriptContext *ctx) {
    u8 travelDir = ScriptReadByte(ctx);
    u8 exitDir = ScriptReadByte(ctx);
    u16 mapId = ScriptReadHalfword(ctx);
    u16 x = ScriptReadHalfword(ctx);
    u16 z = ScriptReadHalfword(ctx);
    CallTask_SinnohShipCutscene(ctx->taskman, travelDir, exitDir, mapId, x, z);
    return TRUE;
}
