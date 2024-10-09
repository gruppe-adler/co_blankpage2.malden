/*
*   Hier können eigene Sounds eingebunden werden.
*   Ist in CfgSounds included.
*/

#include "..\PV_submarine\cfgSounds.hpp"
#include "grad_grinder\cfgSounds.hpp"

class remote_start
{
    name = "remote_start";
    sound[] = {"USER\sounds\remote_start.ogg", 1, 1, 200};
    titles[] = {0, ""};
};

class remote_end
{
    name = "remote_end";
    sound[] = {"USER\sounds\remote_end.ogg", 1, 1, 200};
    titles[] = {0, ""};
};

class garble_long
{
    name = "garble_long";
    sound[] = {"USER\sounds\garble_long.ogg", 1, 1, 200};
    titles[] = {0, ""};
};
