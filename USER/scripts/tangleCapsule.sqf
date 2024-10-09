params ["_object"];

if (isServer) then { 
	_object setMass 40000; 
	_object enableRopeAttach false;
	[_object] execVM "USER\scripts\addFakeCapsuleDoor.sqf";
};

