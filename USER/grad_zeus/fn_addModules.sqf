[] spawn {
  waitUntil {!isNull player};
  waitUntil {  time > 3 };

  {
    private _curator = _x;
    
      _curator addEventHandler ["CuratorGroupPlaced", {
          params ["", "_group"];

          ["GRAD_missionControl_setServerAsOwner", [_group]] call CBA_fnc_serverEvent;
      }];

      _curator addEventHandler ["CuratorObjectPlaced", {
          params ["", "_object"];

          if (_object isKindOf "CAManBase") then {
             if (count units _object == 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group _object]] call CBA_fnc_serverEvent;
             };
          } else {
             if (count crew _object > 1) then {
                 ["GRAD_missionControl_setServerAsOwner", [group (crew _object select 0)]] call CBA_fnc_serverEvent;
             };
         };

      }];

  } forEach allCurators;
};


//////////////
////////////// CALLS
//////////////

["STO LEVIV - CALLS", "Ad hoc intel call (Input)",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send via call", "Your message for public briefing"]], {
			params ["_message", "_position"]; 
      
      private _nearestPhone = objNull;
      private _nearestPhoneIndex = 0;
      private _allNumbers = missionNamespace getVariable ['GRAD_TELEPHONE_ALLNUMBERS', []];
      {
          private _phoneObjects = _x select 1;
          private _numberIndex = _forEachIndex;

          {
              private _phoneObject = _x;
              private _positionPhoneObject = position _x;

              if (isNull _nearestPhone) then {
                  _nearestPhone = _phoneObject;
              };

              if (_positionPhoneObject distance2D _position < (position _nearestPhone) distance2D _position) then {
                  _nearestPhone = _phoneObject;
                  _nearestPhoneIndex = _numberIndex;
              };
          } forEach _phoneObjects;
      } forEach _allNumbers;

      if (count _allNumbers < 1) exitWith { systemChat "No phones on map"; };

      [_nearestPhone, "GRAD_garble_long", _message#0] remoteExec ["GRAD_telephone_fnc_fakeCallPhone", 2];   
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;


["BLANK PAGE", "Destroy Submarine",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  if (!isNil "hms_proteus") then {
         [hms_proteus] remoteExec ["PV_submarine_fnc_destroy", 2];
  } else {
     "No submarine found" call CBA_fnc_notify;
  };


}] call zen_custom_modules_fnc_register;

["BLANK PAGE", "Radio Call Kraken - destroy Submarine",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        [
            "KRAKEN COMMAND",
            "Kraken,",
            "New directives. The submarine is compromised, and its contents pose a security risk. Your mission is as follows:",
            "Destroy the submarine—plant charges and ensure no evidence of external involvement.",
            "Eliminate any civilian witnesses—all nearby individuals are considered compromised.",
            "Retrieve the blackbox and transport it to Outpost Delphi [Coordinates attached] for extraction.",
            "Maintain radio silence until you arrive at the outpost.",
            "Discretion is paramount. Eliminate all traces and secure the asset. Mission failure is not an option.",
            "Command out."
        ]
    ] remoteExec ["grad_zeus_fnc_formatRadioMessage"];


}] call zen_custom_modules_fnc_register;


["BLANK PAGE", "KRAKEN Custom Transmit",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send to KRAKEN", "Your message for public briefing"]], {
			params [["_message", "..."], "_position"]; 
      
            [[_message#0, "", true], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;



["BLANK PAGE", "SEAWATCH Custom Transmit",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send to SEAWATCH", "Your message for public briefing"]], {
			params [["_message", "..."], "_position"]; 
      
            [[_message#0, "", false], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;