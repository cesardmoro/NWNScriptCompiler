/* MEDIUM check for skill open_lock */

#include "nw_i0_plot" 

int StartingConditional()
{
	return AutoDC(DC_MEDIUM, SKILL_OPEN_LOCK, GetPCSpeaker());
}
