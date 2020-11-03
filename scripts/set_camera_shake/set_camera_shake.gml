/// @description Applies a shake effect to the camera with a strength and time of shake being equal to the 
/// values provided in the arguments of the function call. If the strength isn't higher than the current 
/// shake's magnitude it will not be overwritten. (1 second = 60)
/// @param strength
/// @param length

var _strength, _length;
_strength = argument0;
_length = argument1;

with(global.controllerID){
	if (shakeMagnitude < _strength){
		shakeMagnitude = _strength;
		shakeStrength = _strength;
		shakeLength = _length;
	}
}