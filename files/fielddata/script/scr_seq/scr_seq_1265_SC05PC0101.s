#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC05PC0101.h"
#include "msgdata/msg/msg_0979_SC05PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC05PC0101_000
	ScrDef scr_seq_SC05PC0101_001
	ScrDef scr_seq_SC05PC0101_002
	ScrDef scr_seq_SC05PC0101_003
	ScrDefEnd

scr_seq_SC05PC0101_000:
	SetVar 0x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_SC05PC0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0979_SC05PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05PC0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0979_SC05PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC05PC0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_165
	GoToIf 1, _0062
	NPCMsg msg_0979_SC05PC0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0062:
	NPCMsg msg_0979_SC05PC0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
