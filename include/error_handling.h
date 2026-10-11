#ifndef POKEHEARTGOLD_ERROR_HANDLING_H
#define POKEHEARTGOLD_ERROR_HANDLING_H

/*
 * void GF_AssertFail(void)
 *
 * Called when an assertion fails.
 * Do not use this directly.
 * Instead, use the GF_ASSERT macro defined above.
 */
#include "nitro/types.h"

void GF_AssertFail(void);
void GF_AssertFailAt(const char *file, int line);
extern const char *gHackAssertFile;
extern int gHackAssertLine;
extern const char *gHackNarcPath;
extern int gHackNarcIndex;
extern u32 gHackNote[3];
extern int gHackTexFailSize;
extern const char *gHackTexFailName;

#endif // POKEHEARTGOLD_ERROR_HANDLING_H
