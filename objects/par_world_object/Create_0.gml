/// @description Important Initializations

#region EDITING INHERITED VARIABLES

image_speed = 0;
image_index = 0;
visible = false;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// This variable controls where in the sorted grid the object will end up. ALlows for objects that appear above
// other objects to not be drawn incorrectly. (Ex. bullets passing by a shelve/drawer/etc.) Can also be used
// to offset the collision for a more "3D" looking collision.
zOffset = 0;

#endregion

#region ADD OBJECT TO RENDERING GRID

// Adds one to make room for this object within the grid
ds_grid_resize(global.worldObjects, 2, instance_number(par_world_object));

#endregion