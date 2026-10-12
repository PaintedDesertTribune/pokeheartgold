#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0201.h"
#include "msgdata/msg/msg_0852_SC01R0201.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0201_000
	ScrDef scr_seq_SC01R0201_001
	ScrDef scr_seq_SC01R0201_002
	ScrDef scr_seq_SC01R0201_003
	ScrDef scr_seq_SC01R0201_004
	ScrDef scr_seq_SC01R0201_005
	ScrDef scr_seq_SC01R0201_006
	ScrDef scr_seq_SC01R0201_007
	ScrDef scr_seq_SC01R0201_008
	ScrDef scr_seq_SC01R0201_009
	ScrDef scr_seq_SC01R0201_010
	ScrDef scr_seq_SC01R0201_011
	ScrDef scr_seq_SC01R0201_012
	ScrDef scr_seq_SC01R0201_013
	ScrDef scr_seq_SC01R0201_014
	ScrDef scr_seq_SC01R0201_015
	ScrDef scr_seq_SC01R0201_016
	ScrDefEnd

scr_seq_SC01R0201_007:
	CheckFlag FLAG_SINNOH_2735
	GoToIf 1, _006D
	ClearTrainerFlag TRAINER_SINNOH_IDOL_GRACE
	ClearTrainerFlag TRAINER_SINNOH_REPORTER_KINSEY
	ClearTrainerFlag TRAINER_SINNOH_CAMERAMAN_TEVIN
	ClearTrainerFlag TRAINER_SINNOH_CLOWN_LEE
	ClearTrainerFlag TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI
	ClearTrainerFlag TRAINER_SINNOH_POKE_KID_ARIEL
	ClearTrainerFlag TRAINER_SINNOH_GUITARIST_ARTURO

_006D:
	SetFlag FLAG_SINNOH_625
	SetFlag FLAG_SINNOH_626
	SetFlag FLAG_SINNOH_627
	SetFlag FLAG_SINNOH_628
	SetFlag FLAG_SINNOH_629
	SetFlag FLAG_SINNOH_630
	SetFlag FLAG_SINNOH_631
	SetFlag FLAG_SINNOH_632
	SetVar 0x4000, 0   // Diamond ScrCmd_GetDayOfWeek: result fixed
	CompareVarToValue 0x4000, 0
	GoToIf 1, _00EE
	CompareVarToValue 0x4000, 1
	GoToIf 1, _00F4
	CompareVarToValue 0x4000, 2
	GoToIf 1, _00FA
	CompareVarToValue 0x4000, 3
	GoToIf 1, _0100
	CompareVarToValue 0x4000, 4
	GoToIf 1, _0106
	CompareVarToValue 0x4000, 5
	GoToIf 1, _0110
	CompareVarToValue 0x4000, 6
	GoToIf 1, _0116
	End

_00EE:
	ClearFlag FLAG_SINNOH_625
	End

_00F4:
	ClearFlag FLAG_SINNOH_626
	End

_00FA:
	ClearFlag FLAG_SINNOH_627
	End

_0100:
	ClearFlag FLAG_SINNOH_628
	End

_0106:
	ClearFlag FLAG_SINNOH_629
	ClearFlag FLAG_SINNOH_630
	End

_0110:
	ClearFlag FLAG_SINNOH_631
	End

_0116:
	ClearFlag FLAG_SINNOH_632
	End

scr_seq_SC01R0201_000:
	End

scr_seq_SC01R0201_001:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0852_SC01R0201_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_002:
	End

scr_seq_SC01R0201_003:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40F2, 0
	GoToIf 5, _0351
	CheckFlag FLAG_SINNOH_2729
	GoToIf 1, _016D
	NPCMsg msg_0852_SC01R0201_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0183
	GoTo _0178

_016D:
	NPCMsg msg_0852_SC01R0201_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0178:
	NPCMsg msg_0852_SC01R0201_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0183:
	SetFlag FLAG_SINNOH_2729
	NPCMsg msg_0852_SC01R0201_00007
	// TODO unknown Diamond command ScrCmd_Unk024E (0x24e); script truncated here
	End

_02A9:
	CopyVar 0x8008, 0x8002
	CompareVarToValue 0x8008, 2
	GoToIf 1, _02E5
	CompareVarToValue 0x8008, 3
	GoToIf 1, _02F1
	CompareVarToValue 0x8008, 4
	GoToIf 1, _02FD
	CompareVarToValue 0x8008, 5
	GoToIf 1, _0309
	End

_02E5:
	SetVar 0x8003, 51
	GoTo _0315

_02F1:
	SetVar 0x8003, 216
	GoTo _0315

_02FD:
	SetVar 0x8003, 29
	GoTo _0315

_0309:
	SetVar 0x8003, 1
	GoTo _0315

_0315:
	CopyVar 0x8004, 0x8003
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0340
	CallStd std_obtain_item_verbose
	GoTo _0363

_0340:
	CopyVar VAR_SINNOH_40F2, 0x8002
	NPCMsg msg_0852_SC01R0201_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0351:
	BufferPlayersName 0
	NPCMsg msg_0852_SC01R0201_00019
	CopyVar 0x8002, VAR_SINNOH_40F2
	GoTo _02A9

_0363:
	SetVar VAR_SINNOH_40F2, 0
	NPCMsg msg_0852_SC01R0201_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0852_SC01R0201_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0852_SC01R0201_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_006:
	End

scr_seq_SC01R0201_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_IDOL_GRACE
	GoToIf 1, _03EB
	NPCMsg msg_0852_SC01R0201_00024
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _03F6
	NPCMsg msg_0852_SC01R0201_00025
	CloseMsg
	TrainerBattle TRAINER_SINNOH_IDOL_GRACE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_IDOL_GRACE
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_03EB:
	NPCMsg msg_0852_SC01R0201_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03F6:
	NPCMsg msg_0852_SC01R0201_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_REPORTER_KINSEY
	GoToIf 1, _0450
	NPCMsg msg_0852_SC01R0201_00028
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _045B
	NPCMsg msg_0852_SC01R0201_00029
	CloseMsg
	TrainerBattle TRAINER_SINNOH_REPORTER_KINSEY, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_REPORTER_KINSEY
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_0450:
	NPCMsg msg_0852_SC01R0201_00031
	WaitButton
	CloseMsg
	ReleaseAll
	End

_045B:
	NPCMsg msg_0852_SC01R0201_00030
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_CAMERAMAN_TEVIN
	GoToIf 1, _04B5
	NPCMsg msg_0852_SC01R0201_00032
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _04C0
	NPCMsg msg_0852_SC01R0201_00033
	CloseMsg
	TrainerBattle TRAINER_SINNOH_CAMERAMAN_TEVIN, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_CAMERAMAN_TEVIN
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_04B5:
	NPCMsg msg_0852_SC01R0201_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04C0:
	NPCMsg msg_0852_SC01R0201_00034
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_CLOWN_LEE
	GoToIf 1, _051A
	NPCMsg msg_0852_SC01R0201_00036
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0525
	NPCMsg msg_0852_SC01R0201_00037
	CloseMsg
	TrainerBattle TRAINER_SINNOH_CLOWN_LEE, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_CLOWN_LEE
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_051A:
	NPCMsg msg_0852_SC01R0201_00039
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0525:
	NPCMsg msg_0852_SC01R0201_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI
	GoToIf 1, _059D
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 2
	GoToIf 4, _0561
	NPCMsg msg_0852_SC01R0201_00040
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0561:
	NPCMsg msg_0852_SC01R0201_00041
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _05A8
	NPCMsg msg_0852_SC01R0201_00042
	CloseMsg
	TrainerBattle TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_059D:
	NPCMsg msg_0852_SC01R0201_00044
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05A8:
	NPCMsg msg_0852_SC01R0201_00043
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI
	GoToIf 1, _0620
	SetVar 0x800C, 1   // Diamond ScrCmd_CountAvailablePartyMons_IgnoreSlot: result fixed
	CompareVarToValue 0x800C, 2
	GoToIf 4, _05E4
	NPCMsg msg_0852_SC01R0201_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05E4:
	NPCMsg msg_0852_SC01R0201_00046
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _062B
	NPCMsg msg_0852_SC01R0201_00047
	CloseMsg
	TrainerBattle TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_INTERVIEWERS_ROXY_OLI
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_0620:
	NPCMsg msg_0852_SC01R0201_00049
	WaitButton
	CloseMsg
	ReleaseAll
	End

_062B:
	NPCMsg msg_0852_SC01R0201_00048
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_014:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_POKE_KID_ARIEL
	GoToIf 1, _0685
	NPCMsg msg_0852_SC01R0201_00050
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0690
	NPCMsg msg_0852_SC01R0201_00051
	CloseMsg
	TrainerBattle TRAINER_SINNOH_POKE_KID_ARIEL, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_POKE_KID_ARIEL
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_0685:
	NPCMsg msg_0852_SC01R0201_00053
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0690:
	NPCMsg msg_0852_SC01R0201_00052
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0201_015:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckTrainerFlag TRAINER_SINNOH_GUITARIST_ARTURO
	GoToIf 1, _06EA
	NPCMsg msg_0852_SC01R0201_00054
	YesNo 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _06F5
	NPCMsg msg_0852_SC01R0201_00055
	CloseMsg
	TrainerBattle TRAINER_SINNOH_GUITARIST_ARTURO, 0, 0, 0
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0700
	SetTrainerFlag TRAINER_SINNOH_GUITARIST_ARTURO
	SetFlag FLAG_SINNOH_2735
	ReleaseAll
	End

_06EA:
	NPCMsg msg_0852_SC01R0201_00057
	WaitButton
	CloseMsg
	ReleaseAll
	End

_06F5:
	NPCMsg msg_0852_SC01R0201_00056
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0700:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC01R0201_016:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0852_SC01R0201_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End


	.balign 4, 0
