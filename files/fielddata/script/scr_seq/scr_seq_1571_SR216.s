#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR216.h"
#include "msgdata/msg/msg_1132_SR216.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR216_000
	ScrDef scr_seq_SR216_001
	ScrDef scr_seq_SR216_002
	ScrDefEnd

scr_seq_SR216_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1132_SR216_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR216_001:
	DirectionSignpost msg_1132_SR216_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR216_002:
	DirectionSignpost msg_1132_SR216_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
