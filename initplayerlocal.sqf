if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus",2,false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

// set captive for kraken-units on spawn
if (player getVariable ["grad_iskraken", false]) then {
    player setCaptive true;
};
