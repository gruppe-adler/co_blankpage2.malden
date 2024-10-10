// pixel grids macros
#define UI_GRID_W (pixelW * pixelGrid)	// one grid width
#define UI_GRID_H (pixelH * pixelGrid)	// one grid height
#define UI_GUTTER_W (pixelW * 2)		// gutter width  of 2 pixels
#define UI_GUTTER_H (pixelH * 2)		// gutter height of 2 pixels

// sizes for our control
#define BOX_W (UI_GRID_W * 12) // control is 12 grids wide
#define BOX_H (UI_GRID_H * 12)  // control is 5 grids high

params ["_message", ["_sound", "none"], ["_isKraken", true], ["_seawatchToKraken", false]];

private _playerKraken = player getVariable ["GRAD_isKraken", false];

if (_isKraken != _playerKraken) exitWith {
	diag_log "message received but not for my team. ignoring message.";
};

private _display = (if (is3DEN) then {findDisplay 313} else {[] call BIS_fnc_displayMission}) createDisplay "RscDisplayEmpty";

private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
_ctrlGroup ctrlSetPosition [safeZoneX, safeZoneY+BOX_H, safeZoneW, safeZoneH];

_ctrlGroup ctrlCommit 0;
_ctrlGroup ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
_ctrlGroup ctrlCommit 0.2;

private _ctrlBackground = _display ctrlCreate ["RscTextMulti", -1, _ctrlGroup];
_ctrlBackground ctrlSetPosition [0, safeZoneH - BOX_H, safeZoneW, BOX_H];
_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.6];
_ctrlBackground ctrlSetText "ENTER TEXT:";
_ctrlBackground ctrlEnable false;
_ctrlBackground ctrlCommit 0;

private _estimatedTextWidth = _message getTextWidth ["PuristaMedium", 2];
private _ctrlMessage = _display ctrlCreate ["RscStructuredText", -1, _ctrlGroup];
_ctrlMessage ctrlSetPosition [safeZoneW, safeZoneH - BOX_H/1.7, _estimatedTextWidth, BOX_H];
_ctrlMessage ctrlSetStructuredText parseText ("<t size='2'>" + _message + "</t>");
_ctrlMessage ctrlCommit 0;

private _ctrlAdditionalText = _display ctrlCreate ["RscStructuredText", -1, _ctrlGroup];
_ctrlAdditionalText ctrlSetPosition [0, safeZoneH - BOX_H/1.02, safeZoneW*2, BOX_H];
_ctrlAdditionalText ctrlSetStructuredText parseText ("<t size='1' font='EtelkaNarrowMediumPro' color='#666666'>- TRANSMISSION INCOMING - CONFIDENTIAL - DO NOT SHARE WITH OTHER TEAMS - TRANSMISSION INCOMING - CONFIDENTIAL - DO NOT SHARE WITH OTHER TEAMS - TRANSMISSION INCOMING - CONFIDENTIAL - DO NOT SHARE WITH OTHER TEAMS - TRANSMISSION INCOMING - CONFIDENTIAL - DO NOT SHARE WITH OTHER TEAMS - TRANSMISSION INCOMING - CONFIDENTIAL - DO NOT SHARE WITH OTHER TEAMS - </t>");
_ctrlAdditionalText ctrlCommit 0; 

private _textWidth = ctrlTextWidth _ctrlMessage;
_ctrlMessage ctrlSetPosition [-_textWidth, safeZoneH - BOX_H/1.5, BOX_W*2, BOX_H];

private _ctrlImage = _display ctrlCreate ["RscPicture", -1, _ctrlGroup];
_ctrlImage ctrlSetPosition [0, safeZoneH - BOX_H, BOX_W*2, BOX_H];

if (_isKraken && !_seawatchToKraken) then {
	_ctrlImage ctrlSetText "USER\rscMessage\kraken_cmd.paa";	
} else {
	_ctrlImage ctrlSetText "USER\rscMessage\seawatch_cmd.paa";
};
_ctrlImage ctrlCommit 0;

private _sender = if (_isKraken && !_seawatchToKraken) then { "KRAKEN CMD" } else { "SEAWATCH CMD" };
player createDiaryRecord ["Diary", [_sender + " - " + ([dayTime, "HH:MM"] call BIS_fnc_timeToString), _message], taskNull, "NONE", true];

playSoundUI ["remote_start"];

private _soundID = objNull;

if (_sound == "none") then {
	[] spawn {
		sleep 1.5;
		_soundID = playSoundUI ["garble_long"];
	};
} else {
	_soundID = playSoundUI [_sound];
};

private _duration = _textWidth * 100;
_ctrlMessage ctrlCommit _duration;


[_ctrlGroup, _display, _duration] spawn {
	params ["_ctrlGroup", "_display", "_duration"];

	playSound "remote_end";

	sleep _duration;
	_ctrlGroup ctrlSetPosition [safeZoneX, safeZoneY+BOX_H, safeZoneW, safeZoneH];
	_ctrlGroup ctrlCommit 0.2;
	uiSleep 0.2;
	_display closeDisplay 1;
};
