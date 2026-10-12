#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR213R0301.h"
#include "msgdata/msg/msg_1090_SR213R0301.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR213R0301_000
	ScrDef scr_seq_SR213R0301_001
	ScrDef scr_seq_SR213R0301_002
	ScrDefEnd

scr_seq_SR213R0301_000:
	End

scr_seq_SR213R0301_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1090_SR213R0301_00000
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE 1166
	WaitSE 1166
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	NPCMsg msg_1090_SR213R0301_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR213R0301_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1090_SR213R0301_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
