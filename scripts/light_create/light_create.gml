/// @description Initializes a new light and checks if any non-interactable objects are within range of it
/// that currently cannot be interacted with.
/// @param radiusX
/// @param radiusY
/// @param strength
/// @param color
/// @param trueLight

var _radiusX, _radiusY, _strength, _color, _trueLight
_radiusX = argument0;
_radiusY = argument1;
_strength = argument2;
_color = argument3;
_trueLight = argument4;

// Set all of the light's member variables
radius = [_radiusX, _radiusY];
strength = _strength;
color = _color;
trueLight = _trueLight;