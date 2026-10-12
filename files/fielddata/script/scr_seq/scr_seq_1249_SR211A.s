#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR211A.h"
#include "msgdata/msg/msg_0971_SR211A.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR211A_000
	ScrDef scr_seq_SR211A_001
	ScrDef scr_seq_SR211A_002
	ScrDef scr_seq_SR211A_003
	ScrDefEnd

scr_seq_SR211A_000:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0971_SR211A_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR211A_001:
	DirectionSignpost msg_0971_SR211A_00001, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SR211A_002:
	DirectionSignpost msg_0971_SR211A_00002, 1, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End


scr_seq_SR211A_003:
	SetVar VAR_SPECIAL_x8008, 339
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
