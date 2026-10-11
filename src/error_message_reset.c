#include "error_message_reset.h"

#include "hack_config.h"


#include <nitro/gx/g2.h>
#include <nitro/gx/gx_bgcnt.h>
#include <nitro/pad/common/pad.h>

#include "global.h"

#include "files/msgdata/msg.naix"
#include "files/msgdata/msg/msg_0041.h"

#include "bg_window.h"
#include "brightness.h"
#include "font.h"
#include "gf_gfx_planes.h"
#include "main.h"
#include "msgdata.h"
#include "pm_string.h"
#include "render_window.h"
#include "screen_fade.h"
#include "system.h"
#include "text.h"
#include "unk_02035900.h"
#include "unk_02037C94.h"

static const GraphicsBanks sErrorMessageBanksConfig = {
    .bg = GX_VRAM_BG_256_AB,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_NONE,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_NONE,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_NONE,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_NONE,
    .texpltt = GX_VRAM_TEXPLTT_NONE,
};

static const struct GraphicsModes sErrorMessageBgModeSet = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};

static const BgTemplate sErrorMessageBgTemplate = {
    .x = 0,
    .y = 0,
    .bufferSize = 0x800,
    .baseTile = 0,
    .size = GF_BG_SCR_SIZE_256x256,
    .colorMode = GX_BG_COLORMODE_16,
    .screenBase = GX_BG_SCRBASE_0x0000,
    .charBase = GX_BG_CHARBASE_0x18000,
    .bgExtPltt = GX_BG_EXTPLTT_01,
    .priority = 1,
    .areaOver = GX_BG_AREAOVER_XLU,
    .dummy = 0,
    .mosaic = FALSE,
};

static const WindowTemplate sErrorMessageWindowTemplate = {
    .bgId = GF_BG_LYR_MAIN_0,
    .left = 3,
    .top = 3,
    .width = 26,
    .height = 18,
    .palette = 1,
    .baseTile = 0x23,
};

static const HeapParam sErrorMessageHeapParams = {
    .size = 0x20000,
    .arena = OS_ARENA_MAIN,
};

static BOOL sErrorMessagePrinterLock;

static void VBlankIntr() {
    OS_SetIrqCheckFlag(OS_IE_V_BLANK);
    MI_WaitDma(GX_DEFAULT_DMAID);
}


#if HACK_ASSERTS_ALWAYS_VISIBLE
#include "constants/charcode.h"
#include "error_handling.h"

extern u32 gHackTexFailPtr, gHackTexFailMagic, gHackTexFailFileMagic, gHackTexFailEntries;
extern u32 gHackAllocFailHeap, gHackAllocFailSize;
extern u32 gHackAssertLR;

static const char *HackBasename(const char *path) {
    const char *base = path;
    for (; *path != 0; path++) {
        if (*path == '/' || *path == '\\') {
            base = path + 1;
        }
    }
    return base;
}

static void HackAppendAscii(String *str, const char *text) {
    for (; *text != 0; text++) {
        char c = *text;
        u16 code;
        if (c >= '0' && c <= '9') {
            code = CHAR_0 + (c - '0');
        } else if (c >= 'A' && c <= 'Z') {
            code = CHAR_A + (c - 'A');
        } else if (c >= 'a' && c <= 'z') {
            code = CHAR_a + (c - 'a');
        } else if (c == '.') {
            code = CHAR_PERIOD;
        } else if (c == '_') {
            code = CHAR_UNDERSCORE;
        } else if (c == '/') {
            code = CHAR_SLASH;
        } else {
            code = CHAR_SPACE;
        }
        String_AddChar(str, code);
    }
}

static void HackAppendAsciiN(String *str, const char *text, int n) {
    char buf[32];
    int i;
    for (i = 0; i < n && i < 31 && text[i] != 0; i++) {
        buf[i] = text[i];
    }
    buf[i] = 0;
    HackAppendAscii(str, buf);
}

static void HackAppendHex(String *str, u32 value) {
    static const char digits[] = "0123456789ABCDEF";
    char buf[9];
    int i;
    for (i = 7; i >= 0; i--) {
        buf[i] = digits[value & 0xF];
        value >>= 4;
    }
    buf[8] = 0;
    HackAppendAscii(str, buf);
}

static void HackAppendNumber(String *str, int value) {
    char buf[12];
    int i = 0;
    if (value == 0) {
        buf[i++] = '0';
    }
    while (value > 0 && i < 11) {
        buf[i++] = (char)('0' + value % 10);
        value /= 10;
    }
    buf[i] = 0;
    // reverse
    for (int a = 0, b = i - 1; a < b; a++, b--) {
        char t = buf[a];
        buf[a] = buf[b];
        buf[b] = t;
    }
    HackAppendAscii(str, buf);
}
#endif

void PrintErrorMessageAndReset(void) {
    Window window;

    if (sErrorMessagePrinterLock == TRUE) {
        return;
    }

    sErrorMessagePrinterLock = TRUE;

    OS_SetArenaHi(OS_ARENA_MAIN, OS_GetInitArenaHi(OS_ARENA_MAIN));
    OS_SetArenaLo(OS_ARENA_MAIN, OS_GetInitArenaLo(OS_ARENA_MAIN));
    Heap_InitSystem(&sErrorMessageHeapParams, 1, 1, 0);

    sub_0200FBF4(PM_LCD_TOP, RGB_BLACK);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_BLACK);

    OS_DisableIrqMask(OS_IE_V_BLANK);
    OS_SetIrqFunction(OS_IE_V_BLANK, VBlankIntr);
    OS_EnableIrqMask(OS_IE_V_BLANK);

    Main_SetVBlankIntrCB(NULL, NULL);
    Main_SetHBlankIntrCB(NULL, NULL);

    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);

    SetKeyRepeatTimers(4, 8);

    gSystem.screensFlipped = FALSE;

    GfGfx_SwapDisplay();
    G2_BlendNone();
    G2S_BlendNone();
    GX_SetVisibleWnd(GX_WNDMASK_NONE);
    GXS_SetVisibleWnd(0);
    GfGfx_SetBanks(&sErrorMessageBanksConfig);

    BgConfig *bg_config = BgConfig_Alloc(HEAP_ID_DEFAULT);
    SetBothScreensModesAndDisable(&sErrorMessageBgModeSet);
    InitBgFromTemplate(bg_config, 0, &sErrorMessageBgTemplate, GF_BG_TYPE_TEXT);
    BgClearTilemapBufferAndCommit(bg_config, GF_BG_LYR_MAIN_0);
    LoadUserFrameGfx1(bg_config, GF_BG_LYR_MAIN_0, 0x1F7, 2, 0, HEAP_ID_DEFAULT);
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_1_OFFSET, HEAP_ID_DEFAULT);
    BG_ClearCharDataRange(GF_BG_LYR_MAIN_0, 0x20, 0, HEAP_ID_DEFAULT);
    BG_SetMaskColor(GF_BG_LYR_MAIN_0, RGB(1, 1, 27));
    BG_SetMaskColor(GF_BG_LYR_SUB_0, RGB(1, 1, 27));

    MsgData *error_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0041, HEAP_ID_DEFAULT);
    String *error_str = String_New(384, HEAP_ID_DEFAULT);

    ResetAllTextPrinters();

    AddWindow(bg_config, &window, &sErrorMessageWindowTemplate);
    FillWindowPixelRect(&window, 0xF, 0, 0, 208, 144);
    DrawFrameAndWindow1(&window, FALSE, 0x1F7, 2);

#if HACK_ASSERTS_ALWAYS_VISIBLE
    BOOL hackDiag = (gHackAssertFile != NULL || gHackAssertLR != 0 || gHackAllocFailHeap != 0xFFFF || gHackTexFailSize != 0 || gHackNarcPath != NULL);
    if (!hackDiag) {
        ReadMsgDataIntoString(error_msgdata, msg_0041_00003, error_str);
        AddTextPrinterParameterized(&window, 0, error_str, 0, 0, 0, NULL);
        {
            String *hd = String_New(32, HEAP_ID_DEFAULT);
            HackAppendAscii(hd, "HACK GEN no diag");
            AddTextPrinterParameterized(&window, 0, hd, 0, 128, 0, NULL);
            String_Delete(hd);
        }
    } else {
        String *hd = String_New(32, HEAP_ID_DEFAULT);
        HackAppendAscii(hd, "HACK DIAGNOSTIC");
        AddTextPrinterParameterized(&window, 0, hd, 0, 0, 0, NULL);
        String_Delete(hd);
    }
    String_Delete(error_str);
    if (gHackAssertFile != NULL) {
        String *where = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(where, HackBasename(gHackAssertFile));
        String_AddChar(where, CHAR_COLON);
        HackAppendNumber(where, gHackAssertLine);
        AddTextPrinterParameterized(&window, 0, where, 0, 16, 0, NULL);
        String_Delete(where);
    }
    if (gHackAssertLR != 0) {
        String *lr = String_New(32, HEAP_ID_DEFAULT);
        HackAppendAscii(lr, "from ");
        HackAppendHex(lr, gHackAssertLR);
        AddTextPrinterParameterized(&window, 0, lr, 0, 32, 0, NULL);
        String_Delete(lr);
    }
    if (gHackNote[2] != 0 || gHackNote[0] != 0) {
        String *nt = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(nt, "note ");
        HackAppendHex(nt, gHackNote[0]); HackAppendAscii(nt, " ");
        HackAppendHex(nt, gHackNote[1]); HackAppendAscii(nt, " ");
        HackAppendNumber(nt, gHackNote[2]);
        AddTextPrinterParameterized(&window, 0, nt, 0, 48, 0, NULL);
        String_Delete(nt);
    }
    if (gHackAllocFailHeap != 0xFFFF) {
        String *al = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(al, "alloc heap ");
        HackAppendNumber(al, gHackAllocFailHeap);
        HackAppendAscii(al, " size ");
        HackAppendNumber(al, gHackAllocFailSize);
        AddTextPrinterParameterized(&window, 0, al, 0, 48, 0, NULL);
        String_Delete(al);
    }
    if (gHackTexFailSize != 0) {
        String *tx = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(tx, "tex ");
        HackAppendNumber(tx, gHackTexFailSize);
        HackAppendAscii(tx, " at ");
        HackAppendHex(tx, gHackTexFailPtr);
        HackAppendAscii(tx, " n ");
        HackAppendNumber(tx, gHackTexFailEntries);
        AddTextPrinterParameterized(&window, 0, tx, 0, 64, 0, NULL);
        String_Delete(tx);
        tx = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(tx, "magic ");
        HackAppendAsciiN(tx, (const char *)&gHackTexFailMagic, 4);
        HackAppendAscii(tx, " file ");
        HackAppendAsciiN(tx, (const char *)&gHackTexFailFileMagic, 4);
        HackAppendAscii(tx, " ");
        HackAppendHex(tx, gHackTexFailMagic);
        AddTextPrinterParameterized(&window, 0, tx, 0, 80, 0, NULL);
        String_Delete(tx);
        tx = String_New(8, HEAP_ID_DEFAULT);
        AddTextPrinterParameterized(&window, 0, tx, 0, 64, 0, NULL);
        String_Delete(tx);
    }
    if (gHackNarcPath != NULL) {
        String *which = String_New(96, HEAP_ID_DEFAULT);
        HackAppendAscii(which, gHackNarcPath);
        String_AddChar(which, CHAR_SPACE);
        HackAppendNumber(which, gHackNarcIndex);
        AddTextPrinterParameterized(&window, 0, which, 0, 96, 0, NULL);
        String_Delete(which);
    }
#endif

    GfGfx_BothDispOn();
    SetMasterBrightnessNeutral(PM_LCD_TOP);
    SetMasterBrightnessNeutral(PM_LCD_BOTTOM);
    SetBlendBrightness(0, (GXBlendPlaneMask)(GX_BLEND_PLANEMASK_BD | GX_BLEND_PLANEMASK_OBJ | GX_BLEND_PLANEMASK_BG3 | GX_BLEND_PLANEMASK_BG2 | GX_BLEND_PLANEMASK_BG1 | GX_BLEND_PLANEMASK_BG0), SCREEN_MASK_MAIN | SCREEN_MASK_SUB);

    sub_02038D90();

    while (TRUE) {
        HandleDSLidAction();
        sub_02036144();

        if (sub_02039AA4()) {
            break;
        }

        OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    }

    while (TRUE) {
        HandleDSLidAction();

        if (PAD_Read() & PAD_BUTTON_A) {
            break;
        }

        OS_WaitIrq(TRUE, OS_IE_V_BLANK);
    }

    sub_0200FBF4(PM_LCD_TOP, RGB_WHITE);
    sub_0200FBF4(PM_LCD_BOTTOM, RGB_WHITE);

    RemoveWindow(&window);
    DestroyMsgData(error_msgdata);
    Heap_Free(bg_config);

    OS_ResetSystem(0);
}
