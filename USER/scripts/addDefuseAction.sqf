params ["_object"];

[ 
 _object, 
 "Defuse Mine", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "_this distance _target < 3 &&
 !(missionNameSpace getVariable ['GRAD_SUBMARINE_COUNTDOWN_STOPPED', false]", 
 "_caller  distance _target < 3", 
 { "Trying to defuse..." call CBA_fnc_notify; }, 
 {  }, 
 {
	"Successfully defused!" call CBA_fnc_notify;
	missionNameSpace setVariable ["GRAD_SUBMARINE_COUNTDOWN_STOPPED", true, true];
},
 { "Aborted defuse" call CBA_fnc_notify; }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;
