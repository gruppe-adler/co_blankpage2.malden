/*
*   Wird zum Missionsstart auf Server und Clients ausgeführt.
*   Funktioniert wie die init.sqf.
*/

[] execVM "user\scripts\createRadioChannels.sqf";

// make KRAKEN HQ visible for kraken only
if (player getVariable ["GRAD_isKraken", false]) then {
	"mrk_kraken_hq" setMarkerAlphaLocal 1;
};
