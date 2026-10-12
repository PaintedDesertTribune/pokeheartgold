#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR210AR0101.h"
#include "msgdata/msg/msg_1043_SR210AR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR210AR0101_000
	ScrDef scr_seq_SR210AR0101_001
	ScrDef scr_seq_SR210AR0101_002
	ScrDef scr_seq_SR210AR0101_003
	ScrDefEnd

scr_seq_SR210AR0101_000:
	SetFlag FLAG_SINNOH_2537
	End

scr_seq_SR210AR0101_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1043_SR210AR0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SR210AR0101_002:
	PlayFanfare 1500
	LockAll
	FacePlayer
	ShowMoneyBox 20, 2
	NPCMsg msg_1043_SR210AR0101_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _00B4
	HasEnoughMoneyImmediate 0x800C, 500
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A7
	SetVar 0x8004, 33
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _009A
	SubMoneyImmediate 500
	UpdateMoneyBox
	NPCMsg msg_1043_SR210AR0101_00002
	CallStd std_give_item_verbose
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_009A:
	NPCMsg msg_1043_SR210AR0101_00003
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_00A7:
	NPCMsg msg_1043_SR210AR0101_00004
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

_00B4:
	NPCMsg msg_1043_SR210AR0101_00005
	WaitButton
	CloseMsg
	HideMoneyBox
	ReleaseAll
	End

scr_seq_SR210AR0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_263
	GoToIf 1, _00DF
	NPCMsg msg_1043_SR210AR0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00DF:
	NPCMsg msg_1043_SR210AR0101_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End



	.balign 4, 0
