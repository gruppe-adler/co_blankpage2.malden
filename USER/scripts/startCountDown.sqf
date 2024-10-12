if (isServer) then {
    missionNameSpace setVariable ["GRAD_SUBMARINE_COUNTDOWN", 3600, true];

	[{
		params ["_args", "_handle"];

		private _count = missionNameSpace getVariable ["GRAD_SUBMARINE_COUNTDOWN", 3600];

		if (missionNameSpace getVariable ["GRAD_SUBMARINE_COUNTDOWN_STOPPED", false]) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};


		if (_count > 1) then {
			missionNameSpace setVariable ["GRAD_SUBMARINE_COUNTDOWN", _count-1, true];
		} else {
			[_handle] call CBA_fnc_removePerFrameHandler;
		};
		
	}, 1, []] call CBA_fnc_addPerFrameHandler;
};


if (hasInterface) then {

	[{
		params ["_args", "_handle"];

		if (missionNameSpace getVariable ["GRAD_SUBMARINE_COUNTDOWN_STOPPED", false]) then {
			submarine_display setObjectTexture [
				0,"#(rgb,8,8,3)color(0,0,0,0)"

			];
			[_handle] call CBA_fnc_removePerFrameHandler;
		};

		private _currentTime = missionNameSpace getVariable ["GRAD_SUBMARINE_COUNTDOWN", 3600];
		private _text = [_currentTime, "MM:SS"] call BIS_fnc_secondsToString;
		submarine_display setObjectTexture [
			0,"#(rgb,2048,2048,3)text(1,1,""RobotoCondensed"",0.02,""#ff000000"",""#ff1111""," + _text + ")"
		];

	}, 1, []] call CBA_fnc_addPerFrameHandler;

};