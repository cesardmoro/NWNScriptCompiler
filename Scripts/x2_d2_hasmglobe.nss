//::///////////////////////////////////////////////
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Check to see if the PC has SPELL_GREATER_MAGIC_WEAPON
  memorized...
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On: June 2003
//:://////////////////////////////////////////////

// JLR - OEI 07/11/05 -- Name Changed

int StartingConditional()
{
    if (GetHasSpell(
       SPELL_LESSER_GLOBE_OF_INVULNERABILITY
      , OBJECT_SELF) > 0)
        return TRUE;
    return FALSE;
}
