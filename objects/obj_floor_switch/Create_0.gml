/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

image_speed = 0;
image_index = 0;
// Use alarm[0] to check if this switch has already been activated by the player.

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// The total weight needed to activate the floor switch. The object pushed onto it must be
// the same value as this or higher in order to press the switch.
weightNeeded = 0;

// Holds the ID for the scripts to execute upon activating and deactivating the script, respectively.
activatedScript = -1;
deactivateScript = -1;

// A flag that tells the block whether or not it is currently activated. Used for executing the
// deactivation script once upon exiting collision.
isActivated = false;

#endregion