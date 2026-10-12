#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0102.h"
#include "msgdata/msg/msg_0884_ST01R0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0102_000
	ScrDef scr_seq_ST01R0102_001
	ScrDef scr_seq_ST01R0102_002
	ScrDefEnd

scr_seq_ST01R0102_000:
	LockAll
	BufferRivalsName 0
	NPCMsg msg_0884_ST01R0102_00000
	CloseMsg
	ApplyMovement 0, mv_ST01R0102_0060
	WaitMovement
	CallStd std_play_rival_intro_music
	BufferPlayersName 0
	NPCMsg msg_0884_ST01R0102_00001
	CloseMsg
	ApplyMovement 0, mv_ST01R0102_006C
	ApplyMovement obj_player, mv_ST01R0102_0084
	WaitMovement
	PlayFanfare 1539
	HidePerson 0
	CallStd std_sinnoh_default_bgm
	SetFlag FLAG_SINNOH_234
	SetVar VAR_SINNOH_40A3, 1
	SetVar VAR_SINNOH_4070, 2
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST01R0102_001:
	PlayFanfare 1500
	LockAll
	NPCMsg msg_0884_ST01R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0102_002:
	PlayFanfare 1500
	LockAll
	BufferPlayersName 0
	NPCMsg msg_0884_ST01R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST01R0102_0060:
	.short 34, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_ST01R0102_006C:
	.short 18, 4
	.short 16, 1
	.short 18, 2
	.short 38, 1
	.short 69, 1
	EndMovement

	.balign 4, 0
mv_ST01R0102_0084:
	.short 63, 2
	.short 13, 1
	.short 32, 1
	EndMovement


	.balign 4, 0
