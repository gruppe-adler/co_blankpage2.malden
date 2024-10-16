params ["_submarine"];

private _position = getPos _submarine;

_position params ["_posX", "_posY"];

private _source01 = "#particlesource" createVehicleLocal [_posX, _posY, 0];
_source01 setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 13, 10, 0], "", "Billboard", 1, 35, 
    [0, 0, 0], [0, 0, 30], 1.6, 75, 0.075, 1, [50, 60, 70, 80, 90, 100], [[0.7,0.7,0.7,0.7],[0.8,0.8,0.8,0.6],[1,1,1,0.5],[1,1,1,0.4],[1,1,1,0.2],[1,1,1,0]], 
    [1000], 1, 0, "", "", _submarine,0,true
];  
_source01 setParticleCircle  [6, [5, 5, 5]];  
_source01 setParticleRandom [0, [0, 0, 0], [1,1, 1], 0.1, 0, [0, 0, 0, 0.1], 0, 0];  
_source01 setDropInterval 0.01;

[{ 
    params ["_source01"]; 
    deleteVehicle _source01; 
}, [_source01], 0.1] call CBA_fnc_waitAndExecute;
