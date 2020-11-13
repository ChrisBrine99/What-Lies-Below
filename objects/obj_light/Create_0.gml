/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

image_speed = 0;
image_index = 0;
visible = false;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// This flag is used to distinguish lights that are within the environment (EX. street lights, etc.) and lights
// that are specifically there to assist the player. (Ex. Dim light around player, etc.) The true lights are
// factored into determining if an object can be interacted with whenever the player's flashlight isn't on.
trueLight = false;

strength = 0;
color = c_black;
radius = [0, 0];

#endregion