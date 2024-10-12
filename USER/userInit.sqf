/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

[player] execVM "user\scripts\addTrackerAction.sqf";

// make KRAKEN HQ visible for kraken only
if (player getVariable ["GRAD_isKraken", false]) then {
	"mrk_kraken_hq" setMarkerAlphaLocal 1;
};


if (isServer) then {

	["ace_explosives_detonate", {
		params ["_unit", "_item1", "_item2"];

		if (_item1 inArea trg_submarine &&
			!(missionNameSpace getVariable ["GRAD_SUBMARINE_DESTROYED", false])) then {
				[hms_proteus] call PV_submarine_fnc_destroy;
		};
		
		diag_log format ["submarine detonation: unit: %1, item1: %2, item2: %3", _unit, _item1, _item2];

	}] call CBA_fnc_addEventhandler;
		
};

