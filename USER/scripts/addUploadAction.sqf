params ["_computer"];

[ 
 _computer, 
 "Upload Intel", 
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
 "_this distance _target < 3 && !(_target getVariable ['GRAD_intel_upload_done', false]) &&
 [_this, 'FlashDisk'] call bIs_fnc_hasitem", 
 "_caller  distance _target < 3", 
 { "Starting upload..." call CBA_fnc_notify; }, 
 {  }, 
 {
	_target setVariable ['GRAD_intel_upload_done', true, true];
	"Intel upload finished." call CBA_fnc_notify;

	laboratory_big_screen setObjectTextureGlobal [0, "data\krakensatnet.paa"];
},
 { "Aborted upload" call CBA_fnc_notify; }, 
 [], 10, nil, true, false 
] call BIS_fnc_holdActionAdd;
