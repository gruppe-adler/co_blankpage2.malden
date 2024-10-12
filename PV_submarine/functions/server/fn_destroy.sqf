params ["_submarine"];

deleteVehicle submarine_net;

[_submarine] remoteExec ["PV_submarine_fnc_spawnEffects", [0,-2] select isDedicated, false];

missionNameSpace setVariable ["GRAD_SUBMARINE_DESTROYED", true, true];

[spaceCapsule] execVM "USER\scripts\untangleCapsule.sqf";


private _warhead = "vn_bomb_mk36_mine_planted" createVehicle (position _submarine);
_warhead setDamage 1;

[{
    hideObjectGlobal _this;
    hideObjectGlobal submarine_hatch_1;
    hideObjectGlobal submarine_hatch_2;
}, _submarine, 1] call CBA_fnc_waitAndExecute;


// 0 = [[getPos _submarine select 0, getPos _submarine select 1, -30],"oil","large"] call server_fnc_createSubmarineSmoke;


