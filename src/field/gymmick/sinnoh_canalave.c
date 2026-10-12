// Sinnoh port: Canalave Gym lifts (Diamond overlay 6, ov06_02241BB0..ov06_02242458), rebuilt on HeartGold's
// gymmick framework. 24 lifts move between two positions each; vertical ones carry the player between the four
// stacked floors (160 units apart), horizontal ones carry the player across gaps. Each floor has its own collision
// grid, selected by the player's height. Lift states live in the save gymmick block and reset on every entry,
// exactly as Diamond's InitCanalaveGym does.
#include "field/gymmick/sinnoh_canalave.h"

#include "global.h"

#include "constants/movements.h"
#include "constants/sinnoh.h"
#include "constants/sndseq.h"

#include "camera.h"
#include "field/map_prop.h"
#include "field_system.h"
#include "gymmick.h"
#include "heap.h"
#include "map_object.h"
#include "overlay_01_022053EC.h"
#include "player_avatar.h"
#include "save_misc_data.h"
#include "scrcmd.h"
#include "task.h"
#include "unk_02005D10.h"
#include "unk_02062108.h"

#define NUM_LIFTS         24
#define LIFT_NONE         0xFF
#define LIFT_SPEED        FX32_CONST(8)   // Diamond: 0x8000 per frame
#define TILE_FX(t)        FX32_CONST((t) * 16 + 8)
#define HEIGHT_FX(t)      FX32_CONST((t) * 16)
#define FLOOR_SPACING     10               // tiles of height between floors
#define MOVE_RIDE_START   73               // Diamond 0x49 / HeartGold MOVEMENT_UNK_73
#define MOVE_RIDE_END     74               // Diamond 0x4A / HeartGold MOVEMENT_UNK_74
#define MOVE_FAST_NORTH   20
#define MOVE_FAST_SOUTH   21
#define MOVE_FAST_WEST    22
#define MOVE_FAST_EAST    23

enum LiftKind { LIFT_Z, LIFT_X, LIFT_V, LIFT_TALL };
enum RideMode { RIDE_UP, RIDE_DOWN, RIDE_NORTH, RIDE_SOUTH, RIDE_EAST, RIDE_WEST };

typedef struct CanalaveLift {
    u8 kind;
    u8 ax, ay, az;   // position A (tiles; y in tiles of height, 0/10/20/30)
    u8 bx, by, bz;   // position B
    u8 lvlA, lvlB;   // floor the lift serves at A / at B
} CanalaveLift;

typedef struct CanalaveLocalData {
    FieldSystem *fieldSystem;
    u8 floorProp[3];
    u8 liftProp[NUM_LIFTS];
    u8 level[NUM_LIFTS];
    u8 posX[NUM_LIFTS], posY[NUM_LIFTS], posZ[NUM_LIFTS];
    BOOL riding;
    u8 active;
    u8 mode;
    fx32 target;
} CanalaveLocalData;

typedef struct CanalaveRideTask {
    int state;
    FieldSystem *fieldSystem;
    CanalaveLocalData *local;
} CanalaveRideTask;

static const CanalaveLift sLifts[NUM_LIFTS] = {
    { LIFT_TALL, 16, 0, 9, 16, 30, 9, 0, 3 },
    { LIFT_V, 11, 0, 13, 11, 10, 13, 0, 1 },
    { LIFT_V, 15, 0, 13, 15, 10, 13, 0, 1 },
    { LIFT_V, 19, 0, 13, 19, 10, 13, 0, 1 },
    { LIFT_V, 24, 0, 13, 24, 10, 13, 0, 1 },
    { LIFT_V, 21, 0, 22, 21, 10, 22, 0, 1 },
    { LIFT_V, 25, 0, 9, 25, 10, 9, 0, 1 },
    { LIFT_V, 25, 0, 22, 25, 10, 22, 0, 1 },
    { LIFT_V, 29, 0, 22, 29, 10, 22, 0, 1 },
    { LIFT_V, 5, 10, 26, 5, 20, 26, 1, 2 },
    { LIFT_X, 11, 10, 22, 18, 10, 22, 1, 1 },
    { LIFT_V, 29, 10, 9, 29, 20, 9, 1, 2 },
    { LIFT_X, 10, 20, 4, 14, 20, 4, 2, 2 },
    { LIFT_X, 19, 20, 4, 22, 20, 4, 2, 2 },
    { LIFT_X, 7, 20, 12, 22, 20, 12, 2, 2 },
    { LIFT_X, 9, 20, 26, 21, 20, 26, 2, 2 },
    { LIFT_Z, 2, 20, 19, 2, 20, 22, 2, 2 },
    { LIFT_Z, 26, 20, 16, 26, 20, 22, 2, 2 },
    { LIFT_Z, 29, 20, 16, 29, 20, 22, 2, 2 },
    { LIFT_TALL, 7, 0, 9, 7, 30, 9, 0, 3 },
    { LIFT_X, 19, 30, 4, 26, 30, 4, 3, 3 },
    { LIFT_X, 5, 30, 26, 26, 30, 26, 3, 3 },
    { LIFT_Z, 29, 30, 7, 29, 30, 23, 3, 3 },
    { LIFT_Z, 2, 30, 12, 2, 30, 23, 3, 3 },
};

static const u8 sInitialBits[NUM_LIFTS] = { 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1 };

static const u16 sLiftModels[4] = { SINNOH_BM_CANALAVE_LIFT_Z, SINNOH_BM_CANALAVE_LIFT_X, SINNOH_BM_CANALAVE_LIFT_V, SINNOH_BM_CANALAVE_LIFT_TALL };
static const u16 sFloorModels[3] = { SINNOH_BM_CANALAVE_FLOOR_1, SINNOH_BM_CANALAVE_FLOOR_2, SINNOH_BM_CANALAVE_FLOOR_3 };

// 1 = wall, 0 = walkable; one 32x32 grid per floor (Diamond ov06_0224FC00)
static const u8 sCollision[4][1024] = {
    {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    },
    {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    },
    {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,
        1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    },
    {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1,
        1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1,
        1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    },
};

static BOOL Task_CanalaveLiftVertical(TaskManager *taskman);
static BOOL Task_CanalaveLiftHorizontal(TaskManager *taskman);

static inline GymmickUnion *Canalave_SaveData(FieldSystem *fieldSystem) {
    return Save_Gymmick_AssertMagic_GetData(Save_GetGymmickPtr(FieldSystem_GetSaveData(fieldSystem)), GYMMICK_SINNOH_CANALAVE);
}

static inline int HeightToTiles(fx32 y) {
    return (y + FX32_CONST(8)) / FX32_CONST(16);
}

static MapProp *Canalave_Prop(CanalaveLocalData *local, u8 index) {
    return MapPropManager_GetMapPropByIndex(local->fieldSystem->mapPropManager, index);
}

static void Canalave_UpdateVisibility(CanalaveLocalData *local, fx32 playerY) {
    for (int lvl = 1; lvl <= 3; lvl++) {
        BOOL visible = playerY >= HEIGHT_FX(FLOOR_SPACING * lvl - 9);   // Diamond: 1, 11, 21 tiles
        MapProp_SetCulled(Canalave_Prop(local, local->floorProp[lvl - 1]), !visible);
        for (int k = 0; k < NUM_LIFTS; k++) {
            if (local->level[k] == lvl) {
                MapProp_SetCulled(Canalave_Prop(local, local->liftProp[k]), !visible);
            }
        }
    }
}

void GymmickInit_SinnohCanalave(FieldSystem *fieldSystem) {
    GymmickUnion *data = Canalave_SaveData(fieldSystem);
    CanalaveLocalData *local = Heap_Alloc(HEAP_ID_FIELD1, sizeof(CanalaveLocalData));
    MI_CpuClear8(local, sizeof(CanalaveLocalData));
    fieldSystem->unk4->unk24 = local;
    local->fieldSystem = fieldSystem;
    local->active = LIFT_NONE;

    VecFx32 pos;
    for (int f = 0; f < 3; f++) {   // the upper floors are separate models placed at the map origin
        pos.x = FX32_ONE;
        pos.y = HEIGHT_FX(FLOOR_SPACING * (f + 1));
        pos.z = FX32_ONE;
        local->floorProp[f] = MapPropManager_LoadOne(fieldSystem->mapPropManager, sFloorModels[f], &pos, NULL, fieldSystem->mapPropAnimationManager);
    }
    for (int k = 0; k < NUM_LIFTS; k++) {
        const CanalaveLift *lift = &sLifts[k];
        BOOL atB = (data->sinnohCanalave.liftBits >> k) & 1;
        local->posX[k] = atB ? lift->bx : lift->ax;
        local->posY[k] = atB ? lift->by : lift->ay;
        local->posZ[k] = atB ? lift->bz : lift->az;
        local->level[k] = atB ? lift->lvlB : lift->lvlA;
        pos.x = TILE_FX(local->posX[k]);
        pos.y = HEIGHT_FX(local->posY[k]);
        pos.z = TILE_FX(local->posZ[k]);
        local->liftProp[k] = MapPropManager_LoadOne(fieldSystem->mapPropManager, sLiftModels[lift->kind], &pos, NULL, fieldSystem->mapPropAnimationManager);
    }
    Camera_SetPerspectiveClippingPlane(FX32_CONST(100), FX32_CONST(1700), fieldSystem->camera);   // the room is 30 tiles tall

    VecFx32 playerPos;
    PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPos);
    Canalave_UpdateVisibility(local, playerPos.y);
}

void GymmickFree_SinnohCanalave(FieldSystem *fieldSystem) {
    if (fieldSystem->unk4->unk24 != NULL) {
        Heap_Free(fieldSystem->unk4->unk24);
        fieldSystem->unk4->unk24 = NULL;
    }
}

BOOL GymmickCheckCollision_SinnohCanalave(FieldSystem *fieldSystem, u32 tileX, u32 tileZ, u32 height, BOOL *isColliding) {
    if (tileX >= 32 || tileZ >= 32) {
        return FALSE;
    }
    int floor = HeightToTiles((fx32)height) / FLOOR_SPACING;
    if (floor < 0) {
        floor = 0;
    } else if (floor > 3) {
        floor = 3;
    }
    *isColliding = sCollision[floor][tileZ * 32 + tileX] != 0;
    return TRUE;
}

static void Canalave_StartRide(CanalaveLocalData *local, u8 k) {
    FieldSystem *fieldSystem = local->fieldSystem;
    GymmickUnion *data = Canalave_SaveData(fieldSystem);
    const CanalaveLift *lift = &sLifts[k];
    BOOL wasAtB = (data->sinnohCanalave.liftBits >> k) & 1;
    data->sinnohCanalave.liftBits ^= 1u << k;

    u8 toX = wasAtB ? lift->ax : lift->bx;
    u8 toY = wasAtB ? lift->ay : lift->by;
    u8 toZ = wasAtB ? lift->az : lift->bz;
    switch (lift->kind) {
    case LIFT_X:
        local->mode = toX > local->posX[k] ? RIDE_EAST : RIDE_WEST;
        local->target = TILE_FX(toX);
        break;
    case LIFT_Z:
        local->mode = toZ > local->posZ[k] ? RIDE_SOUTH : RIDE_NORTH;
        local->target = TILE_FX(toZ);
        break;
    default:
        local->mode = toY > local->posY[k] ? RIDE_UP : RIDE_DOWN;
        local->target = HEIGHT_FX(toY);
        break;
    }
    local->posX[k] = toX;
    local->posY[k] = toY;
    local->posZ[k] = toZ;
    local->level[k] = wasAtB ? lift->lvlA : lift->lvlB;
    local->active = k;
    local->riding = TRUE;

    CanalaveRideTask *task = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(CanalaveRideTask));
    task->state = 0;
    task->fieldSystem = fieldSystem;
    task->local = local;
    TaskManager_Call(fieldSystem->taskman, lift->kind == LIFT_X || lift->kind == LIFT_Z ? Task_CanalaveLiftHorizontal : Task_CanalaveLiftVertical, task);
}

// Called after every completed step while this gymmick is active: standing on a lift starts its ride.
BOOL SinnohCanalaveGymmick_ProcessStep(FieldSystem *fieldSystem) {
    CanalaveLocalData *local = fieldSystem->unk4->unk24;
    if (local == NULL || local->riding) {
        return FALSE;
    }
    VecFx32 playerPos;
    PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPos);
    int x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
    int y = HeightToTiles(playerPos.y);
    for (u8 k = 0; k < NUM_LIFTS; k++) {
        if (local->posX[k] == x && local->posZ[k] == z && local->posY[k] == y) {
            Canalave_StartRide(local, k);
            return TRUE;
        }
    }
    return FALSE;
}

static BOOL Task_CanalaveLiftVertical(TaskManager *taskman) {
    CanalaveRideTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    CanalaveLocalData *local = task->local;
    MapProp *prop = Canalave_Prop(local, local->liftProp[local->active]);
    VecFx32 pos;

    switch (task->state) {
    case 0:
        PlayerAvatar_ToggleAutomaticHeightUpdating(fieldSystem->playerAvatar, FALSE);
        PlaySE(SEQ_SE_DP_ELEBETA);
        task->state++;
        break;
    case 1:
        MapProp_GetTranslation(&pos, prop);
        if (local->mode == RIDE_UP) {
            pos.y += LIFT_SPEED;
            if (pos.y >= local->target) {
                pos.y = local->target;
                StopSE(SEQ_SE_DP_ELEBETA, 0);
                task->state++;
            }
        } else {
            pos.y -= LIFT_SPEED;
            if (pos.y <= local->target) {
                pos.y = local->target;
                StopSE(SEQ_SE_DP_ELEBETA, 0);
                task->state++;
            }
        }
        MapProp_SetTranslation(prop, &pos);
        PlayerAvatar_SetMapObjectYPosition(fieldSystem->playerAvatar, pos.y);
        ov01_02205A34(fieldSystem, pos.y);   // the following Pokémon rides along
        Canalave_UpdateVisibility(local, pos.y);
        break;
    case 2:
        PlayerAvatar_ToggleAutomaticHeightUpdatingImmediate(fieldSystem->playerAvatar, TRUE);
        PlaySE(SEQ_SE_DP_KI_GASYAN);
        task->state++;
        break;
    default:
        local->riding = FALSE;
        local->active = LIFT_NONE;
        Heap_Free(task);
        return TRUE;
    }
    return FALSE;
}

static BOOL Task_CanalaveLiftHorizontal(TaskManager *taskman) {
    CanalaveRideTask *task = TaskManager_GetEnvironment(taskman);
    FieldSystem *fieldSystem = task->fieldSystem;
    CanalaveLocalData *local = task->local;
    LocalMapObject *player = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    MapProp *prop = Canalave_Prop(local, local->liftProp[local->active]);
    VecFx32 pos, playerPos;

    switch (task->state) {
    case 0:
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            MapObject_SetHeldMovement(player, MOVE_RIDE_START);
            PlaySE(SEQ_SE_DP_ELEBETA);
            task->state++;
        }
        break;
    case 1: {
        BOOL arrived = FALSE;
        u32 move = 0;
        MapProp_GetTranslation(&pos, prop);
        PlayerAvatar_CopyPositionVector(fieldSystem->playerAvatar, &playerPos);
        switch (local->mode) {
        case RIDE_EAST:
            pos.x = playerPos.x;
            arrived = playerPos.x >= local->target;
            move = MOVE_FAST_EAST;
            break;
        case RIDE_WEST:
            pos.x = playerPos.x;
            arrived = playerPos.x <= local->target;
            move = MOVE_FAST_WEST;
            break;
        case RIDE_SOUTH:
            pos.z = playerPos.z;
            arrived = playerPos.z >= local->target;
            move = MOVE_FAST_SOUTH;
            break;
        default:
            pos.z = playerPos.z;
            arrived = playerPos.z <= local->target;
            move = MOVE_FAST_NORTH;
            break;
        }
        if (arrived) {
            if (local->mode == RIDE_EAST || local->mode == RIDE_WEST) {
                pos.x = local->target;
            } else {
                pos.z = local->target;
            }
            StopSE(SEQ_SE_DP_ELEBETA, 0);
            task->state++;
        } else if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            MapObject_SetHeldMovement(player, move);
        }
        MapProp_SetTranslation(prop, &pos);
    } break;
    case 2:
        if (MapObject_AreBitsSetForMovementScriptInit(player)) {
            MapObject_SetHeldMovement(player, MOVE_RIDE_END);
            task->state++;
        }
        break;
    case 3:
        if (MapObject_ClearHeldMovementIfActive(player)) {
            MapObject_ClearHeldMovement(player);
            PlaySE(SEQ_SE_DP_KI_GASYAN);
            task->state++;
        }
        break;
    default:
        local->riding = FALSE;
        local->active = LIFT_NONE;
        Heap_Free(task);
        return TRUE;
    }
    return FALSE;
}

// Script command (Diamond's InitCanalaveGym): run by the gym's level script on every entry.
BOOL ScrCmd_SinnohCanalaveGymInit(ScriptContext *ctx) {
    Gymmick *gymmick = Save_GetGymmickPtr(FieldSystem_GetSaveData(ctx->fieldSystem));
    GymmickUnion *data = Save_Gymmick_Init(gymmick, GYMMICK_SINNOH_CANALAVE);
    u32 bits = 0;
    for (int k = 0; k < NUM_LIFTS; k++) {
        if (sInitialBits[k]) {
            bits |= 1u << k;
        }
    }
    data->sinnohCanalave.liftBits = bits;
    return FALSE;
}
