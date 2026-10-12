#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_ST01R0201.h"
#include "msgdata/msg/msg_0885_ST01R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_ST01R0201_000
	ScrDef scr_seq_ST01R0201_001
	ScrDef scr_seq_ST01R0201_002
	ScrDef scr_seq_ST01R0201_003
	ScrDef scr_seq_ST01R0201_004
	ScrDef scr_seq_ST01R0201_005
	ScrDef scr_seq_ST01R0201_006
	ScrDef scr_seq_ST01R0201_007
	ScrDef scr_seq_ST01R0201_008
	ScrDef scr_seq_ST01R0201_009
	ScrDef scr_seq_ST01R0201_010
	ScrDefEnd

scr_seq_ST01R0201_000:
	CompareVarToValue VAR_SINNOH_40A4, 3
	CallIf 1, _0048
	CheckFlag FLAG_SINNOH_143
	CallIf 1, _005E
	End

_0048:
	MovePerson 0, 2, 4
	SetObjectFacing 0, 0
	SetObjectMovementType 0, 14
	Return

_005E:
	SetFlag FLAG_SINNOH_527
	Return

scr_seq_ST01R0201_001:
	LockAll
	ApplyMovement obj_player, mv_ST01R0201_00A4
	ApplyMovement 0, mv_ST01R0201_00B0
	WaitMovement
	SetFlag FLAG_SINNOH_135
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0885_ST01R0201_00000
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 0, mv_ST01R0201_00CC
	WaitMovement
	SetVar VAR_SINNOH_40A4, 1
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST01R0201_010:
	LockAll
	SetVar VAR_SINNOH_410F, 2
	CheckFlag FLAG_SINNOH_348
	GoToIf 1, _014B
	CheckFlag FLAG_SINNOH_349
	GoToIf 0, _0110
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _014B

_0110:
	ApplyMovement obj_player, mv_ST01R0201_0164
	ApplyMovement 0, mv_ST01R0201_0170
	WaitMovement
	BufferPlayersName 0
	BufferRivalsName 1
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	CallIf 1, _014F
	CompareVarToValue 0x800C, 0
	CallIf 1, _0158
	WaitButton
	CloseMsg

_014B:
	ReleaseAll
	ReleaseAll
	End

_014F:
	SetFlag FLAG_SINNOH_348
	NPCMsg msg_0885_ST01R0201_00035
	Return

_0158:
	SetFlag FLAG_SINNOH_349
	NPCMsg msg_0885_ST01R0201_00036
	Return

scr_seq_ST01R0201_002:
	LockAll
	Wait 30, 0x800C
	ApplyMovement 0, mv_ST01R0201_01D4
	ApplyMovement obj_player, mv_ST01R0201_01F8
	WaitMovement
	Wait 30, 0x800C
	BufferRivalsName 0
	BufferPlayersName 1
	NPCMsg msg_0885_ST01R0201_00006
	CloseMsg
	Wait 30, 0x800C
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00007
	// TODO Diamond ScrCmd_GiveRunningShoes 0x15a args []: no HeartGold mapping yet
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00008
	PlaySE SEQ_ME_ITEM
	WaitSE SEQ_ME_ITEM
	NPCMsg msg_0885_ST01R0201_00009
	WaitButton
	CloseMsg
	SetVar VAR_SINNOH_40A4, 4
	ReleaseAll
	ReleaseAll
	End

scr_seq_ST01R0201_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40A4, 7
	GoToIf 4, _06D4
	CompareVarToValue VAR_SINNOH_40A4, 6
	GoToIf 1, _02A4
	CheckFlag FLAG_SINNOH_144
	GoToIf 1, _02B2
	CompareVarToValue VAR_SINNOH_40A4, 5
	GoToIf 4, _06CA
	CompareVarToValue VAR_SINNOH_40A4, 4
	GoToIf 4, _0653
	CheckFlag FLAG_SINNOH_248
	GoToIf 1, _069C
	CompareVarToValue VAR_SINNOH_40A4, 2
	GoToIf 4, _06AA
	CheckFlag FLAG_SINNOH_135
	GoToIf 1, _06BC
	SetFlag FLAG_SINNOH_135
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0885_ST01R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02A4:
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02B2:
	Call _05CE
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00015
	SetVar 0x8004, 433
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	// TODO Diamond ScrCmd_Unk01CC 0x1cc args []: no HeartGold mapping yet
	NPCMsg msg_0885_ST01R0201_00016
	GetPlayerFacing 0x8007
	CompareVarToValue 0x8007, 1
	GoToIf 1, _02EC
	GoTo _02FE

_02EC:
	ApplyMovement 0, mv_ST01R0201_06E0
	WaitMovement
	GoTo _0310

_02FE:
	ApplyMovement 0, mv_ST01R0201_06E8
	WaitMovement
	GoTo _0310

_0310:
	NPCMsg msg_0885_ST01R0201_00017
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00018
	CloseMsg
	PlayFanfare SEQ_SE_DP_DOOR_OPEN
	ClearFlag FLAG_SINNOH_527
	ShowPerson 1
	WaitSE SEQ_SE_DP_DOOR_OPEN
	ApplyMovement 0, mv_ST01R0201_06F8
	ApplyMovement obj_player, mv_ST01R0201_07A8
	WaitMovement
	ApplyMovement 1, mv_ST01R0201_0740
	WaitMovement
	CompareVarToValue 0x8007, 0
	CallIf 1, _03AB
	BufferRivalsName 1
	NPCMsg msg_0885_ST01R0201_00019
	ApplyMovement 0, mv_ST01R0201_0704
	WaitMovement
	NPCMsg msg_0885_ST01R0201_00020
	BufferRivalsName 1
	NPCMsg msg_0885_ST01R0201_00021
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00022
	CompareVarToValue 0x8007, 0
	GoToIf 1, _03B7
	CompareVarToValue 0x8007, 1
	GoToIf 1, _03D1
	CompareVarToValue 0x8007, 2
	GoToIf 1, _03EB
	CompareVarToValue 0x8007, 3
	GoToIf 1, _0405
	End

_03AB:
	ApplyMovement obj_player, mv_ST01R0201_07B0
	WaitMovement
	Return

_03B7:
	ApplyMovement 0, mv_ST01R0201_070C
	ApplyMovement obj_player, mv_ST01R0201_07B8
	WaitMovement
	GoTo _041F

_03D1:
	ApplyMovement 0, mv_ST01R0201_0714
	ApplyMovement obj_player, mv_ST01R0201_07C0
	WaitMovement
	GoTo _041F

_03EB:
	ApplyMovement 0, mv_ST01R0201_071C
	ApplyMovement obj_player, mv_ST01R0201_07C8
	WaitMovement
	GoTo _041F

_0405:
	ApplyMovement 0, mv_ST01R0201_0724
	ApplyMovement obj_player, mv_ST01R0201_07D0
	WaitMovement
	GoTo _041F

_041F:
	NPCMsg msg_0885_ST01R0201_00023
	CloseMsg
	CompareVarToValue 0x8007, 0
	GoToIf 1, _045A
	CompareVarToValue 0x8007, 1
	GoToIf 1, _0474
	CompareVarToValue 0x8007, 2
	GoToIf 1, _048E
	CompareVarToValue 0x8007, 3
	GoToIf 1, _04A8
	End

_045A:
	ApplyMovement 1, mv_ST01R0201_074C
	ApplyMovement obj_player, mv_ST01R0201_07D8
	WaitMovement
	GoTo _04C2

_0474:
	ApplyMovement 1, mv_ST01R0201_0754
	ApplyMovement obj_player, mv_ST01R0201_07E0
	WaitMovement
	GoTo _04C2

_048E:
	ApplyMovement 1, mv_ST01R0201_0760
	ApplyMovement obj_player, mv_ST01R0201_07EC
	WaitMovement
	GoTo _04C2

_04A8:
	ApplyMovement 1, mv_ST01R0201_076C
	ApplyMovement obj_player, mv_ST01R0201_07F8
	WaitMovement
	GoTo _04C2

_04C2:
	BufferPlayersName 0
	BufferRivalsName 1
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _04E1
	GoTo _04EC

_04E1:
	NPCMsg msg_0885_ST01R0201_00024
	GoTo _04F7

_04EC:
	NPCMsg msg_0885_ST01R0201_00025
	GoTo _04F7

_04F7:
	SetVar 0x8004, 459
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_143
	NPCMsg msg_0885_ST01R0201_00027
	BufferRivalsName 1
	NPCMsg msg_0885_ST01R0201_00026
	CloseMsg
	CompareVarToValue 0x8007, 0
	GoToIf 1, _054C
	CompareVarToValue 0x8007, 1
	GoToIf 1, _0566
	CompareVarToValue 0x8007, 2
	GoToIf 1, _0588
	CompareVarToValue 0x8007, 3
	GoToIf 1, _05A2
	End

_054C:
	ApplyMovement 1, mv_ST01R0201_0774
	ApplyMovement obj_player, mv_ST01R0201_0800
	WaitMovement
	GoTo _05BC

_0566:
	ApplyMovement 1, mv_ST01R0201_0780
	ApplyMovement obj_player, mv_ST01R0201_0808
	ApplyMovement 0, mv_ST01R0201_072C
	WaitMovement
	GoTo _05BC

_0588:
	ApplyMovement 1, mv_ST01R0201_078C
	ApplyMovement 0, mv_ST01R0201_0738
	WaitMovement
	GoTo _05BC

_05A2:
	ApplyMovement 1, mv_ST01R0201_079C
	ApplyMovement obj_player, mv_ST01R0201_081C
	WaitMovement
	GoTo _05BC

_05BC:
	PlayFanfare SEQ_SE_DP_KAIDAN2
	HidePerson 1
	SetVar VAR_SINNOH_40A4, 6
	ReleaseAll
	End

_05CE:
	BufferPlayersName 0
	SetVar 0x800C, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x800C, 0
	CallIf 1, _063A
	CompareVarToValue 0x800C, 1
	CallIf 1, _063F
	CompareVarToValue 0x800C, 2
	CallIf 1, _0644
	CompareVarToValue 0x800C, 3
	CallIf 1, _0649
	CompareVarToValue 0x800C, 4
	CallIf 1, _064E
	CloseMsg
	FadeScreen 6, 1, 0, 0
	WaitFade
	PlaySE SEQ_ME_ASA
	WaitSE SEQ_ME_ASA
	HealParty
	FadeScreen 6, 1, 1, 0
	WaitFade
	Return

_063A:
	NPCMsg msg_0885_ST01R0201_00011
	Return

_063F:
	NPCMsg msg_0885_ST01R0201_00012
	Return

_0644:
	NPCMsg msg_0885_ST01R0201_00012
	Return

_0649:
	NPCMsg msg_0885_ST01R0201_00013
	Return

_064E:
	NPCMsg msg_0885_ST01R0201_00014
	Return

_0653:
	NPCMsg msg_0885_ST01R0201_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_069C:
	BufferRivalsName 0
	NPCMsg msg_0885_ST01R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06AA:
	SetFlag FLAG_SINNOH_248
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06BC:
	BufferRivalsName 0
	NPCMsg msg_0885_ST01R0201_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06CA:
	Call _05CE
	ReleaseAll
	End

_06D4:
	Call _05CE
	ReleaseAll
	End

scr_seq_ST01R0201_004:
	LockAll
	GoTo _082E

_082E:
	ApplyMovement obj_player, mv_ST01R0201_085C
	ApplyMovement 0, mv_ST01R0201_0874
	WaitMovement
	GoTo _0848

_0848:
	SetVar VAR_SINNOH_40A4, 2
	BufferPlayersName 0
	NPCMsg msg_0885_ST01R0201_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0201_005:
	BufferRivalsName 1
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0885_ST01R0201_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0201_006:
	SetVar 0x800C, 1   // Diamond ScrCmd_GetTimeOfDay: result fixed
	CompareVarToValue 0x800C, 0
	GoToIf 1, _08E9
	CompareVarToValue 0x800C, 1
	GoToIf 1, _08FA
	CompareVarToValue 0x800C, 2
	GoToIf 1, _08FA
	CompareVarToValue 0x800C, 3
	GoToIf 1, _090B
	CompareVarToValue 0x800C, 4
	GoToIf 1, _090B
	End

_08E9:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_08FA:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

_090B:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0201_007:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0201_008:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_ST01R0201_009:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0885_ST01R0201_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_ST01R0201_00A4:
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_00B0:
	.short 32, 1
	.short 75, 1
	.short 63, 1
	.short 12, 1
	.short 15, 3
	.short 12, 3
	EndMovement

	.balign 4, 0
mv_ST01R0201_00CC:
	.short 13, 2
	.short 14, 3
	.short 13, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0164:
	.short 62, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0170:
	.short 32, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_01D4:
	.short 14, 1
	.short 0, 1
	.short 63, 2
	.short 15, 3
	.short 13, 2
	.short 15, 3
	.short 13, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_01F8:
	.short 63, 4
	.short 35, 1
	.short 63, 4
	.short 15, 3
	.short 13, 2
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_06E0:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_06E8:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_06F8:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0704:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_070C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0714:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_071C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0724:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_072C:
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0738:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0740:
	.short 12, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_074C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0754:
	.short 12, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0760:
	.short 15, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_076C:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0774:
	.short 13, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0780:
	.short 13, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_078C:
	.short 14, 2
	.short 13, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_079C:
	.short 13, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07A8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07B0:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07B8:
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07C0:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07C8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07D0:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07D8:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07E0:
	.short 63, 2
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07EC:
	.short 63, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_07F8:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0800:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0808:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_081C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_085C:
	.short 63, 2
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_ST01R0201_0874:
	.short 33, 1
	EndMovement


	.balign 4, 0
