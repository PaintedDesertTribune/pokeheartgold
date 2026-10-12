#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01.h"
#include "msgdata/msg/msg_0845_SC01.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01_000
	ScrDef scr_seq_SC01_001
	ScrDef scr_seq_SC01_002
	ScrDef scr_seq_SC01_003
	ScrDef scr_seq_SC01_004
	ScrDef scr_seq_SC01_005
	ScrDef scr_seq_SC01_006
	ScrDef scr_seq_SC01_007
	ScrDef scr_seq_SC01_008
	ScrDef scr_seq_SC01_009
	ScrDef scr_seq_SC01_010
	ScrDef scr_seq_SC01_011
	ScrDef scr_seq_SC01_012
	ScrDef scr_seq_SC01_013
	ScrDef scr_seq_SC01_014
	ScrDef scr_seq_SC01_015
	ScrDef scr_seq_SC01_016
	ScrDef scr_seq_SC01_017
	ScrDef scr_seq_SC01_018
	ScrDef scr_seq_SC01_019
	ScrDef scr_seq_SC01_020
	ScrDef scr_seq_SC01_021
	ScrDef scr_seq_SC01_022
	ScrDef scr_seq_SC01_023
	ScrDef scr_seq_SC01_024
	ScrDef scr_seq_SC01_025
	ScrDef scr_seq_SC01_026
	ScrDefEnd

scr_seq_SC01_000:
	CompareVarToValue VAR_SINNOH_4077, 3
	CallIf 4, _009B
	GetPlayerGender 0x4000
	CompareVarToValue 0x4000, 0
	GoToIf 1, _00B1
	CompareVarToValue 0x4000, 1
	GoToIf 1, _00B9
	End

_009B:
	MovePerson 7, 176, 739
	SetObjectFacing 7, 2
	SetObjectMovementType 7, 16
	Return

_00B1:
	SetVar 0x4020, SPRITE_SINNOH_HEROINE
	End

_00B9:
	SetVar 0x4020, SPRITE_SINNOH_HERO
	End

scr_seq_SC01_001:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 173
	GoToIf 1, _00F2
	CompareVarToValue 0x8004, 174
	GoToIf 1, _0102
	CompareVarToValue 0x8004, 175
	GoToIf 1, _0112
	End

_00F2:
	MovePerson 7, 173, 788
	GoTo _0122

_0102:
	MovePerson 7, 174, 788
	GoTo _0122

_0112:
	MovePerson 7, 175, 788
	GoTo _0122

_0122:
	ClearFlag FLAG_SINNOH_408
	ShowPerson 7
	Lock 7
	ApplyMovement 7, mv_SC01_0214
	WaitMovement
	CallStd 2040 /* TODO Diamond std script */
	ApplyMovement 7, mv_SC01_0224
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0166
	CompareVarToValue 0x800C, 1
	GoToIf 1, _01AD
	End

_0166:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00000
	GetPartyCount 0x800C
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 4
	CallIf 4, _01A3
	CompareVarToValue 0x800C, 3
	CallIf 3, _01A8
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0845_SC01_00004
	GoTo _01F4

_01A3:
	NPCMsg msg_0845_SC01_00001
	Return

_01A8:
	NPCMsg msg_0845_SC01_00002
	Return

_01AD:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00005
	GetPartyCount 0x800C
	// TODO Diamond ScrCmd_Unk00D5 0x0d5 args [0, 32780]: no HeartGold mapping yet
	CompareVarToValue 0x800C, 4
	CallIf 4, _01EA
	CompareVarToValue 0x800C, 3
	CallIf 3, _01EF
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0845_SC01_00009
	GoTo _01F4

_01EA:
	NPCMsg msg_0845_SC01_00006
	Return

_01EF:
	NPCMsg msg_0845_SC01_00007
	Return

_01F4:
	CloseMsg
	ApplyMovement 7, mv_SC01_022C
	WaitMovement
	HidePerson 7
	CallStd 2041 /* TODO Diamond std script */
	SetVar VAR_SINNOH_4077, 1
	ReleaseAll
	End

scr_seq_SC01_011:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _025A
	NPCMsg msg_0845_SC01_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_025A:
	NPCMsg msg_0845_SC01_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_012:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00072
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_018:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 779
	GoToIf 1, _02A9
	CompareVarToValue 0x8005, 780
	GoToIf 1, _02D2
	CompareVarToValue 0x8005, 781
	GoToIf 1, _02FB
	End

_02A9:
	ApplyMovement 27, mv_SC01_0328
	WaitMovement
	NPCMsg msg_0845_SC01_00071
	CloseMsg
	ApplyMovement 27, mv_SC01_0358
	ApplyMovement obj_player, mv_SC01_03A0
	WaitMovement
	GoTo _0324

_02D2:
	ApplyMovement 27, mv_SC01_0338
	WaitMovement
	NPCMsg msg_0845_SC01_00071
	CloseMsg
	ApplyMovement 27, mv_SC01_0370
	ApplyMovement obj_player, mv_SC01_03A0
	WaitMovement
	GoTo _0324

_02FB:
	ApplyMovement 27, mv_SC01_0348
	WaitMovement
	NPCMsg msg_0845_SC01_00071
	CloseMsg
	ApplyMovement 27, mv_SC01_0388
	ApplyMovement obj_player, mv_SC01_03A0
	WaitMovement
	GoTo _0324

_0324:
	ReleaseAll
	End

scr_seq_SC01_002:
	LockAll
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 757
	GoToIf 1, _03E6
	CompareVarToValue 0x8005, 758
	GoToIf 1, _0400
	CompareVarToValue 0x8005, 759
	GoToIf 1, _041A
	CompareVarToValue 0x8005, 760
	GoToIf 1, _0434
	End

_03E6:
	ApplyMovement obj_player, mv_SC01_053C
	ApplyMovement 19, mv_SC01_0550
	WaitMovement
	GoTo _044E

_0400:
	ApplyMovement obj_player, mv_SC01_053C
	ApplyMovement 19, mv_SC01_0564
	WaitMovement
	GoTo _044E

_041A:
	ApplyMovement obj_player, mv_SC01_053C
	ApplyMovement 19, mv_SC01_0578
	WaitMovement
	GoTo _044E

_0434:
	ApplyMovement obj_player, mv_SC01_053C
	ApplyMovement 19, mv_SC01_058C
	WaitMovement
	GoTo _044E

_044E:
	Call _04A4
	CloseMsg
	ApplyMovement obj_player, mv_SC01_0548
	ApplyMovement 19, mv_SC01_05A0
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8005, 757
	GoToIf 1, _04EE
	CompareVarToValue 0x8005, 758
	GoToIf 1, _0500
	CompareVarToValue 0x8005, 759
	GoToIf 1, _0512
	CompareVarToValue 0x8005, 760
	GoToIf 1, _0524
	End

_04A4:
	CheckFlag FLAG_SINNOH_241
	GoToIf 0, _04BF
	CheckFlag FLAG_SINNOH_243
	GoToIf 0, _04C4
	NPCMsg msg_0845_SC01_00012
	Return

_04BF:
	NPCMsg msg_0845_SC01_00013
	Return

_04C4:
	NPCMsg msg_0845_SC01_00015
	Return

_04C9:
	CheckFlag FLAG_SINNOH_241
	GoToIf 0, _04E4
	CheckFlag FLAG_SINNOH_243
	GoToIf 0, _04E9
	NPCMsg msg_0845_SC01_00018
	Return

_04E4:
	NPCMsg msg_0845_SC01_00019
	Return

_04E9:
	NPCMsg msg_0845_SC01_00020
	Return

_04EE:
	ApplyMovement 19, mv_SC01_05B0
	WaitMovement
	GoTo _0536

_0500:
	ApplyMovement 19, mv_SC01_05BC
	WaitMovement
	GoTo _0536

_0512:
	ApplyMovement 19, mv_SC01_05C8
	WaitMovement
	GoTo _0536

_0524:
	ApplyMovement 19, mv_SC01_05D4
	WaitMovement
	GoTo _0536

_0536:
	ReleaseAll
	End

scr_seq_SC01_004:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckBadge 0, 0x800C
	CompareVarToValue 0x800C, 1
	GoToIf 1, _061F
	CheckFlag FLAG_SINNOH_243
	GoToIf 1, _0614
	Call _04C9
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0614:
	NPCMsg msg_0845_SC01_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

_061F:
	NPCMsg msg_0845_SC01_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_003:
	LockAll
	GetPlayerCoords 0x8000, 0x8001
	CompareVarToValue 0x8000, 173
	GoToIf 1, _065B
	CompareVarToValue 0x8000, 174
	GoToIf 1, _0675
	CompareVarToValue 0x8000, 175
	GoToIf 1, _068F
	End

_065B:
	ApplyMovement 16, mv_SC01_0A8C
	ApplyMovement obj_player, mv_SC01_09AC
	WaitMovement
	GoTo _06A9

_0675:
	ApplyMovement 16, mv_SC01_0A8C
	ApplyMovement obj_player, mv_SC01_09C0
	WaitMovement
	GoTo _06A9

_068F:
	ApplyMovement 16, mv_SC01_0A8C
	ApplyMovement obj_player, mv_SC01_09CC
	WaitMovement
	GoTo _06A9

_06A9:
	BufferPlayersName 0
	BufferFriendsName 1
	NPCMsg msg_0845_SC01_00046
	ApplyMovement 17, mv_SC01_0A6C
	ApplyMovement 16, mv_SC01_0A98
	WaitMovement
	NPCMsg msg_0845_SC01_00047
	ApplyMovement 7, mv_SC01_0A1C
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _06F1
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0702
	End

_06F1:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00048
	GoTo _0713

_0702:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00049
	GoTo _0713

_0713:
	CloseMsg
	ApplyMovement 7, mv_SC01_0A24
	WaitMovement
	Call _07AD
	// TODO Diamond ScrCmd_Unk02A0 0x2a0 args [32772, 414, 415]: no HeartGold mapping yet
	CheckBattleWon 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0995
	ApplyMovement 18, mv_SC01_0A84
	WaitMovement
	NPCMsg msg_0845_SC01_00050
	CloseMsg
	ApplyMovement 17, mv_SC01_0A74
	ApplyMovement 18, mv_SC01_0A7C
	WaitMovement
	HidePerson 17
	HidePerson 18
	SetFlag FLAG_SINNOH_442
	ApplyMovement 16, mv_SC01_0AC0
	ApplyMovement 7, mv_SC01_0A2C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0845_SC01_00051
	ApplyMovement 7, mv_SC01_0A38
	WaitMovement
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0833
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0844
	End

_07AD:
	GetPlayerGender 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _07CD
	CompareVarToValue 0x800C, 1
	GoToIf 1, _07FF
	End

_07CD:
	GetStarterChoice 0x800C
	SetVar 0x8004, 616
	CompareVarToValue 0x800C, 390
	GoToIf 1, _0831
	SetVar 0x8004, 617
	CompareVarToValue 0x800C, 393
	GoToIf 1, _0831
	SetVar 0x8004, 618
	Return

_07FF:
	GetStarterChoice 0x800C
	SetVar 0x8004, 613
	CompareVarToValue 0x800C, 390
	GoToIf 1, _0831
	SetVar 0x8004, 614
	CompareVarToValue 0x800C, 393
	GoToIf 1, _0831
	SetVar 0x8004, 615
	Return

_0831:
	Return

_0833:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00055
	GoTo _0855

_0844:
	BufferFriendsName 0
	BufferPlayersName 1
	NPCMsg msg_0845_SC01_00056
	GoTo _0855

_0855:
	CloseMsg
	ApplyMovement 7, mv_SC01_0A40
	ApplyMovement 16, mv_SC01_0AA0
	ApplyMovement obj_player, mv_SC01_09E0
	WaitMovement
	GoTo _0879

_0879:
	HidePerson 7
	HidePerson 16
	ClearFlag FLAG_SINNOH_438
	SetVar VAR_SINNOH_4077, 4
	SetVar VAR_SINNOH_4079, 3
	HidePerson 25
	HidePerson 26
	HidePerson 28
	MovePerson 31, 174, 750
	SetObjectMovementType 31, 14
	ClearFlag FLAG_SINNOH_425
	ShowPerson 31
	Lock 31
	ApplyMovement 31, mv_SC01_099C
	WaitMovement
	NPCMsg msg_0845_SC01_00057
	Call _08E7
	NPCMsg msg_0845_SC01_00058
	CloseMsg
	Wait 15, 0x800C
	ApplyMovement 31, mv_SC01_09A4
	WaitMovement
	HidePerson 31
	ReleaseAll
	End

_08E7:
	SetVar 0x8004, 435
	SetVar 0x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_SINNOH_242
	Call _0949
	Call _0949
	Call _0949
	Call _0949
	Call _0949
	Call _0963
	Call _0963
	Call _0963
	Call _0963
	Call _0963
	// TODO Diamond ScrCmd_Unk01D5 0x1d5 args [0]: no HeartGold mapping yet
	Call _097D
	Call _097D
	Return

_0949:
	Random 0x800C, 6
	SetVar 0x8004, 0
	AddVar 0x8004, 32780
	// TODO Diamond ScrCmd_Unk01D2 0x1d2 args [32772, 1]: no HeartGold mapping yet
	Return

_0963:
	Random 0x800C, 6
	SetVar 0x8004, 18
	AddVar 0x8004, 32780
	// TODO Diamond ScrCmd_Unk01D2 0x1d2 args [32772, 1]: no HeartGold mapping yet
	Return

_097D:
	Random 0x800C, 8
	SetVar 0x8004, 1
	AddVar 0x8004, 32780
	// TODO Diamond ScrCmd_Unk01D5 0x1d5 args [32772]: no HeartGold mapping yet
	Return

_0995:
	WhiteOut
	ReleaseAll
	End

scr_seq_SC01_005:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00059
	// TODO Diamond ScrCmd_Unk0044 0x044 args [29, 11, 0, 0, 32780]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk02CF 0x2cf args [1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [45, 255, 0]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [46, 255, 1]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0046 0x046 args [47, 255, 2]: no HeartGold mapping yet
	// TODO Diamond ScrCmd_Unk0047 0x047 args []: no HeartGold mapping yet
	CopyVar 0x8008, 0x800C
	CompareVarToValue 0x8008, 0
	GoToIf 1, _0B4B
	CompareVarToValue 0x8008, 1
	GoToIf 1, _0B56
	NPCMsg msg_0845_SC01_00062
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B4B:
	NPCMsg msg_0845_SC01_00060
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B56:
	NPCMsg msg_0845_SC01_00061
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_006:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00063
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_009:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00067
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_007:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00064
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_010:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00068
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0BC5
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0BD0
	End

_0BC5:
	NPCMsg msg_0845_SC01_00069
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0BD0:
	NPCMsg msg_0845_SC01_00070
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_008:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00065
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_021:
	DirectionSignpost msg_0845_SC01_00075, 0, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_022:
	DirectionSignpost msg_0845_SC01_00076, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_023:
	DirectionSignpost msg_0845_SC01_00077, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_024:
	DirectionSignpost msg_0845_SC01_00078, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_025:
	DirectionSignpost msg_0845_SC01_00079, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_026:
	DirectionSignpost msg_0845_SC01_00080, 2, 0, 0x800C
	SetSignpostAction 3
	WaitSignpostAction
	WaitSignpost 0x800C
	CallStd std_signpost
	End

scr_seq_SC01_016:
	LockAll
	ApplyMovement 24, mv_SC01_0D2C
	ApplyMovement obj_player, mv_SC01_0D24
	WaitMovement
	GetPlayerCoords 0x8004, 0x8005
	CompareVarToValue 0x8004, 172
	CallIf 1, _0CE7
	CompareVarToValue 0x8004, 173
	CallIf 1, _0CF3
	CompareVarToValue 0x8004, 174
	CallIf 1, _0CFF
	CompareVarToValue 0x8004, 175
	CallIf 1, _0D0B
	CompareVarToValue 0x8004, 176
	CallIf 1, _0D17
	NPCMsg msg_0845_SC01_00021
	SetVar VAR_SINNOH_40E7, 2
	NPCMsg msg_0845_SC01_00022
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0CE7:
	ApplyMovement 24, mv_SC01_0D38
	WaitMovement
	Return

_0CF3:
	ApplyMovement 24, mv_SC01_0D48
	WaitMovement
	Return

_0CFF:
	ApplyMovement 24, mv_SC01_0D58
	WaitMovement
	Return

_0D0B:
	ApplyMovement 24, mv_SC01_0D60
	WaitMovement
	Return

_0D17:
	ApplyMovement 24, mv_SC01_0D70
	WaitMovement
	Return

scr_seq_SC01_017:
	PlayFanfare 1500
	LockAll
	FacePlayer
	SetVar 0x8004, 0
	Call _0DAC
	CompareVarToValue 0x8004, 3
	GoToIf 1, _0DD7
	NPCMsg msg_0845_SC01_00023
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0DAC:
	CheckFlag FLAG_SINNOH_237
	CallIf 1, _0DCF
	CheckFlag FLAG_SINNOH_238
	CallIf 1, _0DCF
	CheckFlag FLAG_SINNOH_239
	CallIf 1, _0DCF
	Return

_0DCF:
	AddVar 0x8004, 1
	Return

_0DD7:
	NPCMsg msg_0845_SC01_00024
	TakeItem 460, 1, 0x800C
	TakeItem 461, 1, 0x800C
	TakeItem 462, 1, 0x800C
	// Diamond ScrCmd_GivePoketch dropped: Pokétch dropped (decision 16)
	SetVar VAR_SINNOH_4077, 2
	// Diamond ScrCmd_UnlockPoketchApp dropped: Pokétch dropped (decision 16)
	// Diamond ScrCmd_UnlockPoketchApp dropped: Pokétch dropped (decision 16)
	// Diamond ScrCmd_UnlockPoketchApp dropped: Pokétch dropped (decision 16)
	// Diamond ScrCmd_UnlockPoketchApp dropped: Pokétch dropped (decision 16)
	BufferPlayersName 0
	NPCMsg msg_0845_SC01_00025
	PlaySE 1158
	WaitSE 1158
	NPCMsg msg_0845_SC01_00026
	CloseMsg
	GetPlayerFacing 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0E55
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0E6F
	CompareVarToValue 0x800C, 2
	GoToIf 1, _0E55
	CompareVarToValue 0x800C, 3
	GoToIf 1, _0E55
	End

_0E55:
	ApplyMovement 24, mv_SC01_0EA8
	ApplyMovement obj_player, mv_SC01_0EC0
	WaitMovement
	GoTo _0E89

_0E6F:
	ApplyMovement 24, mv_SC01_0E9C
	ApplyMovement obj_player, mv_SC01_0EB0
	WaitMovement
	GoTo _0E89

_0E89:
	HidePerson 24
	SetFlag FLAG_SINNOH_243
	ClearFlag FLAG_SINNOH_533
	ReleaseAll
	End

scr_seq_SC01_013:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_237
	GoToIf 1, _0F38
	NPCMsg msg_0845_SC01_00027
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0F02
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0F29
	End

_0F02:
	PlayFanfare 1521
	NPCMsg msg_0845_SC01_00028
	NPCMsg msg_0845_SC01_00030
	NPCMsg msg_0845_SC01_00031
	SetVar 0x8004, 460
	SetVar 0x8005, 1
	SetFlag FLAG_SINNOH_237
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0F29:
	PlayFanfare 1523
	NPCMsg msg_0845_SC01_00029
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0F38:
	NPCMsg msg_0845_SC01_00032
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_014:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CheckFlag FLAG_SINNOH_238
	GoToIf 1, _0FAF
	NPCMsg msg_0845_SC01_00033
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0F79
	CompareVarToValue 0x800C, 1
	GoToIf 1, _0FA0
	End

_0F79:
	PlayFanfare 1521
	NPCMsg msg_0845_SC01_00034
	NPCMsg msg_0845_SC01_00036
	NPCMsg msg_0845_SC01_00037
	SetVar 0x8004, 461
	SetVar 0x8005, 1
	SetFlag FLAG_SINNOH_238
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_0FA0:
	PlayFanfare 1523
	NPCMsg msg_0845_SC01_00035
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0FAF:
	NPCMsg msg_0845_SC01_00038
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_015:
	PlayFanfare 1500
	LockAll
	FacePlayer
	CompareVarToValue VAR_SINNOH_40E7, 2
	GoToIf 0, _104A
	CheckFlag FLAG_SINNOH_239
	GoToIf 1, _103F
	NPCMsg msg_0845_SC01_00039
	YesNo 0x800C
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0FFD
	CompareVarToValue 0x800C, 1
	GoToIf 1, _1030
	End

_0FFD:
	PlayFanfare 1521
	NPCMsg msg_0845_SC01_00040
	NPCMsg msg_0845_SC01_00042
	NPCMsg msg_0845_SC01_00043
	// Diamond ScrCmd_SetEventPosition dropped: object teleport (5 args) needs a HeartGold equivalent
	SetVar 0x8004, 462
	SetVar 0x8005, 1
	SetFlag FLAG_SINNOH_239
	CallStd 2016 /* TODO Diamond std script */
	CloseMsg
	ReleaseAll
	End

_1030:
	PlayFanfare 1523
	NPCMsg msg_0845_SC01_00041
	WaitButton
	CloseMsg
	ReleaseAll
	End

_103F:
	NPCMsg msg_0845_SC01_00045
	WaitButton
	CloseMsg
	ReleaseAll
	End

_104A:
	NPCMsg msg_0845_SC01_00044
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_019:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00073
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01_020:
	PlayFanfare 1500
	LockAll
	FacePlayer
	NPCMsg msg_0845_SC01_00074
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
mv_SC01_0214:
	.short 13, 4
	.short 75, 1
	.short 65, 1
	EndMovement

	.balign 4, 0
mv_SC01_0224:
	.short 13, 3
	EndMovement

	.balign 4, 0
mv_SC01_022C:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SC01_0328:
	.short 75, 1
	.short 13, 1
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC01_0338:
	.short 75, 1
	.short 13, 2
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC01_0348:
	.short 75, 1
	.short 13, 3
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC01_0358:
	.short 15, 1
	.short 63, 2
	.short 14, 1
	.short 12, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0370:
	.short 15, 1
	.short 63, 2
	.short 14, 1
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0388:
	.short 15, 1
	.short 63, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_03A0:
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC01_053C:
	.short 63, 5
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC01_0548:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SC01_0550:
	.short 75, 1
	.short 65, 1
	.short 13, 1
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC01_0564:
	.short 75, 1
	.short 65, 1
	.short 13, 2
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC01_0578:
	.short 75, 1
	.short 65, 1
	.short 13, 3
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC01_058C:
	.short 75, 1
	.short 65, 1
	.short 13, 4
	.short 15, 1
	EndMovement

	.balign 4, 0
mv_SC01_05A0:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	EndMovement

	.balign 4, 0
mv_SC01_05B0:
	.short 12, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_05BC:
	.short 12, 2
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_05C8:
	.short 12, 3
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_05D4:
	.short 12, 4
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_099C:
	.short 12, 8
	EndMovement

	.balign 4, 0
mv_SC01_09A4:
	.short 13, 8
	EndMovement

	.balign 4, 0
mv_SC01_09AC:
	.short 63, 2
	.short 12, 1
	.short 15, 1
	.short 12, 1
	EndMovement

	.balign 4, 0
mv_SC01_09C0:
	.short 63, 2
	.short 12, 2
	EndMovement

	.balign 4, 0
mv_SC01_09CC:
	.short 63, 2
	.short 12, 2
	.short 14, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC01_09E0:
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A1C:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A24:
	.short 14, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A2C:
	.short 14, 1
	.short 13, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A38:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A40:
	.short 15, 1
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC01_0A6C:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A74:
	.short 16, 9
	EndMovement

	.balign 4, 0
mv_SC01_0A7C:
	.short 16, 10
	EndMovement

	.balign 4, 0
mv_SC01_0A84:
	.short 35, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A8C:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC01_0A98:
	.short 34, 1
	EndMovement

	.balign 4, 0
mv_SC01_0AA0:
	.short 13, 9
	EndMovement

	.balign 4, 0
mv_SC01_0AC0:
	.short 33, 1
	EndMovement

	.balign 4, 0
mv_SC01_0D24:
	.short 0, 1
	EndMovement

	.balign 4, 0
mv_SC01_0D2C:
	.short 33, 1
	.short 75, 1
	EndMovement

	.balign 4, 0
mv_SC01_0D38:
	.short 13, 2
	.short 14, 2
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SC01_0D48:
	.short 13, 2
	.short 14, 1
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SC01_0D58:
	.short 13, 4
	EndMovement

	.balign 4, 0
mv_SC01_0D60:
	.short 13, 2
	.short 15, 1
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SC01_0D70:
	.short 13, 2
	.short 15, 2
	.short 13, 2
	EndMovement

	.balign 4, 0
mv_SC01_0E9C:
	.short 14, 1
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SC01_0EA8:
	.short 12, 9
	EndMovement

	.balign 4, 0
mv_SC01_0EB0:
	.short 63, 1
	.short 34, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
mv_SC01_0EC0:
	.short 63, 1
	.short 32, 1
	EndMovement

	.balign 4, 0
