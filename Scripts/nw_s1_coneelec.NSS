//::///////////////////////////////////////////////
//:: Cone: Lightning
//:: NW_S1_ConeElec
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A cone of damage eminates from the monster.  Does
    a set amount of damage based upon the creatures HD
    and can be halved with a Reflex Save.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 11, 2001
//:://////////////////////////////////////////////
//:: Updated Georg Z, 2003-09-02: fixed cone not visible if no damage is done
#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    int nHD = GetHitDice(OBJECT_SELF);
    int nDamage;
    int nLoop = nHD / 3;
    int nDC = 10 + (nHD/2);
    float fDelay;
    if(nLoop == 0)
    {
        nLoop = 1;
    }
    //Calculate the damage
    for (nLoop; nLoop > 0; nLoop--)
    {
        nDamage = nDamage + d6(2);
    }
    location lTargetLocation = GetSpellTargetLocation();
    object oTarget;
    effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF,BODY_NODE_HAND);
    effect eCone;
    effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
    oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 10.0, lTargetLocation, TRUE);
    //Get first target in spell area
    while(GetIsObjectValid(oTarget))
    {
        if (spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELLABILITY_CONE_LIGHTNING));
            //Determine effect delay
            fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/20;
            //Adjust the damage based on the Reflex Save, Evasion and Improved Evasion.
            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, GetSpellSaveDC(), SAVING_THROW_TYPE_ELECTRICITY);
            //Set damage effect
            eCone = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLightning,oTarget,0.5);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            if(nDamage > 0)
            {
                //Apply the VFX impact and effects
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eCone, oTarget));
            }
        }
        //Get next target in spell area
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 11.0, lTargetLocation, TRUE);
    }
}

