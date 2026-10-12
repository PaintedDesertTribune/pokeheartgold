#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR228R0101.h"
#include "msgdata/msg/msg_1241_SR228R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR228R0101_000
	ScrDef scr_seq_SR228R0101_001
	ScrDefEnd

scr_seq_SR228R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1241_SR228R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR228R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1241_SR228R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
