#ifndef POKEHEARTGOLD_GYMMICK_H
#define POKEHEARTGOLD_GYMMICK_H

#include "global.h"

typedef enum GymmickType {
    GYMMICK_NONE,
    GYMMICK_ECRUTEAK,
    GYMMICK_CIANWOOD,
    GYMMICK_VERMILION,
    GYMMICK_VIOLET,
    GYMMICK_AZALEA,
    GYMMICK_BLACKTHORN,
    GYMMICK_FUCHSIA,
    GYMMICK_VIRIDIAN,
    GYMMICK_SINJOH,
    GYMMICK_SINNOH_CANALAVE, // Sinnoh port: Canalave Gym lifts
    GYMMICK_SINNOH_VEILSTONE, // Sinnoh port: Veilstone Gym punching bags
    GYMMICK_SINNOH_SUNYSHORE, // Sinnoh port: Sunyshore Gym gears
    GYMMICK_SINNOH_PASTORIA, // Sinnoh port: Pastoria Gym water level
    GYMMICK_SINNOH_HEARTHOME, // Sinnoh port: Hearthome Gym elevator
} GymmickType;

typedef union GymmickUnion {
    u8 raw[0x20];
    struct {
        u8 candles[4];
    } ecruteak;
    struct {
        BOOL winch;
    } cianwood;
    struct {
        u8 switches[2];
        u8 gates[2];
    } vermilion;
    struct {
        BOOL liftState;
    } violet;
    struct {
        u8 spiders[4];
        int switches;
    } azalea;
    struct {
        u16 x[3];
        u16 z[3];
        u8 rot[3];
    } blackthorn;
    u8 fuchsia;  // unused
    u8 viridian; // unused
    struct {
        u32 choice;
    } sinjoh;
    struct {
        u32 liftBits; // Sinnoh port: one bit per Canalave lift (set = at its second position)
    } sinnohCanalave;
    struct {
        u32 bagBits; // Sinnoh port: one bit per Veilstone bag (set = at its second position)
    } sinnohVeilstone;
    struct {
        s8 rotation; // Sinnoh port: quarter turns of the current room's gears
        u8 room;
    } sinnohSunyshore;
    struct {
        u8 level; // Sinnoh port: Pastoria water level 0-2
    } sinnohPastoria;
    struct {
        BOOL liftUp; // Sinnoh port: Hearthome elevator at the upper floor
    } sinnohHearthome;
} GymmickUnion;

typedef struct Gymmick {
    GymmickType type;
    GymmickUnion data;
} Gymmick;

void Save_Gymmick_Clear(Gymmick *gymmick);
GymmickUnion *Save_Gymmick_Init(Gymmick *gymmick, GymmickType type);
GymmickUnion *Save_Gymmick_AssertMagic_GetData(Gymmick *gymmick, GymmickType type);
GymmickType Save_Gymmick_GetType(Gymmick *gymmick);

#endif // POKEHEARTGOLD_GYMMICK_H
