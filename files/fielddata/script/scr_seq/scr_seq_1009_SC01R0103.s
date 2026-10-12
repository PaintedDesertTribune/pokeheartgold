#include "constants/scrcmd.h"
#include "constants/sinnoh.h"
#include "fielddata/script/scr_seq/event_SC01R0103.h"
#include "msgdata/msg/msg_0851_SC01R0103.h"
#include "macros/script.inc"
#include "macros/movement.inc"

	ScrDef scr_seq_SC01R0103_000
	ScrDef scr_seq_SC01R0103_001
	ScrDef scr_seq_SC01R0103_002
	ScrDef scr_seq_SC01R0103_003
	ScrDef scr_seq_SC01R0103_004
	ScrDef scr_seq_SC01R0103_005
	ScrDef scr_seq_SC01R0103_006
	ScrDefEnd

scr_seq_SC01R0103_000:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0103_001:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0103_002:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_SC01R0103_003:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00003

_0062:
	NPCMsg msg_0851_SC01R0103_00004
	MenuInit 1, 1, 0, 1, 0x8004
	// Diamond ScrCmd_CheckPoketch dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _00A2
	Call _00FE
	Call _0122
	Call _0146
	Call _016A
	Call _018E
	Call _01B2

_00A2:
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x8004, 1
	GoToIf 1, _0119
	CompareVarToValue 0x8004, 2
	GoToIf 1, _013D
	CompareVarToValue 0x8004, 3
	GoToIf 1, _0161
	CompareVarToValue 0x8004, 4
	GoToIf 1, _0185
	CompareVarToValue 0x8004, 5
	GoToIf 1, _01A9
	CompareVarToValue 0x8004, 6
	GoToIf 1, _01CD
	CloseMsg
	ReleaseAll
	End

_00FE:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0119:
	NPCMsg msg_0851_SC01R0103_00011
	GoTo _0062

_0122:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_013D:
	NPCMsg msg_0851_SC01R0103_00012
	GoTo _0062

_0146:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0161:
	NPCMsg msg_0851_SC01R0103_00014
	GoTo _0062

_016A:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0185:
	NPCMsg msg_0851_SC01R0103_00015
	GoTo _0062

_018E:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_01A9:
	NPCMsg msg_0851_SC01R0103_00013
	GoTo _0062

_01B2:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _01D6
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_01CD:
	NPCMsg msg_0851_SC01R0103_00016
	GoTo _0062

_01D6:
	Return

scr_seq_SC01R0103_004:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00005

_01E3:
	NPCMsg msg_0851_SC01R0103_00006
	MenuInit 1, 1, 0, 1, 0x8004
	// Diamond ScrCmd_CheckPoketch dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0229
	Call _0292
	Call _02B6
	Call _02DA
	Call _02FE
	Call _0322
	Call _0346
	Call _036A

_0229:
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x8004, 1
	GoToIf 1, _02AD
	CompareVarToValue 0x8004, 2
	GoToIf 1, _02D1
	CompareVarToValue 0x8004, 3
	GoToIf 1, _02F5
	CompareVarToValue 0x8004, 4
	GoToIf 1, _0319
	CompareVarToValue 0x8004, 5
	GoToIf 1, _033D
	CompareVarToValue 0x8004, 6
	GoToIf 1, _0361
	CompareVarToValue 0x8004, 7
	GoToIf 1, _0385
	CloseMsg
	ReleaseAll
	End

_0292:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_02AD:
	NPCMsg msg_0851_SC01R0103_00017
	GoTo _01E3

_02B6:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_02D1:
	NPCMsg msg_0851_SC01R0103_00024
	GoTo _01E3

_02DA:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_02F5:
	NPCMsg msg_0851_SC01R0103_00019
	GoTo _01E3

_02FE:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0319:
	NPCMsg msg_0851_SC01R0103_00020
	GoTo _01E3

_0322:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_033D:
	NPCMsg msg_0851_SC01R0103_00021
	GoTo _01E3

_0346:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0361:
	NPCMsg msg_0851_SC01R0103_00022
	GoTo _01E3

_036A:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _038E
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0385:
	NPCMsg msg_0851_SC01R0103_00023
	GoTo _01E3

_038E:
	Return

scr_seq_SC01R0103_005:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00007

_039B:
	NPCMsg msg_0851_SC01R0103_00008
	MenuInit 1, 1, 0, 1, 0x8004
	// Diamond ScrCmd_CheckPoketch dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _03DB
	Call _0437
	Call _045B
	Call _047F
	Call _04A3
	Call _04C7
	Call _04EB

_03DB:
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x8004, 1
	GoToIf 1, _0452
	CompareVarToValue 0x8004, 2
	GoToIf 1, _0476
	CompareVarToValue 0x8004, 3
	GoToIf 1, _049A
	CompareVarToValue 0x8004, 4
	GoToIf 1, _04BE
	CompareVarToValue 0x8004, 5
	GoToIf 1, _04E2
	CompareVarToValue 0x8004, 6
	GoToIf 1, _0506
	CloseMsg
	ReleaseAll
	End

_0437:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0452:
	NPCMsg msg_0851_SC01R0103_00018
	GoTo _039B

_045B:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0476:
	NPCMsg msg_0851_SC01R0103_00025
	GoTo _039B

_047F:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_049A:
	NPCMsg msg_0851_SC01R0103_00029
	GoTo _039B

_04A3:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_04BE:
	NPCMsg msg_0851_SC01R0103_00028
	GoTo _039B

_04C7:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_04E2:
	NPCMsg msg_0851_SC01R0103_00026
	GoTo _039B

_04EB:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _050F
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0506:
	NPCMsg msg_0851_SC01R0103_00027
	GoTo _039B

_050F:
	Return

scr_seq_SC01R0103_006:
	PlayFanfare SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0851_SC01R0103_00009

_051C:
	NPCMsg msg_0851_SC01R0103_00010
	MenuInit 1, 1, 0, 1, 0x8004
	// Diamond ScrCmd_CheckPoketch dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _055C
	Call _05B8
	Call _05DC
	Call _0600
	Call _0624
	Call _0648
	Call _066C

_055C:
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	// Diamond ScrCmd_Unk0043 dropped: Diamond scrolling list window (library bookshelf)
	CompareVarToValue 0x8004, 1
	GoToIf 1, _05D3
	CompareVarToValue 0x8004, 2
	GoToIf 1, _05F7
	CompareVarToValue 0x8004, 3
	GoToIf 1, _061B
	CompareVarToValue 0x8004, 4
	GoToIf 1, _063F
	CompareVarToValue 0x8004, 5
	GoToIf 1, _0663
	CompareVarToValue 0x8004, 6
	GoToIf 1, _0687
	CloseMsg
	ReleaseAll
	End

_05B8:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_05D3:
	NPCMsg msg_0851_SC01R0103_00030
	GoTo _051C

_05DC:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_05F7:
	NPCMsg msg_0851_SC01R0103_00032
	GoTo _051C

_0600:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_061B:
	NPCMsg msg_0851_SC01R0103_00033
	GoTo _051C

_0624:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_063F:
	NPCMsg msg_0851_SC01R0103_00034
	GoTo _051C

_0648:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0663:
	NPCMsg msg_0851_SC01R0103_00035
	GoTo _051C

_066C:
	// Diamond ScrCmd_CheckPoketchApp dropped: Pokétch dropped (decision 16)
	CompareVarToValue 0x800C, 0
	GoToIf 1, _0690
	// Diamond ScrCmd_Unk029D dropped: Diamond scrolling list window (library bookshelf)
	Return

_0687:
	NPCMsg msg_0851_SC01R0103_00031
	GoTo _051C

_0690:
	Return



	.balign 4, 0
