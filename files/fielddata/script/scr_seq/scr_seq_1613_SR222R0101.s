#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR222R0101.h"
#include "msgdata/msg/msg_1153_SR222R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR222R0101_000
	ScrDef scr_seq_SR222R0101_001
	ScrDef scr_seq_SR222R0101_002
	ScrDef scr_seq_SR222R0101_003
	ScrDef scr_seq_SR222R0101_004
	ScrDef scr_seq_SR222R0101_005
	ScrDef scr_seq_SR222R0101_006
	ScrDefEnd

scr_seq_SR222R0101_000:
	SetFlag FLAG_SINNOH_2543
	End

scr_seq_SR222R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1153_SR222R0101_00000
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222R0101_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1153_SR222R0101_00001
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222R0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1153_SR222R0101_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222R0101_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1153_SR222R0101_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222R0101_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	WaitSE SEQ_SE_DP_SELECT
	PlayCry 25, 0
	NPCMsg msg_1153_SR222R0101_00004
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR222R0101_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1153_SR222R0101_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
