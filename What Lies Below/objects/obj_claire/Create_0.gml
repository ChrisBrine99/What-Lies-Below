/// @description Variable/Method Initialization

#region EDITING INHERITED VARIABLES

event_inherited();
// Set the maximum movement speeds
maxHspdConst = 1.25;
maxVspdConst = 1.25;
maxHspd = maxHspdConst;
maxVspd = maxVspdConst;

// Set the initial maximum hitpoints
maxHitpoints = 20;
hitpoints = maxHitpoints;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// Keyboard input variables for player movement, which can be in 8 different directions.
keyRight = false;
keyLeft = false;
keyUp = false;
keyDown = false;

// Keyboard input variables for interacting with objects/items in the world and toggling the flashlight in-game.
keyInteract = false;
keyFlashlight = false;

// Keyboard input variables for using weaponry while in-game. The first is for firing/attacking with the
// equipped weapon, the second is for readying the weapon for use, the third is for switching the firearm's
// currently used ammunition, and the final one if for reloading the firearm.
keyUseWeapon = false;
keyReadyWeapon = false;
keyChangeAmmo = false;
keyReload = false;

// Holds the cardinal direction for the player's current movement and the magnitude of movement for
// the movement, which is them multiplied by maxHspd or maxVspd, respectively.
inputMagnitude = 0;
inputDirection = 0;

// The sprites for each of the actions the main character can execute.
idleSprite = spr_claire_idle_unarmed;
walkSprite = spr_claire_move_unarmed;
attackSprite = -1;
aimingSprite = -1;
reloadSprite = -1;


pushedObjectID = noone;

#endregion

#region METHOD INITIALIZATION

// This state is the "root" state for the player. From here they can move around the game world, interact
// with objects, ready their equipped weapon, toggle their flashlight, and so on.
function state_default(){
	// Calculate input magnitude and direction
	inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);
	inputDirection = point_direction(0, 0, (keyRight - keyLeft), (keyDown - keyUp));
	
	// Handle delta time movement and collisions
	var _velocity = update_position();
	movable_block_collision();
	world_collision(false);
	
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
	default_animation();
}

// The state for whenever the player is pushing an object forward. This state will be active until the player releases
// the key they were holding when they entered the state. This makes it so the state requires a single direction of 
// movement to avoid any odd bugs.
function state_pushing_object(){
	// Calculate movement based on 4 directions instead of the standard 8 directions
	var _xMovement, _yMovement;
	_xMovement = ((keyRight - keyLeft != 0) && !keyUp && !keyDown);
	_yMovement = ((keyDown - keyUp != 0) && !keyRight && !keyLeft);
	inputMagnitude = _xMovement || _yMovement;
	inputDirection = point_direction(0, 0, (keyRight - keyLeft) * _xMovement, (keyDown - keyUp) * _yMovement);
	
	// If the player released the held movement key of they are no longer pushing in the direction of the object, 
	// release the pushed object and return to the previous state.
	if (inputMagnitude == 0){
		with(pushedObjectID){ // Free the references to the borrowed methods
			removeMovementFractions = -1;
			worldCollision = -1;
		}
		pushedObjectID = noone;
		set_cur_state(lastState);
		return;
	}
	
	// Calculate the current frame's movement
	var _velocity = update_position();
	
	// Apply movement to the block before checking for collision with the player object
	with(pushedObjectID){
		// Set movement velocity relative to the object's weight
		hspd = (_velocity[X] / weight) * global.deltaTime;
		vspd = (_velocity[Y] / weight) * global.deltaTime;
		// Remove fractions from velocity and check collision
		removeMovementFractions();
		worldCollision(false);
	}
	
	// Finally, check for collision between the player object and the world
	world_collision(false);
}

// Set the initial state (Must be below the method declarations)
curState = state_default;

// Condenses the calculation for hspd and vspd, removal of fraction values, and a check for collision
// with the world. Finally, the _hspd and _vspd values are returned for any external use. (Ex. image_speed)
function update_position(){
	// Store the non-delta time movement for the current frame
	var _hspd, _vspd;
	_hspd = lengthdir_x(inputMagnitude * maxHspd, inputDirection);
	_vspd = lengthdir_y(inputMagnitude * maxVspd, inputDirection);
	
	// Apply delta time to the frame's movement; remove fractional value
	hspd = _hspd * global.deltaTime;
	vspd = _vspd * global.deltaTime;
	remove_movement_fractions();
	
	// Return the _hspd and _vspd values as a 2D vector
	return [_hspd, _vspd];
}


function movable_block_collision(){
	// Flag that determines if the state for moving an object should become active
	var _collision = false;
	
	// Horizontal collision
	var _block = instance_place(x + hspd, y, par_wall);
	if (_block != noone && _block.wallType == Wall.Movable){
		_collision = true;
	}
	
	// Vertical collision
	if (_block == noone){ // If a wall on the x-axis hasn't been found; check for vertical
		_block = instance_place(x, y + vspd, par_wall);
		if (_block != noone && _block.wallType == Wall.Movable){
			_collision = true;
		}
	}
	
	// If a collision occured in either direction; change the state and begin pushing the block forward
	if (_collision){
		pushedObjectID = _block;
		// Get a reference to both movement methods to share with the moving object
		_block.removeMovementFractions = method(_block, remove_movement_fractions);
		_block.worldCollision = method(_block, world_collision);
		// Change state to begin pushing the object forward
		set_cur_state(state_pushing_object);
	}
}

#endregion

#region LOCK CAMERA ONTO PLAYER

with(global.controllerID){
	cameraID.set_cur_object(other.id);
}

#endregion