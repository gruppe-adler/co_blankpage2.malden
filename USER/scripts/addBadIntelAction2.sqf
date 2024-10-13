params ["_intel"];


private _text = "
 \nTOP SECRET\n\n
From: Office of Naval Intelligence, Financial Surveillance Division\n
To: [Redacted]\n
Subject: Financial Transfers – Kraken Command\n
Date: 2035-04-01\n\n
Summary of Transactions:\n\n
Transaction 1:\n
Sender: Igor Volkov (Russian Armed Forces, Special Account 3221)\n
Receiver: Offshore Account #8412 [Name Redacted]\n
Amount: $250,000 USD\n
Date: Date: 2035-04-03\n
Note: Operation Kraken – Initial Phase\n\n
Transaction 2:\n
Sender: Igor Volkov (Russian Armed Forces, Special Account 3221)\n
Receiver: [Redacted American Bank Account #XXXX]\n
Amount: $500,000 USD\n
Date: Date: 2035-05-27\n
Note: Recon Reports and Movement Intel – Cleared for Kraken\n\n
Transaction 3:\n
Sender: Volkov Holdings (Russian Front Company)\n
Receiver: [Redacted]\n
Amount: $150,000 USD\n
Date: 2035-06-01\n
Note: Completion Bonus – Operation Success Pending\n
";




private _texture = "#(rgb,2048,2048,3)text(0,0,""LucidaConsoleB"",0.025,""#000000"",""#33ff33""," + _text + ")";

_intel setvariable ["bis_fnc_initInspectable_data",[_texture,_text,"",1]];

_intel setObjectTexture ["monitor", _texture];
_intel setObjectTexture ["pad", "data\putin.paa"];


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
	{ [] spawn {
			for "_i" from 1 to 2 do { 
				playSound3D [getMissionPath "USER\sounds\" + selectRandom ["keypad_1", "keypad_2", "keypad_3"] + ".ogg", player, false, getPosASL player, 5] remoteExec ["say3D", 20];
				sleep (0.05 + random 0.05);
		 	};
		};
		true
	}, 
	{
		params ["_target"];

		 private _text = "\n\n\n\n   A problem has been detected, and Windows has been
		\n   shut down to prevent damage to your computer.\n\n
		   Technical Information:\n\n   *** STOP: 0x000000FE (0x00000008, 0x00000006,\n 0x00000009, 0x847075cc):\n\n
	\n
	";
	

	
	private _texture = "#(rgb,2048,2048,3)text(1,1,""LucidaConsoleB"",0.025,""#0000ff"",""#ffffff""," + _text + ")";

	_target setvariable ["bis_fnc_initInspectable_data",[_texture,_text,"",1], true];

	_target setObjectTextureGlobal ["monitor", _texture];

	["Destroyed evidence.", 1, [1,1,1,1], true] call CBA_fnc_notify;

	["GRAD_intelDestroyed2", []] call CBA_fnc_globalEvent;

},
 { ["Aborted destruction", 1, [1,1,1,1], true] call CBA_fnc_notify; }, 
 [], 10, nil, false, false 
] call BIS_fnc_holdActionAdd;
