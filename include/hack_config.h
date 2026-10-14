#ifndef POKEHEARTGOLD_HACK_CONFIG_H
#define POKEHEARTGOLD_HACK_CONFIG_H

// Switches for the Four Regions hack. Keep temporary test switches here so they are easy to find and remove.

// Start a new game in Canalave City instead of the player's room, to test the Sinnoh proof slice
// without playing to Olivine. Set to 0 for a normal start.
#define HACK_START_IN_CANALAVE 1

// Start a new game in Littleroot Town (the Hoenn geometry proof) instead; wins over the Canalave switch.
// Set to 0 to fall back to Canalave or the normal start.
#define HACK_START_IN_LITTLEROOT 1

// Skip the Oak speech and naming screens on New Game: player is Ethan, rival is Silver.
#define HACK_SKIP_INTRO 1

// Boot straight into a new game (no intro movie, title or menu), for unattended map-load tests driven over the
// melonDS GDB stub by tools/sinnoh_port/maploadtest.py. Set to 0 for a normal boot.
#define HACK_AUTO_NEWGAME 0
// Show the game's error screen on any failed assertion instead of silently continuing.
#define HACK_ASSERTS_ALWAYS_VISIBLE 1

#endif // POKEHEARTGOLD_HACK_CONFIG_H
