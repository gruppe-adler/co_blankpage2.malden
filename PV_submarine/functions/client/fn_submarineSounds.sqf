params ["_submarine"];

private _bongs = ["bongs1","bongs2","bongs3","bongs4"];

private _bongLoop = [{
    params ["_args", "_handle"];
    _args params ["_submarine", "_bongs"];

    if (random 1 > 0.7) then {
        _submarine say3d (selectRandom _bongs);
    };

}, 0.5, [_submarine, _bongs]] call CBA_fnc_addPerFrameHandler;

private _screamLoop = [{
    params ["_args", "_handle"];
    _args params ["_submarine"];

    _submarine say3d "screams2";

}, 40, [_submarine]] call CBA_fnc_addPerFrameHandler;



[{
    params ["_submarine"];
    missionNameSpace getVariable ["GRAD_SUBMARINE_DESTROYED", false]
},{
        params ["_submarine", "_bongLoop", "_screamLoop"];

        [_bongLoop] call CBA_fnc_removePerFrameHandler;
        [_screamLoop] call CBA_fnc_removePerFrameHandler;
}, [_submarine, _bongLoop, _screamLoop]] call CBA_fnc_waitUntilAndExecute;