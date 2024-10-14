params ["_capsule", "_caller"];

private _position =  _caller getPos [0.5, _caller getreldir _capsule];

private _spaceman = (createGroup civilian) createUnit ["C_pilot2_story_RF", _position, [], 0, "NONE"];

_spaceman setUnitLoadout [[],[],[],["UK3CB_ION_B_U_H_Pilot_Uniform_01_WIN",[["FlashDisk",1,30]]],["V_DeckCrew_white_F",[]],["UK3CB_ION_B_B_RIF_WIN_02",[]],"vn_b_helmet_aph6_02_01","",[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
_spaceman allowDamage false;



[_spaceman, "GetOutMantis"] remoteExec ["switchMove", 0];

[{
	_this allowDamage true;
}, _spaceman, 3] call CBA_fnc_waitAndExecute;


_spaceman addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	if (local _unit) then {
		["GRAD_astronautKilled", []] call CBA_fnc_globalEvent;
	};
}];
