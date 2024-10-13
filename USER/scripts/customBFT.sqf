if (isServer) then {
	
	ace_map_BFT_Enabled = false;
	publicVariable "ace_map_BFT_Enabled";
	/*
	{ 
		_x setVariable ["ace_map_hideBlueForceMarker", false, true]; 
	} forEach (allUnits);
	*/

};

if (hasInterface) then {

	[{
		private _playerIsKraken = player getVariable ["grad_isKraken", false];

		if (!isNil "GRAD_custom_bft_markers") then {
			{
				deleteMarkerLocal _x;
			} forEach GRAD_custom_bft_markers;
		};

		GRAD_custom_bft_markers = [];

		{
			// sp testable isplayer
			if ((leader _x) in (playableUnits + switchableUnits) && isNull (getAssignedCuratorLogic _x)) then {

				private _groupIsKraken = (leader _x) getVariable ["grad_iskraken", false];
				
				if (_playerIsKraken == _groupIsKraken) then {
					private _markername = (groupId _x) + "_custom_bft_marker";
					if (isNil _markername) then {
						_markername = createMarkerLocal [_markername, position leader _x];
					};
					private _markerType = [_x] call ace_common_fnc_getMarkerType;
					private _colour = format ["Color%1", side _x];
					_markername setMarkerTypeLocal _markerType;
					_markername setMarkerColorLocal _colour;
					_markername setMarkerTextLocal (groupid _x);
					_markername setMarkerPosLocal (getPos leader _x);
					GRAD_custom_bft_markers pushBack _markername;
				};
			};
		} forEach allGroups;

	}, 1, []] call CBA_fnc_addPerFrameHandler;

};