params ["_intel"];


private _text = "
\n TOP SECRET\n\n
From: kraken.command@[redacted].gov\n
To: iv.volkov@russianmil.ru\n
Date: [Mission date - 4 weeks]\n
Subject: Operational Support - Phase 2\n\n

Message:\n\n

Our surveillance teams have completed the recon on the American\n
convoy schedule. You will receive full details on the movements\n
in two days. Ensure your teams stay clear of our patrols until the\n
assault begins. I will continue to divert attention away from the\n
northern sector.\n\n

My superiors remain unaware of our cooperation, but I require further\n
payment before we can proceed with Phase 3. We are nearing the final\n
stages, and once the package is delivered, our arrangement will be\n
complete. Make sure the funds are transferred immediately.\n\n

I trust you will handle this with your usual discretion.\n\n
----\n\n
Reply from Volkov:\n\n
Funds will be transferred by the end of the week. Phase 3 is\n
already being prepped. Remember, this operation benefits both\n
of us. Stay the course, and you will have more than just money\n
when this is done.
";




private _texture = "#(rgb,2048,2048,3)text(0,0,""LucidaConsoleB"",0.02,""#ffffff"",""#000000""," + _text + ")";
_intel setObjectTexture ["camo", _texture];

_intel setvariable ["bis_fnc_initInspectable_data",[_texture,_text,"",1]];

//--- Add action
if (isnil {_intel getvariable "bis_fnc_initInspectable_actionID"}) then {
    private _actionID = [
        //--- 0: Target
        _intel,

        //--- 1: Title
        localize "STR_A3_Functions_F_Orange_Examine",

        //--- 2: Idle Icon
        "\a3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",

        //--- 3: Progress Icon
        "\a3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",

        //--- 4: Condition Show
        "_this distance _target < 3",

        //--- 5: Condition Progress
        nil,

        //--- 6: Code Start
        {},

        //--- 7: Code Progress
        {
            _progressTick = _this select 4;
            if (_progressTick % 2 == 0) exitwith {};
            playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
        },

        //--- 8: Code Completed
        {[_this select 0,true] call bis_fnc_initInspectable;},

        //--- 9: Code Interrupted
        {},

        //--- 10: Arguments
        [],

        //--- 11: Duration
        0.5,

        //--- 12: Priority
        nil,

        //--- 13: Remove When Completed
        false
    ] call bis_fnc_holdActionAdd;
    _intel setvariable ["bis_fnc_initInspectable_actionID",_actionID];
};



[ 
 _intel, 
 "Destroy Intel", 
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
 "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
 "_this distance _target < 3", 
 "_caller  distance _target < 3", 
 { ["Destroying...", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 {  }, 
 {
	params ["_target"];
	playSound3D [getMissionPath "USER\sounds\crumple.ogg", _target, false, getPosASL _target, 5] remoteExec ["say3D", 20];
	hideObjectGlobal _target;
	["Destroyed evidence.", 1, [1,1,1,1], true] call CBA_fnc_notify;

	["GRAD_intelDestroyed1", []] call CBA_fnc_globalEvent;

},
 { ["Aborted destruction", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 [], 10, nil, false, false 
] call BIS_fnc_holdActionAdd;
