#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_T04R0501.h"
#include "msgdata/msg/msg_1022_T04R0501.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_T04R0501_000
	ScrDef scr_seq_T04R0501_001
	ScrDefEnd

scr_seq_T04R0501_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_279
	GoToIf 0, _00FC
	CheckFlag FLAG_SINNOH_1
	CallIf 0, _00F4
	GetPartyLead 0x8004
	GetPartyMonSpecies 0x8004, 0x8005
	// TODO unknown Diamond command cmd_8005 (0x8005); script truncated here
	End

_00F4:
	SetVar 0x4000, 65535
	Return

_00FC:
	NPCMsg msg_1022_T04R0501_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T04R0501_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_279
	GoToIf 1, _013C
	NPCMsg msg_1022_T04R0501_00005
	SetVar 0x8004, 434
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_279
	NPCMsg msg_1022_T04R0501_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013C:
	NPCMsg msg_1022_T04R0501_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
