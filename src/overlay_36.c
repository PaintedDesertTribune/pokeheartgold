#include "overlay_36.h"

#include "global.h"

#include "constants/easy_chat.h"
#include "constants/mail.h"
#include "constants/species.h"

#include "files/msgdata/msg.naix"
#include "files/msgdata/msg/msg_0292.h"
#include "files/msgdata/msg/msg_0293.h"
#include "files/msgdata/msg/msg_0445.h"
#include "files/msgdata/msg/msg_0254.h"

#include "hack_config.h"

#include "apricorn_tree.h"
#include "field_system.h"
#include "friend_group.h"
#include "heap.h"
#include "script_pokemon_util.h"
#include "constants/items.h"
#include "player_data.h"
#include "constants/moves.h"
#include "constants/maps.h"
#include "bag.h"
#include "location_backup.h"
#include "mail.h"
#include "main.h"
#include "math_util.h"
#include "msgdata.h"
#include "options.h"
#include "overlay_manager.h"
#include "party.h"
#include "pokemon.h"
#include "pokewalker.h"
#include "safari_zone.h"
#include "sav_system_info.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02018380.h"
#include "unk_0202C730.h"
#include "unk_0205B3DC.h"
#include "unk_02066EDC.h"
#include "unk_02091564.h"

#define HEAPID_OV36 (HEAP_ID_OV36)

extern const OverlayManagerTemplate gApplication_OakSpeech;

static BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OverlayManager *man, int *state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OverlayManager *man, int *state);
static BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OverlayManager *man, int *state);
static BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppInit(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppExec(OverlayManager *man, int *state);
static BOOL ov36_TitleScreen_NewGame_AppExit(OverlayManager *man, int *state);
static void InitGameStateAfterOakSpeech_Internal(enum HeapID heapID, SaveData *saveData, BOOL set_trainer_id);
static void Continue_LoadSaveData_HandleError(enum HeapID heapID, SaveData *saveData);
static void NewGame_InitSaveData(enum HeapID heapID, SaveData *saveData);

const OverlayManagerTemplate ov36_App_MainMenu_SelectOption_NewGame = {
    .init = ov36_TitleScreen_NewGame_AppInit,
    .exec = ov36_TitleScreen_NewGame_AppExec,
    .exit = ov36_TitleScreen_NewGame_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OverlayManagerTemplate ov36_App_InitGameState_AfterOakSpeech = {
    .init = ov36_App_InitGameState_AfterOakSpeech_AppInit,
    .exec = ov36_App_InitGameState_AfterOakSpeech_AppExec,
    .exit = ov36_App_InitGameState_AfterOakSpeech_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

const OverlayManagerTemplate ov36_App_MainMenu_SelectOption_Continue = {
    .init = ov36_App_MainMenu_SelectOption_Continue_AppInit,
    .exec = ov36_App_MainMenu_SelectOption_Continue_AppExec,
    .exit = ov36_App_MainMenu_SelectOption_Continue_AppExit,
    .ovy_id = FS_OVERLAY_ID_NONE,
};

static const MailMessageTemplate sMailMsgTemplates[2] = {
    {
     // ADVENTURE! EXCITED!
        .msg_bank = MAILMSG_BANK_0292_GMM,
     .msg_no = msg_0292_00004,
     .ec_groups = { EC_GROUP_LIFESTYLE, EC_GROUP_FEELINGS },
     .ec_words = { EC_WORD_LIFESTYLE_ADVENTURE - EC_WORDS_LIFESTYLE_MIN, EC_WORD_FEELINGS_EXCITED - EC_WORDS_FEELINGS_MIN },
     },
    {
     // I love POKEMON!
        .msg_bank = MAILMSG_BANK_0293_GMM,
     .msg_no = msg_0293_00001,
     .ec_groups = { EC_GROUP_UNION, 0xFF },
     .ec_words = { EC_WORD_UNION_POKEMON - EC_WORDS_UNION_MIN, 0 },
     },
};

BOOL ov36_TitleScreen_NewGame_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    Heap_Create(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_TitleScreen_NewGame_AppExec(OverlayManager *man, int *state) {
#pragma unused(state)
    SaveData *saveData = ((struct UnkStruct_02111868_sub *)OverlayManager_GetArgs(man))->saveData;
    NewGame_InitSaveData(HEAPID_OV36, saveData);

    return TRUE;
}

#if HACK_SKIP_INTRO
// Stand-in for the Oak speech: default name, gender and rival name, then straight to the field.
static void HackSkipIntro_SetDefaults(SaveData *saveData) {
    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    MsgData *names = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0445, HEAP_ID_3);
    MsgData *rivalNames = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0254, HEAP_ID_3);
    String *name = NewString_ReadMsgData(names, msg_0445_00000);
    String *rival = NewString_ReadMsgData(rivalNames, msg_0254_00041);

    PlayerName_StringToFlat(profile, name);
    PlayerProfile_SetTrainerGender(profile, PLAYER_GENDER_MALE);
    Save_Misc_RivalName_Set(Save_Misc_Get(saveData), rival);

    String_Delete(name);
    String_Delete(rival);
    DestroyMsgData(names);
    DestroyMsgData(rivalNames);
}

// A skipped intro means no starter: give a usable test team and bag so battles and the sailor can be tested.
static void HackSkipIntro_GiveTestTeam(SaveData *saveData) {
    static const u16 team[][2] = { { SPECIES_TYPHLOSION, 50 }, { SPECIES_FERALIGATR, 50 }, { SPECIES_AMPHAROS, 50 } };
    Bag *bag = Save_Bag_Get(saveData);
    int i;
    Party *party = SaveArray_Party_Get(saveData);
    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    for (i = 0; i < 3; i++) {
        GiveMon(HEAPID_OV36, saveData, team[i][0], team[i][1], 0, 0, ITEM_NONE, MAP_SINNOH_CANALAVE, 24);   // met-at map and encounter type, as ScrCmd_GiveMon passes them
    }
    // Field moves for getting around Sinnoh (Route 218 needs Surf), and every badge so the field moves are allowed.
    MonSetMoveInSlot(Party_GetMonByIndex(party, 1), MOVE_SURF, 0);
    MonSetMoveInSlot(Party_GetMonByIndex(party, 1), MOVE_WATERFALL, 1);
    MonSetMoveInSlot(Party_GetMonByIndex(party, 1), MOVE_WHIRLPOOL, 2);
    MonSetMoveInSlot(Party_GetMonByIndex(party, 0), MOVE_ROCK_SMASH, 0);
    MonSetMoveInSlot(Party_GetMonByIndex(party, 2), MOVE_FLY, 0);
    for (i = 0; i < 16; i++) {
        PlayerProfile_SetBadgeFlag(profile, i);
    }
    Bag_AddItem(bag, ITEM_MASTER_BALL, 2, HEAPID_OV36);
    Bag_AddItem(bag, ITEM_ULTRA_BALL, 20, HEAPID_OV36);
    Bag_AddItem(bag, ITEM_FULL_RESTORE, 20, HEAPID_OV36);
    Bag_AddItem(bag, ITEM_RARE_CANDY, 20, HEAPID_OV36);
    Bag_AddItem(bag, ITEM_MAX_REPEL, 20, HEAPID_OV36);
}
#endif

BOOL ov36_TitleScreen_NewGame_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
#if HACK_SKIP_INTRO
    HackSkipIntro_SetDefaults(((struct UnkStruct_02111868_sub *)OverlayManager_GetArgs(man))->saveData);
    Heap_Destroy(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID(OVY_36), &ov36_App_InitGameState_AfterOakSpeech);
#else
    Heap_Destroy(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_OakSpeech);
#endif

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    Heap_Create(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExec(OverlayManager *man, int *state) {
#pragma unused(state)
    struct UnkStruct_02111868_sub *unk_work = OverlayManager_GetArgs(man);
    SaveData *saveData = unk_work->saveData;
    InitGameStateAfterOakSpeech_Internal(HEAPID_OV36, saveData, TRUE);
#if HACK_SKIP_INTRO
    HackSkipIntro_GiveTestTeam(saveData);
#endif
    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_InitGameState_AfterOakSpeech_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    Heap_Destroy(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_NewGameFieldsys);

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppInit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    Heap_Create(HEAP_ID_3, HEAPID_OV36, 0x20000);
    InitializeMainRNG();

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExec(OverlayManager *man, int *state) {
    struct UnkStruct_02111868_sub *unk_work = OverlayManager_GetArgs(man);
    SaveData *saveData = unk_work->saveData;
    SysInfo *sys_info = Save_SysInfo_Get(saveData);

    Continue_LoadSaveData_HandleError(HEAPID_OV36, saveData);

    Options_SetButtonModeOnMain(saveData, 0);

    if (!Save_SysInfo_MacAddressIsMine(sys_info) || !Save_SysInfo_RTCOffsetIsMine(sys_info)) {
        SysInfoRTC_HandleContinueOnNewConsole(Save_SysInfo_RTC_Get(saveData));
        Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
        Save_SysInfo_InitFromSystem(sys_info);
        Party_ResetAllShayminToLandForm(SaveArray_Party_Get(saveData));
    }

    sub_0201838C(Save_PlayerData_GetIGTAddr(saveData));

    return TRUE;
}

BOOL ov36_App_MainMenu_SelectOption_Continue_AppExit(OverlayManager *man, int *state) {
#pragma unused(man, state)
    Heap_Destroy(HEAPID_OV36);
    RegisterMainOverlay(FS_OVERLAY_ID_NONE, &gApplication_ContinueFieldsys);

    return TRUE;
}

static void InitGameStateAfterOakSpeech_Internal(enum HeapID heapID, SaveData *saveData, BOOL set_trainer_id) {
#pragma unused(heapID)
    s32 i;
    MsgData *friend_names_msgdata;
    String *author_name;

    Save_SysInfo_InitFromSystem(Save_SysInfo_Get(saveData));
    Save_SysInfo_RTC_Init(Save_SysInfo_RTC_Get(saveData));
    Save_BerryPotRTC_Init(Save_BerryPotRTC_Get(saveData));
    sub_0202C7C0(Save_FriendGroup_Get(saveData), 1, MTRandom());
    sub_020674BC(saveData);

    PlayerProfile *profile = Save_PlayerData_GetProfile(saveData);
    u32 rand = MTRandom();

    if (set_trainer_id) {
        PlayerProfile_SetTrainerID(profile, rand);
    }

    SafariZone *safari_zone = Save_SafariZone_Get(saveData);
    SafariZone_ResetAreaSetToDefaultSet(safari_zone->area_sets, rand);

    PlayerProfile_SetAvatar(profile, UnionRoomAvatarIdxToSprite(rand, PlayerProfile_GetTrainerGender(profile), 0));

    sub_0202AE0C(Save_FieldApricornTrees_Get(saveData));

    u32 *pokewalker_unk = sub_02032728(Save_Pokewalker_Get(saveData));
    for (i = 0; i < 10; i++) {
        pokewalker_unk[i] = MTRandom();
    }

    // Put an email from your friend into your PC.
    friend_names_msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msg_0445, HEAP_ID_3);
    Mailbox *mailbox = Save_Mailbox_Get(saveData);
    Pokemon *mon = AllocMonZeroed(HEAP_ID_3);

    CreateMon(mon, SPECIES_MARILL, 1, 0, FALSE, 0, OT_ID_PLAYER_ID, 0);

    Mail *mail;
    if (PlayerProfile_GetTrainerGender(profile) == PLAYER_GENDER_MALE) {
        author_name = NewString_ReadMsgData(friend_names_msgdata, msg_0445_00001);
        mail = CreateKenyaMail(mon, MAIL_AIR, MON_FEMALE, author_name, 0);
    } else {
        author_name = NewString_ReadMsgData(friend_names_msgdata, msg_0445_00000);
        mail = CreateKenyaMail(mon, MAIL_AIR, MON_MALE, author_name, 0);
    }

    MailMessage mail_message;

    for (i = 0; i < (s32)NELEMS(sMailMsgTemplates); i++) {
        MailMsg_Init_FromTemplate(&mail_message, &sMailMsgTemplates[i]);
        Mail_SetMessage(mail, &mail_message, (u8)i);
    }

    MailMsg_Init(&mail_message);
    Mail_SetMessage(mail, &mail_message, 2);
    Mailbox_CopyMailToSlotI(mailbox->msgs, FALSE, 0, mail);

    Heap_Free(mon);
    String_Delete(author_name);
    Heap_Free(mail);
    DestroyMsgData(friend_names_msgdata);
}

static void Continue_LoadSaveData_HandleError(enum HeapID heapID, SaveData *saveData) {
#pragma unused(heapID)
    if (!SaveData_TryLoadOnContinue(saveData)) {
        OS_ResetSystem(0);
    }
}

static void NewGame_InitSaveData(enum HeapID heapID, SaveData *saveData) {
#pragma unused(heapID)
    Save_InitDynamicRegion(saveData);
    Save_SetPositionToPlayerRoom(saveData);

    PlayerProfile_SetMoney(Save_PlayerData_GetProfile(saveData), 3000);

    Save_VarsFlags_SetFishingCompetitionLengthRecord(Save_VarsFlags_Get(saveData), 56150); // 3'6"

    SetFlag960(Save_VarsFlags_Get(saveData));
}
