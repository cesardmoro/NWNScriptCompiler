//:://////////////////////////////////////////////////
//:: X0_D2_HEN_QUIT
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Returns TRUE if this henchman quit working for this
player.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 09/13/2002
//:://////////////////////////////////////////////////

#include "x0_i0_henchman"

int StartingConditional()
{
    return GetDidQuit(GetPCSpeaker());
}
