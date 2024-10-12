params ["_submarine"];

private _position = getPos _submarine;
_position = [_position#0, _position#1, 0.5];

private _brightness    = 1.0;
private _color    = [1,0.85,0.6];
private _ambient    = [1,0.85,0.6];
private _intensity    = 3000;
private _attenuation    = [0,0,0,1.6];

private _light = "#lightpoint" createVehicle [0,0,0];
_light setPosASL _position;
//_light setPosATL _pos;
 
_lightflaresize = 500;

_light setLightDayLight true;
_light setLightUseFlare true;
_light setLightFlareMaxDistance 1000;
_light setLightFlareSize 1000;
_light lightAttachObject [player, [0,3,3]];
_light setLightBrightness _brightness;
_light setLightColor _color;
_light setLightAmbient _ambient;
_light setLightIntensity _intensity;
_light setLightAttenuation _attenuation;

while {!alive _light} do {
  _light setLightFlareSize (_lightflaresize-1);
};


[{
    deleteVehicle (_this select 0);    
}, [_light], 0.1] call CBA_fnc_waitAndExecute;