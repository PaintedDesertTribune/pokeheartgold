#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR205AR0101.h"
#include "msgdata/msg/msg_0929_SR205AR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR205AR0101_000
	ScrDef scr_seq_SR205AR0101_001
	ScrDefEnd

scr_seq_SR205AR0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0929_SR205AR0101_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0035
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0062
	End

_0035:
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE SEQ_ME_ASA
	WaitSE SEQ_ME_ASA
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	NPCMsg msg_0929_SR205AR0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0062:
	NPCMsg msg_0929_SR205AR0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR205AR0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0929_SR205AR0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
