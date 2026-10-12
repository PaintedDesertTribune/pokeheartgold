#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SR212AR0101.h"
#include "msgdata/msg/msg_1116_SR212AR0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SR212AR0101_000
	ScrDef scr_seq_SR212AR0101_001
	ScrDef scr_seq_SR212AR0101_002
	ScrDef scr_seq_SR212AR0101_003
	ScrDef scr_seq_SR212AR0101_004
	ScrDef scr_seq_SR212AR0101_005
	ScrDef scr_seq_SR212AR0101_006
	ScrDefEnd

scr_seq_SR212AR0101_000:
	SetFlag FLAG_SINNOH_2539
	End

scr_seq_SR212AR0101_001:
	End

scr_seq_SR212AR0101_002:
	End

scr_seq_SR212AR0101_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1116_SR212AR0101_00000
	WaitButton
	CloseMsg
	ApplyMovement 0, mv_SR212AR0101_009C
	WaitMovement
	ReleaseAll
	End

scr_seq_SR212AR0101_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1116_SR212AR0101_00001
	WaitButton
	CloseMsg
	ApplyMovement 1, mv_SR212AR0101_00A4
	WaitMovement
	ReleaseAll
	End

scr_seq_SR212AR0101_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1116_SR212AR0101_00002
	WaitButton
	CloseMsg
	ApplyMovement 2, mv_SR212AR0101_00AC
	WaitMovement
	ReleaseAll
	End

scr_seq_SR212AR0101_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1116_SR212AR0101_00003
	WaitButton
	CloseMsg
	ApplyMovement 3, mv_SR212AR0101_00B4
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
mv_SR212AR0101_009C:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SR212AR0101_00A4:
	.short 1, 1
	EndMovement

	.balign 4, 0
mv_SR212AR0101_00AC:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SR212AR0101_00B4:
	.short 2, 1
	EndMovement

	.balign 4, 0
