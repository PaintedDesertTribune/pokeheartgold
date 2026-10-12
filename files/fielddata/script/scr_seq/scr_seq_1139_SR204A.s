#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR204A.h"
#include "msgdata/msg/msg_0916_SR204A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR204A_000
	ScrDef scr_seq_SR204A_001
	ScrDef scr_seq_SR204A_002
	ScrDefEnd

scr_seq_SR204A_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0916_SR204A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR204A_001:
	DirectionSignpost msg_0916_SR204A_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR204A_002:
	DirectionSignpost msg_0916_SR204A_00002, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


	.balign 4, 0
