params ["_object"];

if (isServer) then {

	private _fakedoor = "Land_Drainage_01_F" createVehicle [0,0,0];
	_fakedoor attachTo [_object, [1.1543,0.419922,-0.82306]];
	_fakedoor setVectorDirAndUp [[-0.066091,-0.923746,0.377261],[0.921584,0.0884295,0.377973]];

	_object setvariable ["grad_hatch", _fakedoor, true];

	[[_fakedoor], "USER\scripts\freeSpaceManAction.sqf"] remoteExec ["BIS_fnc_execVM", 0, true];
};
