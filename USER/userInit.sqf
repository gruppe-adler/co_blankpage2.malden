/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

[player] execVM "user\scripts\addTrackerAction.sqf";

[] execVM "user\scripts\startCountdown.sqf";

// make KRAKEN HQ visible for kraken only
if (player getVariable ["GRAD_isKraken", false]) then {
	"mrk_kraken_hq" setMarkerAlphaLocal 1;
} else {
	"mrk_seawatch_hq" setMarkerAlphaLocal 1;
};

// add custom BFT, disable ace BFT
[] execVM "user\scripts\customBFT.sqf";


missionNamespace setVariable ["GRAD_BP_vehicle_types_action", ["rhsusf_mkvsoc", "B_Heli_EC_03_RF"]];


if (isServer) then {

	["ace_explosives_detonate", {
		params ["_unit", "_item1", "_item2"];

		if (_item1 inArea trg_submarine &&
			!(missionNameSpace getVariable ["GRAD_SUBMARINE_DESTROYED", false])) then {
				[hms_proteus] call PV_submarine_fnc_destroy;
		};
		
		diag_log format ["submarine detonation: unit: %1, item1: %2, item2: %3", _unit, _item1, _item2];

	}] call CBA_fnc_addEventhandler;

	["ace_explosives_defuse", {
		params ["_explosive", "_unit"];

		// stop countdown
		if (typeof _explosive == "vn_mine_limpet_01_ammo") then {
			missionNameSpace setVariable ["GRAD_SUBMARINE_COUNTDOWN_STOPPED", true, true];
		};

	}] call CBA_fnc_addEventhandler;


	// make kraken hq units silent
	{
		if (_x inArea trg_kraken_hq) then {
			_x disableAI "RADIOPROTOCOL";
		};
	} count allUnits;

};
