params ["_object"];

if (isServer) then { 
	_object setMass 40000; 
	_object enableRopeAttach false;
};

[ 
 _object, 
 "Untangle Crap & Attach Hooks", 
 "", 
 "", 
 "_this distance _target < 3", 
 "_caller  distance _target < 3", 
 { "Started untangling" call CBA_fnc_notify; }, 
 {  }, 
 {
	[_target,[0,0,0.1]] remoteExec ["setVelocityModelSpace", _target];
	[_target,4000] remoteExec ["setMass", _target]; 
	[_target,true] remoteExec ["enableRopeAttach", _target];
	_target setVariable ["GRAD_isUntangled", false];
},
 { "Aborted untangling" call CBA_fnc_notify; }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;