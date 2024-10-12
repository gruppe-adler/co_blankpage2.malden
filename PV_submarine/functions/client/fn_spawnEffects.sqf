params ["_submarine"];


[_submarine] call PV_submarine_fnc_shrapnels;
[_submarine] spawn PV_submarine_fnc_destroyFX;
[_submarine] spawn PV_submarine_fnc_lightFlash;
[_submarine] call PV_submarine_fnc_splash;