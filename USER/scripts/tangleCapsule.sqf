params ["_object"];

if (isServer) then { 
	_object setMass 40000; 
	_object enableRopeAttach false;
	[_object] execVM "USER\scripts\addFakeCapsuleDoor.sqf";
	_object allowDamage false;
};



[{

    {
        private _id = [_x, ["\a3\ui_f\data\igui\cfg\actions\returnflag_ca.paa", [1,1,1,1], position _this, 1, 1, 45, "Capsule", 1, 0.05, "TahomaB"], false] call BIS_fnc_addCuratorIcon;
    } forEach allCurators;
}, _object, 10] call CBA_fnc_waitAndExecute;