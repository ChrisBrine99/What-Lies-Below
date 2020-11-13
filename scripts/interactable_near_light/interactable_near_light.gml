/// @description Checks if an interactable object is near enough to a light to be seen by the player. However,
/// this check will be ignored if the current lighting level is bright enough for the player to actually see
/// it properly.

// Reset the canInteract flag before re-calculating interactability.
canInteract = false;

// Calculate if distance between position and light source if smaller than the light's radius
var _x, _y, _closestLight, _closestDist, _distance;
_x = x;
_y = y;
_closestLight = noone;
with(obj_light){
	if (!trueLight){ // Ignore lights that aren't part of the environment
		continue;
	}
	// If no closest light exists; instantly set it to the first one that runs this code
	if (_closestLight == noone){
		_closestLight = id;
		_closestDist = point_distance(_x, _y, x, y);
		continue;
	}
	// Check distance between current light and the _closestLight's distance
	_distance = point_distance(_x, _y, x, y);
	if (_distance < _closestDist){
		_closestLight = id;
		_closestDist = _distance;
	}
}
// Store the closest light's instance ID
closestLight = _closestLight;

// Calculate the radius of the light relative to the angle calculated between the light source and the interactable's positions.
// The resulting value will be used to determine if the interactable is close enough to the light to be interacted with without
// the need to use a flashlight.
var _radius, _angleFromLight, _radiusAtAngle;
_radius = [closestLight.radius[X], closestLight.radius[Y]];
_angleFromLight = degtorad(point_direction(x, y, closestLight.x, closestLight.y));
_radiusAtAngle = (_radius[X] * _radius[Y]) / sqrt(power(_radius[X] * sin(_angleFromLight), 2) + power(_radius[Y] * cos(_angleFromLight), 2));
// If the interactable is within the light's radius, let it be interacted with
if (_closestDist <= _radiusAtAngle){
	canInteract = true;
}