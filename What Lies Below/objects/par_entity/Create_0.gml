/// @description Variable/Method Initialization

#region EDITING INHERITED VARIABLES

image_speed = 0;
image_index = 0;
//visible = false;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// A variable that stores a method's ID value. Whenever the variable is used, the relative state code will
// be executed, and for only that state's code. The lastState variable stores the previously active state.
curState = -1;
lastState = -1;

// The entity's current horizontal and vertical movement velocity, respectively.
hspd = 0;
vspd = 0;

// Stores any fraction values within the current hspd and vspd values. Prevent sub-pixel movement which
// would make collision checking/resolving a pain in the ass.
hspdFraction = 0;
vspdFraction = 0;

// Stores the current maximum possible horizontal and vertical velocities for the entity. These are different
// from their respective const variables so that these can be altered without ever losing the initial values.
maxHspd = 0;
maxVspd = 0;

// The CONSTANT value for the entity's maximum hspd and vspd, which cannot be adjusted by movement speed buffs
// and debuffs. However, they can be explicitly change if required through the set_max_move_speed method.
maxHspdConst = 0;
maxVspdConst = 0;

// Stores the tilemap ID for the floor tiles. Each floor tile corresponds to a different sound effect for 
// the entity's footstep.
collisionTilemap = -1;

// The variables that keep track of the current hitpoints, maximum hitpoints, as well as damage resistance
// from attacks. The damage resistance is multiplied with recieved damage to calculte the total damage. A
// lower value results in lower damage taken. (1 = full damage, 0.6 = 60% damage taken)
hitpoints = 0;
maxHitpoints = 0;
damageResistance = 1;

// Variables for controlling the entity's health regeneration. The first value corresponds to the amount of
// hitpoints gained, and the last variable determines how many seconds of real-time need to pass before the
// entity gains said amount of health. Finally, the fraction variable store the fractional value for the
// amount of health regained. Once that value passes 1, the floored value will be gained as health and
// subtracted from the fraction value.
hpRegenAmount = 0;
hpRegenFraction = 0;
regenSpeed = 0;

// Two flags that determines whether or not the entity can take damage and be killed or if they have had
// their hitpoints reduced to 0; killing them at the start of the next frame.
isInvincible = false;
isDestroyed = false;

// A flag that grants the entity temporary invincibility frames after getting hit by an enemy's attack.
// The time in frames (1 frame = 1/60 seconds) is variable and can be set to any amount of time.
isHit = false;
timeToRecover = 0;
recoveryTimer = 0; 

// A flag and variable for handling the animation system. Since all directions are contained within a single
// sprite resources, the animation end flag won't always trigger for looping animations in the middle of
// the sprite. This flag enabled calling to the animation_end event for those cases specifically.
animationEnd = false;
localFrame = 0;

#endregion

#region METHOD DECLARATION

// Sets the currently executed state to a new function index. Also stores the last state within its own
// variable for easy referece and comparison. If the passed in function is identical to the current state,
// don't change the state.
function set_cur_state(_newState){
	if (_newState != curState){
		lastState = curState;
		curState = _newState;
	}
}

// Updates the current hitpoints with an increase or decrease to the value. Limits the value of the hitpoints
// to be within the range of 0 and the maximum hitpoints; with a value of 0 destroying the entity if it isn't
// set to invincible.
function update_hitpoints(_modifier){
	hitpoints += _modifier;
	if (hitpoints > maxHitpoints){
		hitpoints = maxHitpoints;
	} else if (hitpoints <= 0 && !isInvincible){
		hitpoints = 0;
		isDestroyed = true;
	}
}

// Adds/subtracts a determines health regeneration ratio from the current hp regen amount and speed of that
// regeneration. This allows for stacking of regeneration effects.
function update_hitpoint_regen_ratio(_hpGained, _interval){
	if (regenSpeed != 0){ // Calculate an updated ratio for the health regen based on the addition of the two ratios.
		var _factor = _interval / regenSpeed;
		hpRegenAmount = max(0, (hpRegenAmount * _factor) + _hpGained);
		regenSpeed = (hpRegenAmount == 0) ? 0 : (regenSpeed * _factor);
	} else{ // Set the intiial hitpoints regeneration ratio if no regeneration is currently present
		hpRegenAmount = _hpGained;
		regenSpeed = _interval;
	}
}

// Sets the constant initial hspd and vspd to new values, with an optional argument that overwrites the
// current maximum values being used by the entity to the new constant values.
function set_max_move_speed(_maxHspd, _maxVspd, _overwriteCurrent){
	maxHspdConst = max(0, _maxHspd);
	maxVspdConst = max(0, _maxVspd);
	if (_overwriteCurrent){
		reset_move_speed();
	}
}

// Resets the CURRENT maximum hspd and vspd values back to their constant initial values.
function reset_move_speed(){
	maxHspd = maxHspdConst;
	maxVspd = maxVspdConst;
}

// Modifies the CURRENT maximum hspd and vspd (The initial constants remain the same) to the new values 
// provided. if the modification has to be relative to the current maximum values, it will be added or
// subtracted as such. Otherwise, it is chanced to the passed values.
function modify_move_speed(_hspdModifier, _vspdModifier, _relative){
	if (_relative){
		maxHspd = max(0, maxHspd + _hspdModifier);
		maxVspd = max(0, maxVspd + _vspdModifier);
		return;
	}
	maxHspd = max(0, _hspdModifier);
	maxVspd = max(0, _vspdModifier);
}

// Removes and stores away the decimal values for the entity's current hspd and vspd. This ensures that
// the entity will never move on a sub-pixel basis, which makes collision a lot more simplified.
function remove_movement_fractions(){
	// Recalculate the remaining fractional value for horizontal movement
	hspd += hspdFraction;
	hspdFraction = hspd - (floor(abs(hspd)) * sign(hspd));
	hspd -= hspdFraction;
	
	// Recalculate the remaining fractional value for vertical movement
	vspd += vspdFraction;
	vspdFraction = vspd - (floor(abs(vspd)) * sign(vspd));
	vspd -= vspdFraction;
}

// Updates positions and checks for any collisions at said position. If there is a collision, movement is
// pixel-by-pixel until there is no space between the wall and entity.
function world_collision(_destroyOnCollide){
	// Horizontal collision
	var _hspd = sign(hspd);
	if (place_meeting(x + hspd, y, par_wall)){
		// Move pixel-by-pixel until the wall is reached.
		while(!place_meeting(x + _hspd, y, par_wall)){
			x += _hspd;
		}
		isDestroyed = _destroyOnCollide;
		hspd = 0;
	}
	x += hspd;
	
	// Vertical collision
	var _vspd = sign(vspd);
	if (place_meeting(x, y + vspd, par_wall)){
		// Move pixel-by-pixel until the wall is reached.
		while(!place_meeting(x, y + _vspd, par_wall)){
			y += _vspd;
		}
		isDestroyed = _destroyOnCollide;
		vspd = 0;
	}
	y += vspd;
}

// The default method for animating an entity. It takes in the sprite's speed that can be set within the 
// sprite editor and calculates how fast the animation will play based on that value.
function default_animation(){
	var _cardinalDirection, _totalFrames;
	_cardinalDirection = round(direction / 90);
	_totalFrames = sprite_get_number(sprite_index) / DIRECTIONS;

	// Sets the entity's animation frame (image_index) to be equal to the current offset frame relative to the
	// current direction that the entity is facing in. For example, if the player is facing to the right, the
	// _cardinalDirection variable will equal 0 and will provide no offset for the animation. It would look 
	// like this:
	//
	//				image_index = _localFrame + (0 * _totalFrames)
	//
	// The same idea applies to each direction. (0 = Right, 1 = Up, 2 = Left, 3 = Down)
	image_index = localFrame + (_cardinalDirection * _totalFrames);
	localFrame += (image_speed / ANIMATION_FPS) * global.deltaTime;

	if (localFrame >= _totalFrames){ // The animation is at the end
		animationEnd = true;
		localFrame = 0;
	} else{ // Reset animation flag
		animationEnd = false;
	}
}

#endregion