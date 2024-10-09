params ["_submarine"];

[position _submarine] remoteExec ["PV_submarine_fnc_spawnEffects", [0,-2] select isDedicated, false];

missionNameSpace setVariable ["GRAD_SUBMARINE_DESTROYED", true, true];

[spaceCapsule] execVM "USER\scripts\untangleCapsule.sqf";

[{
    deleteVehicle _this;
}, _submarine, 1] call CBA_fnc_waitAndExecute;


// 0 = [[getPos _submarine select 0, getPos _submarine select 1, -30],"oil","large"] call server_fnc_createSubmarineSmoke;


