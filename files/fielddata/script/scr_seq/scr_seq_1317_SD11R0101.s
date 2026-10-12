#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SD11R0101.h"
#include "msgdata/msg/msg_1005_SD11R0101.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SD11R0101_000
	ScrDef scr_seq_SD11R0101_001
	ScrDef scr_seq_SD11R0101_002
	ScrDef scr_seq_SD11R0101_003
	ScrDef scr_seq_SD11R0101_004
	ScrDef scr_seq_SD11R0101_005
	ScrDef scr_seq_SD11R0101_006
	ScrDef scr_seq_SD11R0101_007
	ScrDef scr_seq_SD11R0101_008
	ScrDef scr_seq_SD11R0101_009
	ScrDef scr_seq_SD11R0101_010
	ScrDef scr_seq_SD11R0101_011
	ScrDef scr_seq_SD11R0101_012
	ScrDef scr_seq_SD11R0101_013
	ScrDef scr_seq_SD11R0101_014
	ScrDef scr_seq_SD11R0101_015
	ScrDef scr_seq_SD11R0101_016
	ScrDef scr_seq_SD11R0101_017
	ScrDef scr_seq_SD11R0101_018
	ScrDef scr_seq_SD11R0101_019
	ScrDef scr_seq_SD11R0101_020
	ScrDef scr_seq_SD11R0101_021
	ScrDef scr_seq_SD11R0101_022
	ScrDef scr_seq_SD11R0101_023
	ScrDef scr_seq_SD11R0101_024
	ScrDef scr_seq_SD11R0101_025
	ScrDef scr_seq_SD11R0101_026
	ScrDef scr_seq_SD11R0101_027
	ScrDef scr_seq_SD11R0101_028
	ScrDef scr_seq_SD11R0101_029
	ScrDefEnd

scr_seq_SD11R0101_000:
	SetFlag FLAG_SINNOH_2508
	SetFlag FLAG_SINNOH_512
	SetFlag FLAG_SINNOH_513
	SetFlag FLAG_SINNOH_585
	SetFlag FLAG_SINNOH_586
	SetFlag FLAG_SINNOH_587
	SetFlag FLAG_SINNOH_588
	SetFlag FLAG_SINNOH_589
	SetFlag FLAG_SINNOH_590
	SetFlag FLAG_SINNOH_591
	SetFlag FLAG_SINNOH_592
	SetFlag FLAG_SINNOH_593
	End

scr_seq_SD11R0101_001:
	LockAll
	SetVar 0x8001, 1
	ApplyMovement obj_player, mv_SD11R0101_0794
	WaitMovement
	GoTo _00CC

scr_seq_SD11R0101_003:
	LockAll
	SetVar 0x8001, 2
	ApplyMovement obj_player, mv_SD11R0101_079C
	WaitMovement
	GoTo _00CC

_00CC:
	NatDexFlagAction 2, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0182
	GoTo _00E4

_00E4:
	SetVar 0x4000, 0
	PlayerHasSpecies 0x800C, 25
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 35
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 54
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 417
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 425
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 427
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 440
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	NPCMsg msg_1005_SD11R0101_00000
	CloseMsg
	ApplyMovement obj_player, mv_SD11R0101_07A4
	WaitMovement
	ReleaseAll
	End

_0182:
	SetVar 0x4000, 1
	PlayerHasSpecies 0x800C, 25
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 35
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 54
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 417
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 425
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 427
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 440
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 39
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 255
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 300
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	PlayerHasSpecies 0x800C, 285
	CompareVarToValue 0x800C, 1
	GoToIf 1, _026C
	NPCMsg msg_1005_SD11R0101_00001
	CloseMsg
	ApplyMovement obj_player, mv_SD11R0101_07A4
	WaitMovement
	ReleaseAll
	End

_026C:
	SetVar 0x400A, 0
	GetPartyCount 0x400B
	SetVar 0x400C, 0

_027C:
	GetPartyMonSpecies 0x400A, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _030E
	CompareVarToValue 0x4000, 0
	CallIf 1, _033A
	CompareVarToValue 0x4000, 1
	CallIf 1, _03AB
	CompareVarToValue 0x800C, 0
	GoToIf 1, _030E
	BufferPartyMonNick 0, 0x400A
	CompareVarToValue 0x400C, 0
	GoToIf 1, _02CE
	GoTo _02EE

_02CE:
	AddVar 0x400C, 1
	NPCMsg msg_1005_SD11R0101_00002
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0450
	GoTo _030E

_02EE:
	AddVar 0x400C, 1
	NPCMsg msg_1005_SD11R0101_00004
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0450
	GoTo _030E

_030E:
	AddVar 0x400A, 1
	SubVar 0x400B, 1
	CompareVarToValue 0x400B, 0
	GoToIf 5, _027C
	NPCMsg msg_1005_SD11R0101_00005
	CloseMsg
	ApplyMovement obj_player, mv_SD11R0101_07A4
	WaitMovement
	ReleaseAll
	End

_033A:
	GetPartyMonSpecies 0x400A, 0x800C
	CompareVarToValue 0x800C, 25
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 35
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 54
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 417
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 425
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 427
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 440
	GoToIf 1, _03A3
	SetVar 0x800C, 0
	Return

_03A3:
	SetVar 0x800C, 1
	Return

_03AB:
	GetPartyMonSpecies 0x400A, 0x800C
	CompareVarToValue 0x800C, 25
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 35
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 54
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 417
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 425
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 427
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 440
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 39
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 255
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 300
	GoToIf 1, _03A3
	CompareVarToValue 0x800C, 285
	GoToIf 1, _03A3
	SetVar 0x800C, 0
	Return

_0450:
	HealParty
	FadeScreen 6, 1, 0, 0
	WaitFade
	CopyVar VAR_SINNOH_409D, 0x400A
	GetPartyMonSpecies 0x400A, VAR_SINNOH_409A
	CopyVar 0x8008, VAR_SINNOH_409A
	CompareVarToValue 0x8008, 25
	GoToIf 1, _050D
	CompareVarToValue 0x8008, 255
	GoToIf 1, _051D
	CompareVarToValue 0x8008, 35
	GoToIf 1, _052D
	CompareVarToValue 0x8008, 54
	GoToIf 1, _053D
	CompareVarToValue 0x8008, 417
	GoToIf 1, _054D
	CompareVarToValue 0x8008, 425
	GoToIf 1, _055D
	CompareVarToValue 0x8008, 427
	GoToIf 1, _056D
	CompareVarToValue 0x8008, 440
	GoToIf 1, _057D
	CompareVarToValue 0x8008, 39
	GoToIf 1, _058D
	CompareVarToValue 0x8008, 300
	GoToIf 1, _059D
	CompareVarToValue 0x8008, 285
	GoToIf 1, _05AD
	FadeScreen 6, 1, 1, 0
	WaitFade
	End

_050D:
	SetVar 0x8002, 5
	ClearFlag FLAG_SINNOH_512
	GoTo _05BD

_051D:
	SetVar 0x8002, 6
	ClearFlag FLAG_SINNOH_513
	GoTo _05BD

_052D:
	SetVar 0x8002, 15
	ClearFlag FLAG_SINNOH_585
	GoTo _05BD

_053D:
	SetVar 0x8002, 16
	ClearFlag FLAG_SINNOH_586
	GoTo _05BD

_054D:
	SetVar 0x8002, 17
	ClearFlag FLAG_SINNOH_587
	GoTo _05BD

_055D:
	SetVar 0x8002, 18
	ClearFlag FLAG_SINNOH_588
	GoTo _05BD

_056D:
	SetVar 0x8002, 19
	ClearFlag FLAG_SINNOH_589
	GoTo _05BD

_057D:
	SetVar 0x8002, 20
	ClearFlag FLAG_SINNOH_590
	GoTo _05BD

_058D:
	SetVar 0x8002, 21
	ClearFlag FLAG_SINNOH_591
	GoTo _05BD

_059D:
	SetVar 0x8002, 22
	ClearFlag FLAG_SINNOH_592
	GoTo _05BD

_05AD:
	SetVar 0x8002, 23
	ClearFlag FLAG_SINNOH_593
	GoTo _05BD

_05BD:
	ShowPerson 0x8002
	CompareVarToValue 0x8001, 1
	CallIf 1, _061E
	CompareVarToValue 0x8001, 2
	CallIf 1, _062C
	FadeScreen 6, 1, 1, 0
	WaitFade
	SetVar VAR_SINNOH_4099, 1
	// TODO Diamond ScrCmd_ClearAmitySquareSteps 0x215 args []: no HeartGold mapping yet
	Call _0858
	// TODO unknown Diamond command ScrCmd_Unk027C (0x27c); script truncated here
	End

_061E:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	Return

_062C:
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	Return

scr_seq_SD11R0101_002:
scr_seq_SD11R0101_004:
	LockAll
	FadeScreen 6, 1, 0, 0
	WaitFade
	// Diamond ScrCmd_Unk0162 dropped: Diamond partner-trainer clear; HeartGold's following system differs
	CopyVar 0x8008, VAR_SINNOH_409A
	CompareVarToValue 0x8008, 25
	GoToIf 1, _0700
	CompareVarToValue 0x8008, 255
	GoToIf 1, _070A
	CompareVarToValue 0x8008, 35
	GoToIf 1, _0714
	CompareVarToValue 0x8008, 54
	GoToIf 1, _071E
	CompareVarToValue 0x8008, 417
	GoToIf 1, _0728
	CompareVarToValue 0x8008, 425
	GoToIf 1, _0732
	CompareVarToValue 0x8008, 427
	GoToIf 1, _073C
	CompareVarToValue 0x8008, 440
	GoToIf 1, _0746
	CompareVarToValue 0x8008, 39
	GoToIf 1, _0750
	CompareVarToValue 0x8008, 300
	GoToIf 1, _075A
	CompareVarToValue 0x8008, 285
	GoToIf 1, _0764
	End

_0700:
	HidePerson 5
	GoTo _076E

_070A:
	HidePerson 6
	GoTo _076E

_0714:
	HidePerson 15
	GoTo _076E

_071E:
	HidePerson 16
	GoTo _076E

_0728:
	HidePerson 17
	GoTo _076E

_0732:
	HidePerson 18
	GoTo _076E

_073C:
	HidePerson 19
	GoTo _076E

_0746:
	HidePerson 20
	GoTo _076E

_0750:
	HidePerson 21
	GoTo _076E

_075A:
	HidePerson 22
	GoTo _076E

_0764:
	HidePerson 23
	GoTo _076E

_076E:
	FadeScreen 6, 1, 1, 0
	WaitFade
	SetVar VAR_SINNOH_4099, 0
	NPCMsg msg_1005_SD11R0101_00006
	CloseMsg
	ApplyMovement obj_player, mv_SD11R0101_07A4
	WaitMovement
	ReleaseAll
	End

scr_seq_SD11R0101_005:
scr_seq_SD11R0101_006:
scr_seq_SD11R0101_007:
scr_seq_SD11R0101_008:
scr_seq_SD11R0101_009:
scr_seq_SD11R0101_010:
scr_seq_SD11R0101_011:
scr_seq_SD11R0101_012:
scr_seq_SD11R0101_013:
scr_seq_SD11R0101_014:
scr_seq_SD11R0101_015:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferPartyMonNick 0, VAR_SINNOH_409D
	// TODO Diamond ScrCmd_CheckAmitySquareSteps 0x216 args [32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 200
	GoToIf 4, _0950
	GoTo _07E4

_07E4:
	Random 0x800C, 9
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0A37
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0A4F
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0A67
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0A7F
	CompareVarToValue 0x800C, 4
	GoToIf 1, _0A97
	CompareVarToValue 0x800C, 5
	GoToIf 1, _0AAF
	CompareVarToValue 0x800C, 6
	GoToIf 1, _0AC7
	CompareVarToValue 0x800C, 7
	GoToIf 1, _0ADF
	GoTo _0AF7

_0858:
	Random 0x800C, 5
	CompareVarToValue 0x800C, 0
	CallIf 1, _0884
	CompareVarToValue 0x800C, 0
	CallIf 5, _088C
	// TODO Diamond ScrCmd_GetAmitySquareAccessory 0x217 args [16540, 16538]: no HeartGold mapping yet
	GoTo _0894

_0884:
	SetVar VAR_SINNOH_409B, 0
	Return

_088C:
	SetVar VAR_SINNOH_409B, 1
	Return

_0894:
	Random 0x800C, 100
	CompareVarToValue 0x800C, 20
	GoToIf 0, _0908
	CompareVarToValue 0x800C, 35
	GoToIf 0, _0910
	CompareVarToValue 0x800C, 50
	GoToIf 0, _0918
	CompareVarToValue 0x800C, 65
	GoToIf 0, _0920
	CompareVarToValue 0x800C, 72
	GoToIf 0, _0928
	CompareVarToValue 0x800C, 79
	GoToIf 0, _0930
	CompareVarToValue 0x800C, 86
	GoToIf 0, _0938
	CompareVarToValue 0x800C, 93
	GoToIf 0, _0940
	GoTo _0948

_0908:
	SetVar VAR_SINNOH_409F, 176
	Return

_0910:
	SetVar VAR_SINNOH_409F, 175
	Return

_0918:
	SetVar VAR_SINNOH_409F, 177
	Return

_0920:
	SetVar VAR_SINNOH_409F, 178
	Return

_0928:
	SetVar VAR_SINNOH_409F, 179
	Return

_0930:
	SetVar VAR_SINNOH_409F, 180
	Return

_0938:
	SetVar VAR_SINNOH_409F, 181
	Return

_0940:
	SetVar VAR_SINNOH_409F, 182
	Return

_0948:
	SetVar VAR_SINNOH_409F, 183
	Return

_0950:
	CopyVar 0x8000, VAR_SINNOH_409B
	// TODO Diamond ScrCmd_ClearAmitySquareSteps 0x215 args []: no HeartGold mapping yet
	Call _0858
	CompareVarToValue 0x8000, 0
	GoToIf 1, _0971
	GoTo _09D4

_0971:
	CopyVar 0x8004, VAR_SINNOH_409F
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _09AD

_0992:
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00022
	WaitCry
	// TODO unknown Diamond command ScrCmd_Unk027C (0x27c); script truncated here
	End

_09AD:
	CopyVar 0x8004, VAR_SINNOH_409C
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_Unk01D3 0x1d3 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _07E4
	GoTo _09F5

_09D4:
	CopyVar 0x8004, VAR_SINNOH_409C
	SetVar 0x8005, 1
	// TODO Diamond ScrCmd_Unk01D3 0x1d3 args [32772, 32773, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0A10

_09F5:
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00022
	WaitCry
	// TODO unknown Diamond command ScrCmd_Unk027C (0x27c); script truncated here
	End

_0A10:
	CopyVar 0x8004, VAR_SINNOH_409F
	SetVar 0x8005, 1
	HasSpaceForItem 0x8004, 0x8005, 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _07E4
	GoTo _0992

_0A37:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00013
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A4F:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00014
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A67:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00015
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A7F:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00016
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0A97:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00017
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0AAF:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00018
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0AC7:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00019
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0ADF:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00020
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0AF7:
	BufferPartyMonNick 0, VAR_SINNOH_409D
	PlayCry VAR_SINNOH_409A, 0
	NPCMsg msg_1005_SD11R0101_00021
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_016:
	SetVar 0x400A, 0
	GoTo _0B27

scr_seq_SD11R0101_017:
	SetVar 0x400A, 1
	GoTo _0B27

_0B27:
	PlayFanfare 1500
	LockAll
	FacePlayer
	BufferPartyMonNick 0, VAR_SINNOH_409D
	Random 0x800C, 6
	CompareVarToValue 0x800C, 0
	CallIf 1, _0B9B
	CompareVarToValue 0x800C, 1
	CallIf 1, _0BA0
	CompareVarToValue 0x800C, 2
	CallIf 1, _0BA5
	CompareVarToValue 0x800C, 3
	CallIf 1, _0BAA
	CompareVarToValue 0x800C, 4
	CallIf 1, _0BAF
	CompareVarToValue 0x800C, 5
	CallIf 1, _0BB4
	CompareVarToValue 0x400A, 0
	GoToIf 1, _0BB9
	GoTo _0BCB

_0B9B:
	NPCMsg msg_1005_SD11R0101_00007
	Return

_0BA0:
	NPCMsg msg_1005_SD11R0101_00008
	Return

_0BA5:
	NPCMsg msg_1005_SD11R0101_00009
	Return

_0BAA:
	NPCMsg msg_1005_SD11R0101_00010
	Return

_0BAF:
	NPCMsg msg_1005_SD11R0101_00011
	Return

_0BB4:
	NPCMsg msg_1005_SD11R0101_00012
	Return

_0BB9:
	WaitButton
	CloseMsg
	ApplyMovement 0, mv_SD11R0101_0BE0
	WaitMovement
	ReleaseAll
	End

_0BCB:
	WaitButton
	CloseMsg
	ApplyMovement 1, mv_SD11R0101_0BE8
	WaitMovement
	ReleaseAll
	End

scr_seq_SD11R0101_018:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1005_SD11R0101_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_019:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 425, 0
	NPCMsg msg_1005_SD11R0101_00024
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_020:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1005_SD11R0101_00025
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_021:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1005_SD11R0101_00026
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_022:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1005_SD11R0101_00027
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_023:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 25, 0
	NPCMsg msg_1005_SD11R0101_00028
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_024:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_1005_SD11R0101_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SD11R0101_025:
	PlayFanfare 1500
	LockAll
	FacePlayer
	WaitSE 1500
	PlayCry 35, 0
	NPCMsg msg_1005_SD11R0101_00030
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SD11R0101_0794:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SD11R0101_079C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SD11R0101_07A4:
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SD11R0101_0BE0:
	.short 3, 1
	EndMovement

	.balign 4, 0
mv_SD11R0101_0BE8:
	.short 2, 1
	EndMovement

scr_seq_SD11R0101_026:
	SetVar VAR_SPECIAL_x8008, 372
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD11R0101_027:
	SetVar VAR_SPECIAL_x8008, 370
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD11R0101_028:
	SetVar VAR_SPECIAL_x8008, 310
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

scr_seq_SD11R0101_029:
	SetVar VAR_SPECIAL_x8008, 223
	SetVar VAR_SPECIAL_x8009, 1
	CallStd std_itemball_variadic
	End

	.balign 4, 0
