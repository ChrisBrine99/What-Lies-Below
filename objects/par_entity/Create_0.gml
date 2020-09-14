/// @description Variable Initialization

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