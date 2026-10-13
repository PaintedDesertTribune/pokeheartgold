// Sinnoh port: stand-in for Diamond's SpearPillarSequence (ScrCmd 0x20D). Diamond drives a multi-stage 3D cutscene
// (Red Chain, Dialga descending) through operations 1-9 and the script branches on operation 1's answer. HeartGold has
// none of those models, so operation 1 answers "play it" and the visual stages are short rumbles; the scripted part of
// the scene (messages, movement, battles) runs as translated. The real two-dragon scene is a design task (Build
// Manual: Dialga and Palkia both appear, the lake spirits break the chain, Cyrus walks into the tear).
#include "global.h"

#include "constants/sndseq.h"

#include "scrcmd.h"
#include "script.h"
#include "unk_02005D10.h"

BOOL ScrCmd_SinnohSpearPillarSequence(ScriptContext *ctx) {
    u8 operation = ScriptReadByte(ctx);
    u16 *var = ScriptGetVarPointer(ctx);
    switch (operation) {
    case 1:
        *var = 1;   // the scene may play
        break;
    default:
        PlaySE(SEQ_SE_DP_W060C);   // a tremor where Diamond would animate the pillar
        *var = 0;
        break;
    }
    return TRUE;
}
