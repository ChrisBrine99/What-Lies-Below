/// @description Remove Object From Grid

// Removes one from the total size to save memory
ds_grid_resize(global.worldObjects, 2, ds_grid_height(global.worldObjects) - 1);