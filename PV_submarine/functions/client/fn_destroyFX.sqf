params ["_submarine"];

private _pos = getPos _submarine;
_pos set [2, 0.5];

/* shockwave */
_shockwave = "#particlesource" createVehicleLocal _pos;
_shockwave setPosASL _pos;
_shockwave setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1,0,1], "", "Billboard", 1, 10, [0, 0, 0], 
[0, 0, 0], 
0, 10, 7.9, 0.01, [50, 50, 50], 
[[1, 1, 1, 1], [1, 1, 1, 0.5], [1, 1, 1, 0]], 
[0.125], 1, 0, "", "", ""];
_shockwave setParticleRandom [2, [70, 70, 70], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 360];
_shockwave setParticleCircle [50, [-80, -80, 2.5]];
_shockwave setDropInterval 0.0002;

sleep 0.1;

deleteVehicle _shockwave;

sleep 1;

addCamShake [10, 1, 25];