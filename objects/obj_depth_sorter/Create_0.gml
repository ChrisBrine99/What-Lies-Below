/// @description Variable Initialization

#region SINGLETON CHECK

if (global.sorterID != noone){
	if (global.sorterID.object_index == object_index){
		instance_destroy(self);
		return;
	}
	instance_destroy(global.sorterID);
}
global.sorterID = id;

#endregion

#region EDIT INHERITED VARIABLES

image_speed = 0;
image_index = 0;
visible = true;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// Tracks the number of objects drawn by this object in the current frame. Used for validating that culling
// is working on off-screen sprites.
totalObjectsDrawn = 0;

#endregion