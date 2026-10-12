#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0401.h"
#include "msgdata/msg/msg_0963_SC04R0401.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0401_000
	ScrDef scr_seq_SC04R0401_001
	ScrDef scr_seq_SC04R0401_002
	ScrDef scr_seq_SC04R0401_003
	ScrDefEnd

scr_seq_SC04R0401_000:
	CheckFlag FLAG_SINNOH_267
	CallIf 1, _0027
	HasItem 450, 1, VAR_SINNOH_40EC
	End

_0027:
	SetFlag FLAG_SINNOH_576
	Return

scr_seq_SC04R0401_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0963_SC04R0401_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0401_002:
	LockAll
	ApplyMovement 1, mv_SC04R0401_0060
	WaitMovement
	NPCMsg msg_0963_SC04R0401_00001
	CloseMsg
	ApplyMovement obj_player, mv_SC04R0401_0068
	WaitMovement
	ReleaseAll
	End

scr_seq_SC04R0401_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_267
	GoToIf 1, _0104
	BufferPlayersName 0
	BufferFriendsName 1
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _00A0
	GoTo _00A9

_00A0:
	NPCMsg msg_0963_SC04R0401_00003
	GoTo _00B2

_00A9:
	NPCMsg msg_0963_SC04R0401_00004
	GoTo _00B2

_00B2:
	// TODO Diamond ScrCmd_CountNationalDexSeen 0x120 args [32772]: no HeartGold mapping yet
	BufferInt 1, 0x8004
	CompareVarToValue 0x8004, 35
	GoToIf 0, _010F
	NPCMsg msg_0963_SC04R0401_00005
	SetVar 0x8004, 216
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00FA
	SetFlag FLAG_SINNOH_267
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_00FA:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0104:
	NPCMsg msg_0963_SC04R0401_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010F:
	NPCMsg msg_0963_SC04R0401_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC04R0401_0060:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC04R0401_0068:
	.short 12, 1
	EndMovement


	.balign 4, 0
