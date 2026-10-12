#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR212AR0102.h"
#include "msgdata/msg/msg_1118_SR212AR0102.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR212AR0102_000
	ScrDef scr_seq_SR212AR0102_001
	ScrDefEnd

scr_seq_SR212AR0102_000:
	PlayFanfare 1500
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
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_004F:
	CallStd 2017 /* TODO Diamond std script */
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
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1118_SR212AR0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
