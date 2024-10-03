params ["_position"];

private _particleSource = "#particlesource" createVehicleLocal _position;
_particleSource setParticleClass "WaterWaveMen";
_particleSource setDropInterval 1;
_particleSource spawn { 
	
	waitUntil { missionNameSpace getVariable ["GRAD_SUBMARINE_DESTROYED", false] };
 	deleteVehicle _this; 

};

