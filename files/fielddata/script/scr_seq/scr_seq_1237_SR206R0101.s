#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR206R0101.h"
#include "msgdata/msg/msg_0965_SR206R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR206R0101_000
	ScrDef scr_seq_SR206R0101_001
	ScrDef scr_seq_SR206R0101_002
	ScrDef scr_seq_SR206R0101_003
	ScrDefEnd

scr_seq_SR206R0101_000:
	HasItem 450, 1, VAR_SINNOH_40EC
	End

scr_seq_SR206R0101_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0965_SR206R0101_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR206R0101_002:
	LockAll
	ApplyMovement 0, mv_SR206R0101_0050
	WaitMovement
	NPCMsg msg_0965_SR206R0101_00001
	CloseMsg
	ApplyMovement obj_player, mv_SR206R0101_0058
	WaitMovement
	ReleaseAll
	End

scr_seq_SR206R0101_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_299
	GoToIf 1, _0095
	SetVar 0x8004, 96
	// Diamond ScrCmd_GetFashionName dropped: Contest dress-up dropped (decision 16)
	NPCMsg msg_0965_SR206R0101_00003
	SetVar 0x8005, 1
	// Diamond std call dropped: Contest accessory gift (dress-up dropped, decision 16)
	SetFlag FLAG_SINNOH_299
	CloseMsg
	ReleaseAll
	End

_0095:
	NPCMsg msg_0965_SR206R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SR206R0101_0050:
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SR206R0101_0058:
	.short 13, 1
	EndMovement


	.balign 4, 0
