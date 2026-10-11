#ifndef POKEHEARTGOLD_ASSERT_H
#define POKEHEARTGOLD_ASSERT_H

#include "error_handling.h"

/*
 * Assert statements. If the expression evaluates false,
 * the software will terminate.
 *
 * Pass NO_GF_ASSERT=1 to make to remove these.
 */
#include "hack_config.h"

#if defined(PM_KEEP_ASSERTS) && HACK_ASSERTS_ALWAYS_VISIBLE
#define GF_ASSERT(expr) ((expr) ? (void)0 : GF_AssertFailAt(__FILE__, __LINE__))
#elif defined(PM_KEEP_ASSERTS)
#define GF_ASSERT(expr) ((expr) ? (void)0 : GF_AssertFail())
#else
#define GF_ASSERT(...) ((void)0)
#endif // PM_KEEP_ASSERTS

#endif // POKEHEARTGOLD_ASSERT_H
