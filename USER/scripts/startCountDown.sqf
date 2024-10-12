if (isServer) then {
    [3600, true] call BIS_fnc_countdown;
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

		private _currentTime = [0] call BIS_fnc_countdown;
		private _text = [_currentTime, "MM:SS"] call BIS_fnc_secondsToString;
		submarine_display setObjectTexture [
			0,"#(rgb,2048,2048,3)text(1,1,""RobotoCondensed"",0.02,""#ff000000"",""#ff1111""," + _text + ")"
		];

	}, 1, []] call CBA_fnc_addPerFrameHandler;

};