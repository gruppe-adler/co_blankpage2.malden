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







/// KRAKEN 

["BLANK PAGE - KRAKEN", "1 - Initial Briefing",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. Your objective is to locate the lost submarine in the AO. It was originally deployed to recover a manned space capsule containing sensitive intelligence, which is now stuck underwater nearby. We cannot afford to let this intel and personnel fall into enemy hands. Your radiation expert can track the capsule's exact location. Expect enemy forces, hostile divers, and potential underwater mines in the area. SEAWATCH will assist with mine clearance. Switch to frequency 50.0 MHz to coordinate with SEAWATCH. Your priority is to neutralize hostiles while SEAWATCH focuses on recovering the capsule. Command, out.", 
        "kraken_1", 
        42,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "2 - Sabotage Sub",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. New orders. You are to weld shut all hatches on the submarine and space capsule immediately. This mission's confidentiality is critical—no one, including SEAWATCH, can know about these actions. After sealing the hatches, your main objective is to destroy the submarine by planting explosives at key points to eliminate any evidence. SEAWATCH casualties are unacceptable. You must find a way to convince SEAWATCH to evacuate the area before detonation. Ensure they remain unaware of your true intentions and provide any tactical reasoning necessary to clear them out. SEAWATCH must be gone before you blow the sub. Command, out.", 
        "kraken_2", 
        44,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "3 - Good job on sub",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. Great job. The submarine is destroyed, and the area is secure. For now, return to base. You will receive further instructions as we gather more intel. Keep communication channels open and be ready to mobilize on short notice. Command, out.", 
        "kraken_3", 
        16,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "4 - Follow Seawatch",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. New orders. SEAWATCH has slingloaded the space capsule and is moving it to an unknown location. Your objective is to track it using your radiation expert to determine where SEAWATCH is deploying it and where the sensitive intel is headed. Do not engage SEAWATCH under any circumstances. They are unaware of your mission, and direct conflict could compromise everything. Be alert for increased enemy contacts, as hostile forces may attempt to intercept the capsule. Stay covert, track closely, and report the final destination. Command, out.", 
        "kraken_4", 
        39,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "5 - Protect SW, kill astro",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. New orders. SEAWATCH has secured the space capsule, but enemy forces are closing in. Your immediate objective is to defend SEAWATCH and the capsule from hostile attacks and ensure their safe extraction. Additionally, the rescued astronaut must be eliminated discreetly, without raising SEAWATCH's suspicions. Your primary focus remains on defending SEAWATCH from the enemy. Command, out.", 
        "kraken_5", 
        26,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "6 - Lay trap",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. New directive. Proceed to the resupply point at Grid Reference 094 070 for essential resupplies and equipment replenishment. The area has been secured by our forces. Command out.", 
        "kraken_6", 
        15,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "7 - Deny accusations",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. We’ve intercepted a transmission from SEAWATCH accusing us of laying a trap for your unit. This is a tactic to deflect from their own actions. Stay vigilant and focused on our objectives. Do not engage with SEAWATCH or act on their claims. Trust your training and stay on mission. Command, out.", 
        "kraken_8", 
        9,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN", "8 - Help defend HQ",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. We are under heavy attack and need immediate assistance. Return to base immediately and reinforce our defenses. Command, out.",
        "kraken_7", 
        24,
        true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN DEBRIEF", "SUCCESS",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is Command. Outstanding work. You’ve eliminated the threat posed by rogue KRAKEN Command, and completed all objectives. Standby for extraction. Debrief via Teamspeak when you're back in base. Command, out.", 
        "kraken_debrief", 
        15,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - KRAKEN DEBRIEF", "FAIL",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is KRAKEN Command. You failed not only your mission but our country. Shame on you, if anyone of you is still alive, you pathetic losers. Command, out.", 
        "kraken_debrief_fail", 
        11,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;







/// SEAWATCH 

["BLANK PAGE - SEAWATCH", "1 - Initial Briefing",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Command. Your first objective is to locate the sunken submarine and the space capsule.  The capsule is currently stuck underwater in an unknown condition, and the submarine was initially tasked with locating and evacuating the crew. Intelligence reports indicate that enemy forces are present in the area, posing a significant threat during your mission.Be aware of potential hostile divers in the water, as well as underwater mines that may obstruct your path. KRAKEN is on standby to provide support in securing the AO. Maintain close communication with KRAKEN on 50.0 MHz.Prioritize defusing any mines encountered and engage enemy forces only when necessary. Command, out.", 
        "seawatch_1", 
        46,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;


["BLANK PAGE - SEAWATCH", "2 - Transport Capsule",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Command. Situation Update: It has come to our attention that there is the possibility of KRAKEN trying to blow up the submarine. We are currently trying to figure out, why those orders might have been given. This was not part of the plan.Therfore, we will proceed without KRAKEN for the time being. Your primary focus now, is on slingloading the space capsule and safely transporting it to the laboratory located at Grid Reference 097 039. Rescue the trapped astronaut inside the capsule by dropping it into the roofless dome and grind it open afterwards.To ensure operational security and prevent KRAKEN from intervening, you should maintain radio silence during this phase of the mission. Command, out.", 
        "seawatch_2", 
        49,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - SEAWATCH", "3 - Extract Intel",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Command. Interrogate the astronaut as soon as possible. Extract any intel and upload it in the data processing room. In addition to the interrogation, you must prepare to defend the laboratory from inbound enemy airborne troops. Intelligence indicates an attack is imminent, and we must secure the facility and the sensitive intel within.Communication with KRAKEN is allowed again; coordinate with them as needed to ensure a successful defense. Stay alert and prioritize both the interrogation and the laboratory's security. Command, out.", 
        "seawatch_3", 
        37,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - SEAWATCH", "4 - Attack KRAKEN HQ",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Command. We've decrypted the intel from the capsule and it contains alarming information: KRAKEN's commander has been compromised. He has committed treason and is operating under rogue orders. KRAKEN seems to be unknowingly following his lead. Your mission has changed. You are to proceed to KRAKEN Command’s location at grid coordinates 107 120. Engage and neutralize the rogue commander. However, do your best to inform KRAKEN of the situation before hostilities break out. If you can convince them of the commander’s true intentions, they may support your assault. Mission priority is eliminating KRAKEN Command, but avoid friendly casualties if possible. Command out.", 
        "seawatch_4", 
        49,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - SEAWATCH", "5 - Convince KRAKEN",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["KRAKEN, this is SEAWATCH Command. We’ve accessed KRAKEN Command’s internal frequency and discovered they may have gone rogue, planning a trap to eliminate your unit due to your insider knowledge. Your safety is compromised. We urge you to reconsider your allegiance. SEAWATCH is committed to your safety and our shared objectives. Coordinate with us to prepare an attack on KRAKEN HQ to restore order. SEAWATCH Command, out.", 
        "seawatch_kraken", 
        29,
        true, true
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - SEAWATCH DEBRIEF", "SUCCESS",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Command. Outstanding work. You’ve protected the intel, eliminated the threat posed by rogue KRAKEN Command, and completed all objectives. Standby for extraction. Debrief via Teamspeak when you're back in base. Command, out.", 
        "seawatch_debrief", 
        18,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;

["BLANK PAGE - SEAWATCH DEBRIEF", "FAIL",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

    [
        ["SEAWATCH, this is Seawatch Command. You failed not only your mission but our country. Shame on you, if anyone of you is still alive, you pathetic losers. Command, out.", 
        "seawatch_debrief_fail", 
        11,
        false
    ], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;








/// CUSTOM TRANSMITS

["BLANK PAGE - KRAKEN", "KRAKEN Custom Transmit",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send to KRAKEN", "Your message for public briefing"]], {
			params [["_message", "..."], "_position"]; 
      
            [[_message#0, "none", 6, true], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;



["BLANK PAGE - SEAWATCH", "SEAWATCH Custom Transmit",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  ["Example Dialog", [["EDIT", "Intel to send to SEAWATCH", "Your message for public briefing"]], {
			params [["_message", "..."], "_position"]; 
      
            [[_message#0, "none", 6, false], "USER\rscMessage\createMessageRsc.sqf"] remoteExec ["BIS_fnc_execVM"];
  
  }, { systemchat "cancelled"; }, _position] call zen_dialog_fnc_create;  

}] call zen_custom_modules_fnc_register;


// Trigger Air-Raid at objective 2
["BLANK PAGE", "Objective 2 - Air-Raid",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  [] call BP_OBJ2_fnc_launchAttack_Air;
}] call zen_custom_modules_fnc_register;



["BLANK PAGE EXTRACTION", "Spawn Submarine here",
{
  params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];

  _position = ASLtoAGL _position;

  // global for FX
  [[_position], "USER\scripts\submarineSurface.sqf"] remoteExec ["BIS_fnc_execVM"];

}] call zen_custom_modules_fnc_register;