#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04PC0101.h"
#include "msgdata/msg/msg_0948_SC04PC0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04PC0101_000
	ScrDef scr_seq_SC04PC0101_001
	ScrDef scr_seq_SC04PC0101_002
	ScrDef scr_seq_SC04PC0101_003
	ScrDef scr_seq_SC04PC0101_004
	ScrDef scr_seq_SC04PC0101_005
	ScrDefEnd

scr_seq_SC04PC0101_000:
	SetVar 0x8007, 3
	CallStd std_nurse_joy
	End

scr_seq_SC04PC0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0948_SC04PC0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04PC0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0948_SC04PC0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04PC0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_129
	GoToIf 1, _006A
	NPCMsg msg_0948_SC04PC0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_006A:
	NPCMsg msg_0948_SC04PC0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04PC0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 427, 0
	NPCMsg msg_0948_SC04PC0101_00004
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04PC0101_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue 0x4000, 1
	GoToIf 1, _010B
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00F0
	GetPartyLead 0x8000
	BufferSpeciesName 0, 0x8000, 0, 0
	NPCMsg msg_0948_SC04PC0101_00007
	MonGetFriendship 0x800C, 0x8000
	CompareVarToValue 0x800C, 120
	GoToIf 4, _0116
	CompareVarToValue 0x800C, 70
	GoToIf 4, _0121
	GoTo _012C

_00F0:
	NPCMsg msg_0948_SC04PC0101_00005
	SetVar 0x4000, 1
	SetVar 0x8004, 5
	// Diamond std call dropped: Pokétch coupon (Pokétch dropped, decision 16)
	WaitButton
	CloseMsg
	ReleaseAll
	End

_010B:
	NPCMsg msg_0948_SC04PC0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0116:
	NPCMsg msg_0948_SC04PC0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0121:
	NPCMsg msg_0948_SC04PC0101_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_012C:
	NPCMsg msg_0948_SC04PC0101_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
