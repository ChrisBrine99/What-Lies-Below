/// @description This state is the "root" state for the player. From here they can move around the game world, 
/// interact with objects, ready their equipped weapon, toggle their flashlight, and so on.

// Calculate input magnitude and direction
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
inputDirection = point_direction(0, 0, (keyRight - keyLeft), (keyDown - keyUp));

// Handle delta time movement and collisions
var _velocity = update_position(inputMagnitude, inputDirection);
movable_block_collision();
entity_world_collision(false);

// Set the sprite and uses the default animation
var _oldSprite = sprite_index;
if (inputMagnitude != 0){ // Player is moving; play walk animation
	direction = inputDirection;
	sprite_index = walkSprite;
} else{
	sprite_index = idleSprite;
}
// If the sprite was changed; reset the local frame to avoid odd animation bugs
if (_oldSprite != sprite_index){
	localFrame = 0;
}

// Calculate image speed and animate the current frame
image_speed = point_distance(0, 0, _velocity[X], _velocity[Y]) * sprite_get_speed(sprite_index);
entity_default_animate();