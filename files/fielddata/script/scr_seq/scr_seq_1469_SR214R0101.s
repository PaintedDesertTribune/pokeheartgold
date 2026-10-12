#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR214R0101.h"
#include "msgdata/msg/msg_1081_SR214R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR214R0101_000
	ScrDefEnd

scr_seq_SR214R0101_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	// TODO Diamond ScrCmd_CountSeenUnown 0x284 args [16384]: no HeartGold mapping yet
	CompareVarToValue 0x4000, 26
	GoToIf 4, _002A
	NPCMsg msg_1081_SR214R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_002A:
	NPCMsg msg_1081_SR214R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
