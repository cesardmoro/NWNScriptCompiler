//::///////////////////////////////////////////////////
//:: X0_D2_HEN_STLTN
//:: TRUE if henchman is NOT in stealth mode.
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 01/24/2003
//::///////////////////////////////////////////////////

#include "x0_i0_modes"

int StartingConditional()
{
    return FALSE;//!GetModeActive(NW_MODE_STEALTH);
}
