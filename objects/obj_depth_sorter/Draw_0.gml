/// @description Draw Every Currently Visible World Object

// Update the Y-positions and zOffset in the grid and sort accordingly before drawing
var _index = 0;
with(par_world_object){
	global.worldObjects[# 0, _index] = id;
	global.worldObjects[# 1, _index] = y + zOffset;
	_index++;
}
// Sorts in descending order; lower Y-position objects are drawn first
ds_grid_sort(global.worldObjects, 1, true);

// Loop through each object in the list and draw them
var _halfWidth, _halfHeight, _length;
_halfWidth = global.cameraSize[X] / 2;
_halfHeight = global.cameraSize[Y] / 2;
_length = ds_grid_height(global.worldObjects);
for (var i = 0; i < _length; i++){
	with(global.worldObjects[# 0, i]){
		if (x < (global.controllerID.x - _halfWidth) - sprite_width || x > (global.controllerID.x + _halfWidth) + sprite_width || y < (global.controllerID.y - _halfHeight) - sprite_height || y > (global.controllerID.y + _halfHeight) + sprite_height){
			return;	// The object isn't currently on screen; don't bother drawing them to the screen
		}
		draw_self();
	}
}