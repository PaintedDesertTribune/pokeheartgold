#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR212AR0102.h"
#include "msgdata/msg/msg_1118_SR212AR0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR212AR0102_000
	ScrDef scr_seq_SR212AR0102_001
	ScrDef scr_seq_SR212AR0102_002
	ScrDefEnd

scr_seq_SR212AR0102_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_313
	GoToIf 1, _0059
	NPCMsg msg_1118_SR212AR0102_00000
	SetVar 0x8004, 218
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _004F
	SetFlag FLAG_SINNOH_313
	CallStd std_give_item_verbose
	CloseMsg
	ReleaseAll
	End

_004F:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0059:
	NPCMsg msg_1118_SR212AR0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR212AR0102_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_1118_SR212AR0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


scr_seq_SR212AR0102_002:
	SetVar VAR_SPECIAL_x8008, 3
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
