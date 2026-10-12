#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC04R0801.h"
#include "msgdata/msg/msg_0962_SC04R0801.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC04R0801_000
	ScrDef scr_seq_SC04R0801_001
	ScrDef scr_seq_SC04R0801_002
	ScrDef scr_seq_SC04R0801_003
	ScrDef scr_seq_SC04R0801_004
	ScrDefEnd

scr_seq_SC04R0801_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40B6, 9
	GoToIf 4, _00AE
	CheckFlag FLAG_SINNOH_275
	GoToIf 1, _015E
	CheckFlag FLAG_SINNOH_121
	GoToIf 1, _007A
	NPCMsg msg_0962_SC04R0801_00000
	SetVar 0x8004, 428
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_121
	ClearFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00001
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0098
	SetFlag FLAG_SINNOH_275
	GoTo _015E

_007A:
	NPCMsg msg_0962_SC04R0801_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0098
	SetFlag FLAG_SINNOH_275
	GoTo _015E

_0098:
	NPCMsg msg_0962_SC04R0801_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00A3:
	NPCMsg msg_0962_SC04R0801_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00AE:
	NPCMsg msg_0962_SC04R0801_00033
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00B9:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00C8:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00D7:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00E6:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_00F5:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0104:
	SetFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00024
	Call _0579
	NPCMsg msg_0962_SC04R0801_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

_011C:
	NPCMsg msg_0962_SC04R0801_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0127:
	NPCMsg msg_0962_SC04R0801_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0132:
	NPCMsg msg_0962_SC04R0801_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_013D:
	NPCMsg msg_0962_SC04R0801_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0148:
	NPCMsg msg_0962_SC04R0801_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0153:
	NPCMsg msg_0962_SC04R0801_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015E:
	CompareVarToValue VAR_SINNOH_40B6, 0
	GoToIf 1, _01D9
	CompareVarToValue VAR_SINNOH_40B6, 1
	GoToIf 1, _0237
	CompareVarToValue VAR_SINNOH_40B6, 2
	GoToIf 1, _0295
	CompareVarToValue VAR_SINNOH_40B6, 3
	GoToIf 1, _02D3
	CompareVarToValue VAR_SINNOH_40B6, 4
	GoToIf 1, _0341
	CompareVarToValue VAR_SINNOH_40B6, 5
	GoToIf 1, _03D3
	CompareVarToValue VAR_SINNOH_40B6, 6
	GoToIf 1, _0442
	CompareVarToValue VAR_SINNOH_40B6, 7
	GoToIf 1, _04A3
	CompareVarToValue VAR_SINNOH_40B6, 8
	GoToIf 1, _0504
	GoTo _00AE

_01D9:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _00B9
	CheckFlag FLAG_SINNOH_2414
	GoToIf 0, _011C
	SetVar VAR_SINNOH_40B6, 1
	ClearFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00006
	SetVar 0x8004, 1
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground trap gift (Underground not in HeartGold)
	SetVar 0x8004, 23
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground trap gift (Underground not in HeartGold)
	SetVar 0x8004, 28
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground trap gift (Underground not in HeartGold)
	NPCMsg msg_0962_SC04R0801_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0237:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _00C8
	CheckFlag FLAG_SINNOH_2415
	GoToIf 0, _0127
	SetVar VAR_SINNOH_40B6, 2
	ClearFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00010
	SetVar 0x8004, 1
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground sphere gift (Underground not in HeartGold)
	SetVar 0x8004, 3
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground sphere gift (Underground not in HeartGold)
	SetVar 0x8004, 4
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground sphere gift (Underground not in HeartGold)
	NPCMsg msg_0962_SC04R0801_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0295:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _00D7
	CheckFlag FLAG_SINNOH_2416
	GoToIf 0, _0132
	SetVar VAR_SINNOH_40B6, 3
	ClearFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00014
	SetVar 0x8004, 33
	SetVar 0x8005, 1
	// Diamond std call dropped: Underground trap gift (Underground not in HeartGold)
	NPCMsg msg_0962_SC04R0801_00015
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02D3:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _00E6
	CheckFlag FLAG_SINNOH_2417
	GoToIf 0, _013D
	SetVar VAR_SINNOH_40B6, 4
	ClearFlag FLAG_SINNOH_273
	NPCMsg msg_0962_SC04R0801_00018
	SetVar 0x8004, 11
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	SetVar 0x8004, 9
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	SetVar 0x8004, 17
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	SetVar 0x8004, 113
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	NPCMsg msg_0962_SC04R0801_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0341:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _00F5
	CheckFlag FLAG_SINNOH_2418
	GoToIf 0, _0148
	SetVar VAR_SINNOH_40B6, 5
	ClearFlag FLAG_SINNOH_273
	ClearFlag FLAG_SINNOH_252
	NPCMsg msg_0962_SC04R0801_00022
	Call _0379
	NPCMsg msg_0962_SC04R0801_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0379:
	GetStarterChoice 0x800C
	CompareVarToValue 0x800C, 390
	GoToIf 1, _039D
	CompareVarToValue 0x800C, 387
	GoToIf 1, _03AF
	GoTo _03C1

_039D:
	SetVar 0x8004, 101
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	Return

_03AF:
	SetVar 0x8004, 102
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	Return

_03C1:
	SetVar 0x8004, 103
	SetVar 0x8005, 1
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	Return

_03D3:
	CheckFlag FLAG_SINNOH_273
	GoToIf 0, _0104
	CheckFlag FLAG_SINNOH_2419
	GoToIf 0, _0153
	CheckFlag FLAG_SINNOH_252
	CallIf 1, _0574
	CheckFlag FLAG_SINNOH_252
	CallIf 0, _043D
	SetVar 0x8004, 81
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0565
	// Diamond std call dropped: Secret base decoration gift (Underground not in HeartGold)
	SetVar VAR_SINNOH_40B6, 6
	ClearFlag FLAG_SINNOH_273
	ClearFlag FLAG_SINNOH_252
	NPCMsg msg_0962_SC04R0801_00028
	WaitButton
	CloseMsg
	ReleaseAll
	End

_043D:
	NPCMsg msg_0962_SC04R0801_00027
	Return

_0442:
	// TODO Diamond ScrCmd_Unk024A 0x24a args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 3
	GoToIf 0, _00A3
	CheckFlag FLAG_SINNOH_252
	CallIf 1, _0574
	CheckFlag FLAG_SINNOH_252
	CallIf 0, _049E
	SetVar 0x8004, 82
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0565
	// Diamond std call dropped: Underground decoration gift (Underground not in HeartGold)
	SetVar VAR_SINNOH_40B6, 7
	ClearFlag FLAG_SINNOH_252
	CloseMsg
	ReleaseAll
	End

_049E:
	NPCMsg msg_0962_SC04R0801_00030
	Return

_04A3:
	// TODO Diamond ScrCmd_Unk024A 0x24a args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 10
	GoToIf 0, _00A3
	CheckFlag FLAG_SINNOH_252
	CallIf 1, _0574
	CheckFlag FLAG_SINNOH_252
	CallIf 0, _04FF
	SetVar 0x8004, 83
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0565
	// Diamond std call dropped: Underground decoration gift (Underground not in HeartGold)
	SetVar VAR_SINNOH_40B6, 8
	ClearFlag FLAG_SINNOH_252
	CloseMsg
	ReleaseAll
	End

_04FF:
	NPCMsg msg_0962_SC04R0801_00031
	Return

_0504:
	// TODO Diamond ScrCmd_Unk024A 0x24a args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 50
	GoToIf 0, _00A3
	CheckFlag FLAG_SINNOH_252
	CallIf 1, _0574
	CheckFlag FLAG_SINNOH_252
	CallIf 0, _0560
	SetVar 0x8004, 84
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_HasSpaceForDecoration 0x085 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0565
	// Diamond std call dropped: Underground decoration gift (Underground not in HeartGold)
	SetVar VAR_SINNOH_40B6, 9
	ClearFlag FLAG_SINNOH_252
	CloseMsg
	ReleaseAll
	End

_0560:
	NPCMsg msg_0962_SC04R0801_00032
	Return

_0565:
	SetFlag FLAG_SINNOH_252
	NPCMsg msg_0962_SC04R0801_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0574:
	NPCMsg msg_0962_SC04R0801_00035
	Return

_0579:
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 5
	GoToIf 1, _05AC
	CompareVarToValue 0x8004, 7
	GoToIf 1, _05B8
	CompareVarToValue 0x8005, 4
	GoToIf 1, _05C4
	GoTo _05D0

_05AC:
	ApplyMovement 2, mv_SC04R0801_05DC
	WaitMovement
	Return

_05B8:
	ApplyMovement 2, mv_SC04R0801_05F0
	WaitMovement
	Return

_05C4:
	ApplyMovement 2, mv_SC04R0801_0604
	WaitMovement
	Return

_05D0:
	ApplyMovement 2, mv_SC04R0801_0618
	WaitMovement
	Return

scr_seq_SC04R0801_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0962_SC04R0801_00036
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0801_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_189
	GoToIf 1, _0661
	SetFlag FLAG_SINNOH_189
	NPCMsg msg_0962_SC04R0801_00037
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0661:
	NPCMsg msg_0962_SC04R0801_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0801_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0962_SC04R0801_00039
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC04R0801_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0962_SC04R0801_00040
	GoTo _068E

_068E:
	NPCMsg msg_0962_SC04R0801_00041
	MenuInit 1, 1, 0, 1, 0x800C
	ScrCmd_066 180, 0
	ScrCmd_066 181, 1
	ScrCmd_066 182, 2
	ScrCmd_066 183, 3
	ScrCmd_066 184, 4
	ScrCmd_066 12, 5
	MenuExec
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0702
	CompareVarToValue 0x8008, 1
	GoToIf 1, _070D
	CompareVarToValue 0x8008, 2
	GoToIf 1, _0718
	CompareVarToValue 0x8008, 3
	GoToIf 1, _0723
	CompareVarToValue 0x8008, 4
	GoToIf 1, _072E
	GoTo _0739

_0702:
	NPCMsg msg_0962_SC04R0801_00042
	GoTo _068E

_070D:
	NPCMsg msg_0962_SC04R0801_00043
	GoTo _068E

_0718:
	NPCMsg msg_0962_SC04R0801_00044
	GoTo _068E

_0723:
	NPCMsg msg_0962_SC04R0801_00045
	GoTo _068E

_072E:
	NPCMsg msg_0962_SC04R0801_00046
	GoTo _068E

_0739:
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC04R0801_05DC:
	.short 8, 1
	.short 9, 2
	.short 8, 1
	.short 38, 1
	EndMovement

	.balign 4, 0
mv_SC04R0801_05F0:
	.short 8, 1
	.short 9, 2
	.short 8, 1
	.short 39, 1
	EndMovement

	.balign 4, 0
mv_SC04R0801_0604:
	.short 10, 1
	.short 11, 2
	.short 10, 1
	.short 36, 1
	EndMovement

	.balign 4, 0
mv_SC04R0801_0618:
	.short 10, 1
	.short 11, 2
	.short 10, 1
	.short 37, 1
	EndMovement


	.balign 4, 0
