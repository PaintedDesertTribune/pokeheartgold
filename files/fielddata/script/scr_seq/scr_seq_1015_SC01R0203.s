#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0203.h"
#include "msgdata/msg/msg_0854_SC01R0203.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0203_000
	ScrDef scr_seq_SC01R0203_001
	ScrDef scr_seq_SC01R0203_002
	ScrDef scr_seq_SC01R0203_003
	ScrDefEnd

scr_seq_SC01R0203_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0854_SC01R0203_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0203_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0854_SC01R0203_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0203_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0854_SC01R0203_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0203_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0854_SC01R0203_00003
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _006D
	GoTo _012C

_006D:
	FadeScreen 6, 1, 0, 0
	WaitFade
	CloseMsg
	// TODO Diamond ScrCmd_Unk0244 0x244 args [0, 32780, 32768, 32769]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _012C
	NPCMsg msg_0854_SC01R0203_00004
	FadeScreen 6, 1, 0, 0
	WaitFade
	CloseMsg
	// TODO Diamond ScrCmd_Unk0244 0x244 args [0, 32780, 32770, 32771]: no HeartGold mapping yet
	RestoreOverworld
	FadeScreen 6, 1, 1, 0
	WaitFade
	CompareVarToValue 0x800C, 0
	GoToIf 1, _012C
	// Diamond ScrCmd_GiveWallpaper dropped: PC wallpaper gift; HeartGold command unknown
	CompareVarToValue 0x800C, 255
	GoToIf 1, _0102
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0102
	GoTo _0137

_0102:
	// Diamond ScrCmd_CompareMysteryGiftEasyChatInput dropped: Mystery Gift is HeartGold's own
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0121
	GoTo _0142

_0121:
	NPCMsg msg_0854_SC01R0203_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012C:
	NPCMsg msg_0854_SC01R0203_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0137:
	NPCMsg msg_0854_SC01R0203_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0142:
	NPCMsg msg_0854_SC01R0203_00008
	WaitButton
	// Diamond ScrCmd_ActivateMysteryGift dropped: Mystery Gift is HeartGold's own
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
