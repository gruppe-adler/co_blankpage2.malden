if (!isServer) exitWith {};

// curator infos
["missionControl_curatorInfo", {
    params ["_unit", "_type", "_text"];

    private _message = "";
    private _color = [0,0,0,1];

    switch (_type) do {
        case ("unconscious"): {
            _message = format ["%1 was knocked out.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.5,0.1,0.1,1];

            [_unit, false] remoteExec ["allowDamage", _unit];
        };
        case ("revived"): {
            _message = format ["%1 got revived.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.5,1];

             [_unit, true] remoteExec ["allowDamage", _unit];
        };
        case ("respawned"): {
            _message = format ["%1 respawned.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.1,0.5,0.1,1];
        };
        case ("killed"): {
            _message = format ["%1 killed.", [_unit, false, true] call ace_common_fnc_getName];
            _color = [0.7,0.1,0.1,1];
        };
        case ("segmentintel"): {
            _message = format ["%1 got segment intel: %2", [_unit, false, true] call ace_common_fnc_getName, _text];
            _color = [0.7,0.1,0.1,1];
        };
        case ("customintel"): {
            _message = format ["%1 got private intel: %2", [_unit, false, true] call ace_common_fnc_getName, _text];
            _color = [0.7,0.1,0.1,1];
        };
        case ("susvalue"): {
            _message = format ["%1 : %2", [_unit, false, true] call ace_common_fnc_getName, _text];
            _color = [0.7,0.1,0.1,1];
        };
        default {
            _message = format ["%1 got input intel: %2", [_unit, false, true] call ace_common_fnc_getName, _text];
            _color = [0.7,0.1,0.1,1];
        };
    };

    // send message to all curators
    {
        private _playerAsZeus = getAssignedCuratorUnit _x;
        if (!isNull _playerAsZeus) then {
            [_message, _color] remoteExec ["grad_zeus_fnc_curatorShowFeedbackMessage", _playerAsZeus];
        };
    } forEach allCurators;
}] call CBA_fnc_addEventHandler;


["GRAD_telephone_callStart", {
    params ["_player1", "_player2"];


    // send message to all curators
    {
        private _playerAsZeus = getAssignedCuratorUnit _x;
        if (!isNull _playerAsZeus) then {
            private _namePlayer1 = _player1 getVariable ['ACE_name', 'no name'];
            private _namePlayer2 = _player2 getVariable ['ACE_name', 'no name'];
            private _color = [0.1,0.5,0.1,1];
            [(_namePlayer1 + " call STARTED with " + _namePlayer2), _color] remoteExec ["grad_zeus_fnc_curatorShowFeedbackMessage", _playerAsZeus];
        };
    } forEach allCurators;
}] call CBA_fnc_addEventHandler;


["GRAD_telephone_callEnded", {
    params ["_player1", "_player2"];

    // send message to all curators
    {
        private _playerAsZeus = getAssignedCuratorUnit _x;
        if (!isNull _playerAsZeus) then {
            private _namePlayer1 = _player1 getVariable ['ACE_name', 'no name'];
            private _namePlayer2 = _player2 getVariable ['ACE_name', 'no name'];
            private _color = [0.1,0.5,0.1,1];
            [(_namePlayer1 + " call ENDED with " + _namePlayer2), _color] remoteExec ["grad_zeus_fnc_curatorShowFeedbackMessage", _playerAsZeus];
        };
    } forEach allCurators;
}] call CBA_fnc_addEventHandler;

