/// @description This state is the "root" state for the player. From here they can move around the game world, 
/// interact with objects, ready their equipped weapon, toggle their flashlight, and so on.

// Calculate input magnitude and direction
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
inputDirection = point_direction(0, 0, (keyRight - keyLeft), (keyDown - keyUp));

// Handle delta time movement and collisions
var _velocity = update_position(inputMagnitude, inputDirection);
movable_block_collision();
entity_world_collision(false);

// Interacting with objects in the game world
if (keyInteract){
	// Check and see if there's an object in front of the player that can actually be interacted with
	var _object = instance_place(x + lengthdir_x(6, direction), (y - 4) + lengthdir_y(6, direction), par_interactable);
	if (_object != noone){
		with(_object){ // If possible to interact with, execute the object's associated script
			if (canInteract /*&& script_exists(interactionScript)*/){
				show_debug_message("INTERACTED WITH!");
				//script_execute(interactionScript);
			}
		}
	}
}

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