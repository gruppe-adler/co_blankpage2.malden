params ["_object"];

[ 
 _object, 
 "Open hatch", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "\a3\ui_f\data\igui\cfg\actions\open_door_ca.paa", 
 "_this distance _target < 3", 
 "_caller  distance _target < 3", 
 { "Trying to open hatch..." call CBA_fnc_notify; }, 
 {  }, 
 {
	"No chance, the hatch is stuck :/" call CBA_fnc_notify;
},
 { "Aborted opening" call CBA_fnc_notify; }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;

systemchat "added action";