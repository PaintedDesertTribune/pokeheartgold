#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR217.h"
#include "msgdata/msg/msg_1134_SR217.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR217_000
	ScrDef scr_seq_SR217_001
	ScrDef scr_seq_SR217_002
	ScrDef scr_seq_SR217_003
	ScrDef scr_seq_SR217_004
	ScrDef scr_seq_SR217_005
	ScrDefEnd

scr_seq_SR217_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_1134_SR217_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR217_001:
	DirectionSignpost msg_1134_SR217_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR217_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1134_SR217_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR217_003:
	SetVar VAR_SPECIAL_x8008, 427
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR217_004:
	SetVar VAR_SPECIAL_x8008, 47
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SR217_005:
	SetVar VAR_SPECIAL_x8008, 334
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
