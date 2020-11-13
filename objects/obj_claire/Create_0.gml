/// @description Variable Initialization

#region SINGLETON CHECK

if (global.playerID != noone){
	if (global.playerID.object_index == object_index){
		instance_destroy(self);
		return;
	}
	instance_destroy(global.playerID);
}
global.playerID = id;

#endregion

#region EDITING INHERITED VARIABLES

// Before any initialization, lock the camera onto Claire
set_camera_cur_object(id);

event_inherited();
// Set Claire's initial state
curState = state_claire_default;

// Set the maximum movement speeds
maxHspdConst = 1.25;
maxVspdConst = 1.25;
maxHspd = maxHspdConst;
maxVspd = maxVspdConst;

// Set the initial maximum hitpoints
maxHitpoints = 20;
hitpoints = maxHitpoints;

// Temporarily setting Claire to be invincible for testing
isInvincible = true;

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
keyReload = false;
keyChangeAmmo = false;

// Holds the cardinal direction for the player's current movement and the magnitude of movement for
// the movement, which is them multiplied by maxHspd or maxVspd, respectively.
inputMagnitude = 0;
inputDirection = 0;

// The sprites for each of the actions the main character can execute.
idleSprite = spr_claire_idle_unarmed;
walkSprite = spr_claire_move_unarmed;
pushSprite = spr_claire_move_unarmed;
attackSprite = -1;
aimingSprite = -1;
reloadSprite = -1;

// Variables used for when the player is pushing a movable object forward. The first variable stores the ID
// for the current object being pushed, and the second stores the original direction the player was in before
// they began pushing the object.
pushedObjectID = noone;
pushedDirection = -1;

// A variable that counts the frames that the player has been pushing against an object before they truly
// enter the state for pushing said object forward.
enteringPushTimer = 0;

// Flags for status conditions that can affect the player at any given time. Also included below are two flags 
// that give the player a temporary damage resistance against attacks, as well as a temporary immunity to
// being poisoned by attacks.
isBleeding = false;
isPoisoned = false;
poisonImmunity = false;
damageResist = false;

// The timer for status condition effects (Every 2.5. seconds). Each interval will deal out bleeding damage
// if the player is currently bleeding, while also dealing poison damage every other interval; with doubling
// damage until a cap of 100% damage is reached.
conditionTimer = 0;

// Two variables relating to the poison status condition. The first is a flag that determines if poison damage
// will be dealt out on the current interval, and the second stores the current damage the poison will deal 
// out on the next poison interval.
dealPoisonDamage = false;
curPoisonDamage = INITIAL_POISON_DAMAGE;

// The timers for temporary damage resistance and poison immunities. Both values can be set to a value of -1
// to enable an indefinite immunity and resistance.
immunityTimer = 0;
resistanceTimer = 0;

// Variables that handle the player's current sanity level; 100 means no distress, and 0 means a complete
// mental breakdown. Every 5 seconds, the sanity level will be updated according to the current modifier
// value. This value can be increased/decreased by a plethora of factors.
sanityLevel = MAX_SANITY_LEVEL;
sanityModifier = 0;
sanityTimer = 0;

// Variables relating to Claire's current internal temperature. When in rooms that are cold (Ex. normal world 
// outside) or really hot (Ex. broken furnace room), her internal temperature will begin to slowly increse,
// and she will begin taking damage if she gets too hot or too cold.
internalTemperature = 36.5;
externalTemperature = ROOM_TEMPERATURE;
temperatureTimer = 0;

#endregion