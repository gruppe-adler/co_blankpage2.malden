params ["_pos"];

private _source1 = "#particlesource" createVehicleLocal _pos;  
_source1 setPos _pos;  
_source1 setParticleCircle [0, [0, 0, 0]];  
_source1 setParticleRandom [0, [0, 0, 0], [70,70, 50], 1, 3, [0, 0, 0, 0.1], 0, 0];  
_source1 setParticleParams [
    ["\A3\data_f\ParticleEffects\Shard\shard.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 50], 0.1, 1000, 0.01, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source1 setDropInterval 0.0001; 
 

[{ 
    params ["_source1"]; 
    deleteVehicle _source1; 
}, [_source1], 0.1] call CBA_fnc_waitAndExecute;



private _source2 = "#particlesource" createVehicleLocal _pos;  
_source2 setPos _pos;  
_source2 setParticleCircle [0, [0, 0, 0]];  
_source2 setParticleRandom [0, [0, 0, 0], [70,70, 50], 1, 3, [0, 0, 0, 0.1], 0, 0];  
_source2 setParticleParams [
    ["\A3\data_f\ParticleEffects\Shard\shard2.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 50], 0.1, 1000, 0.01, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source2 setDropInterval 0.0001; 
 

[{ 
    params ["_source2"]; 
    deleteVehicle _source2; 
}, [_source2], 0.1] call CBA_fnc_waitAndExecute;


private _source3 = "#particlesource" createVehicleLocal _pos;  
_source3 setPos _pos;  
_source3 setParticleCircle [0, [0, 0, 0]];  
_source3 setParticleRandom [0, [0, 0, 0], [70,70, 50], 1, 3, [0, 0, 0, 0.1], 0, 0];  
_source3 setParticleParams [
    ["\A3\data_f\ParticleEffects\Shard\shard3.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 50], 0.1, 1000, 0.01, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source3 setDropInterval 0.0001; 
 

[{ 
    params ["_source3"]; 
    deleteVehicle _source3; 
}, [_source3], 0.1] call CBA_fnc_waitAndExecute;



private _source4 = "#particlesource" createVehicleLocal _pos;  
_source4 setPos _pos;  
_source4 setParticleCircle [0, [0, 0, 0]];  
_source4 setParticleRandom [0, [0, 0, 0], [70,70, 50], 1, 3, [0, 0, 0, 0.1], 0, 0];  
_source4 setParticleParams [
    ["\A3\data_f\ParticleEffects\Shard\shard4.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 50], 0.1, 1000, 0.01, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source4 setDropInterval 0.0001; 
 

[{ 
    params ["_source4"]; 
    deleteVehicle _source4; 
}, [_source4], 0.1] call CBA_fnc_waitAndExecute;



private _source5 = "#particlesource" createVehicleLocal _pos;  
_source5 setPos _pos;  
_source5 setParticleCircle [0, [0, 0, 0]];  
_source5 setParticleRandom [0, [0, 0, 0], [180, 180, 25], 1, 0.05, [0, 0, 0, 0.1], 0, 0];  
_source5 setParticleParams [
    ["\A3\data_f\ParticleEffects\Shard\shard4.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 45], 0.1, 1000, 0.001, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source5 setDropInterval 0.0001; 


[{ 
    params ["_source5"]; 
    deleteVehicle _source5; 
}, [_source5], 0.1] call CBA_fnc_waitAndExecute;


private _source6 = "#particlesource" createVehicleLocal _pos;  
_source6 setPos _pos;  
_source6 setParticleCircle [0, [0, 0, 0]];  
_source6 setParticleRandom [0, [0, 0, 0], [180, 180, 25], 1, 0.01, [0, 0, 0, 0.1], 0, 0];  
_source6 setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\SparksDot.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 45], 0.1, 1000, 0.001, 0.075, [0.1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source6 setDropInterval 0.0001; 


[{ 
    params ["_source6"]; 
    deleteVehicle _source6; 
}, [_source6], 0.1] call CBA_fnc_waitAndExecute;

/*
private _source7 = "#particlesource" createVehicleLocal _pos;  
_source7 setPos _pos;  
_source7 setParticleCircle [0, [0, 0, 0]];  
_source7 setParticleRandom [0, [0, 0, 0], [180, 180, 25], 1, 0.01, [0, 0, 0, 0.1], 0, 0];  
_source7 setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\SparksBall.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 120, 
    [0, 0, 0.3], [0, 0, 45], 0.1, 1000, 0.001, 0.075, [1, 1, 1], [[0.3, 0.3, 0.3, 1], [0.3, 0.3, 0.3, 0.3], [0.3, 0.3, 0.3, 0]], 
    [0.08], 1, 0, "", "", _this,0,true,0.1
];  
_source7 setDropInterval 0.0001; 


[{ 
    params ["_source7"]; 
    deleteVehicle _source7; 
}, [_source7], 0.1] call CBA_fnc_waitAndExecute;
*/