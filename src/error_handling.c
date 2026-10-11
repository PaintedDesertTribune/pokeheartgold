#include "error_handling.h"

#include "hack_config.h"

#include "global.h"

#include "error_message_reset.h"
#include "unk_02037C94.h"

const char *gHackAssertFile = NULL;
int gHackAssertLine = 0;
const char *gHackNarcPath = NULL;
int gHackNarcIndex = -1;
int gHackTexFailSize = 0;
const char *gHackTexFailName = NULL;

void GF_AssertFailAt(const char *file, int line) {
    if (gHackAssertFile == NULL) {
        gHackAssertFile = file;
        gHackAssertLine = line;
    }
    GF_AssertFail();
}

u32 gHackAssertLR = 0;
u32 gHackNote[3] = { 0, 0, 0 };

static void GF_AssertFail_Impl(void);

// Thumb thunk: remember who called us (for assertions in still-assembly code), then do the real work.
asm void GF_AssertFail(void) {
    push {r4, lr}
    ldr r4, =gHackAssertLR
    mov r3, lr
    str r3, [r4]
    bl GF_AssertFail_Impl
    pop {r4, pc}
}

static void GF_AssertFail_Impl(void) {
#if !HACK_ASSERTS_ALWAYS_VISIBLE
    if (!sub_02037D78()) {
        return;
    }
#endif

    if (OS_GetProcMode() != OS_PROCMODE_IRQ) {
        PrintErrorMessageAndReset();
    }
}
