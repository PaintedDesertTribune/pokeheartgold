#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR225R0101.h"
#include "msgdata/msg/msg_1222_SR225R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR225R0101_000
	ScrDefEnd

scr_seq_SR225R0101_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_217
	GoToIf 1, _004B
	NPCMsg msg_1222_SR225R0101_00000
	SetVar 0x8004, 30
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0056
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_217
	GoTo _004B

_004B:
	NPCMsg msg_1222_SR225R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0056:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
