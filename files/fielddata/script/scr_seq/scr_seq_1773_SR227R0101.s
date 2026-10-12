#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR227R0101.h"
#include "msgdata/msg/msg_1233_SR227R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR227R0101_000
	ScrDefEnd

scr_seq_SR227R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1233_SR227R0101_00000
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0031
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0079
	End

_0031:
	NPCMsg msg_1233_SR227R0101_00001
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE 1166
	WaitSE 1166
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	NPCMsg msg_1233_SR227R0101_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0031
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0079
	End

_0079:
	NPCMsg msg_1233_SR227R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
