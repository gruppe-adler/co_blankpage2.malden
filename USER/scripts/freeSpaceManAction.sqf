params ["_object"];

[ 
 _object, 
 "Open hatch", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "_this distance _target < 5  && !(_this getVariable ['GRAD_isWelder', false])", 
 "_caller distance _target < 5  && !(_caller getVariable ['GRAD_isWelder', false])", 
 { ["Trying to open hatch...", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 { 
	
	params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];

	if (_frame % 8 == 0) then {
    	playSound3D ["A3\Sounds_F\characters\human-sfx\P08\Soundinjured_Max_1.wss", player, true, positionCameraToWorld [0,0,0], 1, 1, 20, 0, true];
	};
	// condition to progress always true
	true
}, 
 {
	if (_target getVariable ["GRAD_Capsule_Welded", false]) then {
		["The hatch seems to be welded shut. No chance to open it without proper tools.", 1, [1,1,1,1], true] call CBA_fnc_notify;
	} else {
		["No chance, the hatch is stuck :/", 1, [1,1,1,1], true] call CBA_fnc_notify;
	};
},
 { ["Aborted opening", 1, [1,1,1,1], true] call CBA_fnc_notify; },
 [], 4, nil, true, false 
] call BIS_fnc_holdActionAdd;

[ 
 _object, 
 "Weld shut hatch", 
 "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_in_flame_ca.paa", 
 "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_in_flame_ca.paa", 
 "_this distance _target < 5 &&
  _this getVariable ['GRAD_isWelder', false] && 
  !(_this getVariable ['GRAD_Capsule_Welded', false])", 
 "_caller distance _target < 5 &&
  _caller getVariable ['GRAD_isWelder', false] && 
  !(_target getVariable ['GRAD_Capsule_Welded', false])", 
 { ["Welding shut hatch...", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 {  
	params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
	private _capsule = cursorObject;
	if (typeOf _capsule == "SpaceshipCapsule_01_F") then {
		private _distance = player distance _capsule;
		private _position = AGLToASL positionCameraToWorld [0,0,_distance/4]; // middle between player and capsule
		[_position] remoteExec ["grad_grinder_fnc_sparkClient"];
	};
	// condition to progress always true
	true
 }, 
 {
	_target setVariable ["GRAD_Capsule_Welded", true, true];
	["The hatch has been welded shut. No chance to open it without proper tools.", 1, [1,1,1,1], true] call CBA_fnc_notify;
},
 { ["Aborted welding", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;



[ 
 _object, 
 "Grind hatch open", 
 "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_in_flame_ca.paa", 
 "\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_fire_in_flame_ca.paa", 
 "_this distance _target < 5 &&
  _this getVariable ['GRAD_isGrinder', false]", 
 "_caller distance _target < 5 &&
  _caller getVariable ['GRAD_isGrinder', false] && 
  (_target getVariable ['GRAD_Capsule_Welded', false])", 
 { ["Grinding hatch open...", 1, [1,1,1,1], true] call CBA_fnc_notify;
 	private _soundActive = createSoundSource ["sfxgrinderactive", player, [], 0];
	_soundActive attachTo [player, [0,0,0], "righthand", true];
	player setVariable ["grad_grinder_soundActive", _soundActive];

  }, 
 {  
	params ["_target", "_caller", "_actionId", "_arguments", "_frame", "_maxFrame"];
	private _capsule = cursorObject;
	if (typeOf _capsule == "SpaceshipCapsule_01_F") then {
		private _distance = player distance _capsule;
		private _position = AGLToASL positionCameraToWorld [0,0,_distance/2]; // middle between player and capsule
		[_position] remoteExec ["grad_grinder_fnc_sparkClient"];		
	};
	// condition to progress always true
	true
 }, 
 {
	_target setVariable ["GRAD_Capsule_Welded", false, true];
	["The hatch has been opened.", 1, [1,1,1,1], true] call CBA_fnc_notify;
	// spawn spaceman on server
	[[_target], "USER\scripts\spawnSpaceMan.sqf"] remoteExec ["BIS_fnc_execVM", 2];

	private _soundActive = player getVariable ["grad_grinder_soundActive", objNull];
 	if (!isNull _soundActive) then {
		deleteVehicle _soundActive;
	};
},
 { 
	["Aborted welding", 1, [1,1,1,1], true] call CBA_fnc_notify;
 	private _soundActive = player getVariable ["grad_grinder_soundActive", objNull];
 	if (!isNull _soundActive) then {
		deleteVehicle _soundActive;
	};
  }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;
