/// @description Condenses the calculation for hspd and vspd, removal of fraction values, and a check for 
/// collision with the world. Finally, the _hspd and _vspd values are returned for any external use. 
/// (Ex. image_speed)
/// @param magnitude
/// @param direction

var _magnitude, _direction;
_magnitude = argument0;
_direction = argument1;

// Store the non-delta time movement for the current frame
var _hspd, _vspd;
_hspd = lengthdir_x(_magnitude * maxHspd, _direction);
_vspd = lengthdir_y(_magnitude * maxVspd, _direction);

// Apply delta time to the frame's movement; remove fractional value
hspd = _hspd * global.deltaTime;
vspd = _vspd * global.deltaTime;
remove_movement_fractions();

// Return the _hspd and _vspd values as a 2D vector
return [_hspd, _vspd];