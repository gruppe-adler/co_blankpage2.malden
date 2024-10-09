params ["_object"];

if (isServer) then {

	private _fakedoor = "Barrel4" createVehicle [0,0,0];
	_fakedoor setDir getDir _object;
	_fakedoor setVectorDirAndUp [[-0.925205,0.331866,-0.184013],[-0.00193197,0.480798,0.87683]];
	_fakedoor attachTo [_object, [1.55371,0.620117,-0.191074]];

	[[_fakedoor], "USER\scripts\freeSpaceManAction.sqf"] remoteExec ["BIS_fnc_execVM", 0, true];
};
