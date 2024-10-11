params ["_position"];


if (isServer) then {
	private _submarine = "Submarine_01_F" createVehicle [0,0,0];

	_submarine setMass 3550200;

	private _deepestPosition = ATLtoASL [_position#0, _position#1, 0];
	_submarine setPosASL [_position#0, _position#1, -20 max _deepestPosition#2];

	_submarine setMass [3350200, 20];

	_submarine setCenterOfMass [[0.0140495,2.052054,-6.03935], 0];
	_submarine setCenterOfMass [[0.0140495,1.052054,-6.03935], 20];

	missionNameSpace setVariable ["GRAD_extractionSubmarine", _submarine, true];

	waitUntil { getPosASL _submarine select 2 > -17 }; // submarine floats at ~ -8

	private _positionSound = getPosASL _submarine;
	playSound3D [getMissionPath "\USER\sounds\submarine2.ogg", objNull, false, [_positionSound#0, _positionSound#1, _positionSound#2 + 1], 3];

};

if (hasInterface) then {

	waitUntil { !isNull (missionNameSpace getVariable ["GRAD_extractionSubmarine", objNull]) };

	private _submarine = missionNameSpace getVariable ["GRAD_extractionSubmarine", objNull];

	waitUntil { getPosASL _submarine select 2 > -15 }; // submarine floats at ~ -8

	{
		_x params ["_offsetX", "_offsetY", "_offsetZ"];

		private _positionFX = _submarine getPos [_x, getDir _submarine];

		private _source = "#particlesource" createVehicleLocal ASLToAGL [_positionFX#0, _positionFX#1, 0];
		_source setParticleClass "WaterWave";

		[{
			deleteVehicle _this;
		}, _source, 10+_forEachIndex] call CBA_Fnc_waitAndExecute;

	} forEach 
	[
		-45,-40,-35,-30,-20,-10,0
	];

};
