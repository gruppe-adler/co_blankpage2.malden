params ["_player"];

if (!(_player getVariable ["GRAD_isRadioActiveExpert", false])) exitWith {};

private _onAction = {
    [] execVM "USER\scripts\showTracker.sqf";
};

private _condition = {
    !((_this select 0) getVariable ["GRAD_GPSTRACKER_OPENED",false])
};

private _action = ["GRAD_showTracker", "Show Radioactivity Tracker", "\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa", _onAction, _condition] call ace_interact_menu_fnc_createAction;
[_player, 1, ["ACE_SelfActions", "Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;	



private _onAction2 = {
    [] call grad_gpsTracker_fnc_closeTitle;
	_player setVariable ["GRAD_GPSTRACKER_OPENED", false];
};

private _condition2 = {
    ((_this select 0) getVariable ["GRAD_GPSTRACKER_OPENED",false])
};

private _action2 = ["GRAD_showTracker", "Hide Radioactivity Tracker", "\a3\ui_f\data\igui\cfg\holdactions\holdaction_connect_ca.paa", _onAction2, _condition2] call ace_interact_menu_fnc_createAction;
[_player, 1, ["ACE_SelfActions", "Equipment"], _action2] call ace_interact_menu_fnc_addActionToObject;	
