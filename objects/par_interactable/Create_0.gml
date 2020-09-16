/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

// Call default initialization from obj_world_object
event_inherited();

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// Holds the index for the script that is to be executed upon interaction from a player-controlled object.
interactionScript = -1;

// A flag that determines whether or not the object can be interacted with. The ability to interact with 
// children of this object is determined by the distance the object is from any light sources. If the object
// isn't near any light, it is considered shrouded in darkness and the player will not be able to interact
// with it.
canInteract = true;

#endregion