#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR216R0101.h"
#include "msgdata/msg/msg_1133_SR216R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR216R0101_000
	ScrDef scr_seq_SR216R0101_001
	ScrDef scr_seq_SR216R0101_002
	ScrDefEnd

scr_seq_SR216R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1133_SR216R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR216R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1133_SR216R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR216R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1133_SR216R0101_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _005D
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0093
	End

_005D:
	BufferPlayersName 0
	NPCMsg msg_1133_SR216R0101_00003
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE SEQ_ME_ASA
	WaitSE SEQ_ME_ASA
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	BufferPlayersName 0
	NPCMsg msg_1133_SR216R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0093:
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
