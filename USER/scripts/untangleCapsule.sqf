params ["_object"];

if (isServer) then { 
	[_object,[0,0,0.1]] remoteExec ["setVelocityModelSpace", _object];
	[_object,4000] remoteExec ["setMass", _object]; 
	[_object,true] remoteExec ["enableRopeAttach", _object];
	_object setVariable ["GRAD_isUntangled", false, true];
};
