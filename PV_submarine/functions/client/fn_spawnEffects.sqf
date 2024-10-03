params ["_position"];


[_position] call PV_submarine_fnc_shrapnels;
[_position] spawn PV_submarine_fnc_destroyFX;
[_position] spawn PV_submarine_fnc_lightFlash;
[_position] call PV_submarine_fnc_splash;