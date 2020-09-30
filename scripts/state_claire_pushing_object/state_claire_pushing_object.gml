/// @description This state is for whenever the player is pushing around a movable "Wall" in the room. This can
/// be anything for furniture, to boxes, and so on. If the player changes movement directions while in this
/// state, they will return to their previous state.

// Calculate movement based on 4 directions instead of the standard 8 directions
var _xMovement, _yMovement;
_xMovement = ((keyRight - keyLeft != 0) && !keyUp && !keyDown);
_yMovement = ((keyDown - keyUp != 0) && !keyRight && !keyLeft);
inputMagnitude = _xMovement || _yMovement;
inputDirection = point_direction(0, 0, (keyRight - keyLeft) * _xMovement, (keyDown - keyUp) * _yMovement);

// If the player released the held movement key of they are no longer pushing in the direction of the object, 
// release the pushed object and return to the previous state.
if (inputMagnitude == 0 || pushedDirection != inputDirection){
	with(pushedObjectID){ // Reset velocity variables for the pushed block
		hspdFraction = 0;
		vspdFraction = 0;
	}
	pushedObjectID = noone;
	set_cur_state(state_claire_entering_push);
	return;
}

// Calculate the current frame's movement
var _velocity = update_position(inputMagnitude, inputDirection);

// Apply movement to the block before checking for collision with the player object
with(pushedObjectID){
	// Set movement velocity relative to the object's weight
	_velocity = [_velocity[X] / weight, _velocity[Y] / weight];
	hspd = _velocity[X] * global.deltaTime;
	vspd = _velocity[Y] * global.deltaTime;
	// Remove fractions from velocity and check collision
	remove_movement_fractions();
	entity_world_collision(false);
}

// Finally, check for collision between the player object and the world
entity_world_collision(false);

// Animate pushing the object by using the default animation system
direction = pushedDirection;
sprite_index = walkSprite;
image_speed = point_distance(0, 0, _velocity[X], _velocity[Y]) * sprite_get_speed(sprite_index);
entity_default_animate();