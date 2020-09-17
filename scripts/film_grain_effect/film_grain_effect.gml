/// @description Applies a psuedo grain effect on the screen using a single, static noise texture. This noise
/// filter is draw in four quadrants, (top left, top right, bottom left, bottom right) and then it is offset
/// by a random number of pixels. This results is an effect of dynamic noise while only using a single image.

var _offsetX, _offsetY;
_offsetX = irandom_range(-global.cameraSize[X], 0);
_offsetY = irandom_range(-global.cameraSize[Y], 0);

// Draw the sprite using draw_sprite_part_ext in order to clips off parts of the texture that don't fit the
// currently used application surface.
draw_sprite_part_ext(spr_noise, 0, 0, 0, global.cameraSize[X], global.cameraSize[Y], 
	_offsetX, _offsetY, 1, 1, c_white, 0.06);												// Top-Left
draw_sprite_part_ext(spr_noise, 0, 0, 0, global.cameraSize[X], global.cameraSize[Y], 
	_offsetX + global.cameraSize[X], _offsetY, 1, 1, c_white, 0.06);						// Top-Right
draw_sprite_part_ext(spr_noise, 0, 0, 0, global.cameraSize[X], global.cameraSize[Y], 
	_offsetX, _offsetY + global.cameraSize[Y], 1, 1, c_white, 0.06);						// Bottom-Left
draw_sprite_part_ext(spr_noise, 0, 0, 0, global.cameraSize[X], global.cameraSize[Y], 
	_offsetX + global.cameraSize[X], _offsetY + global.cameraSize[Y], 1, 1, c_white, 0.06); // Bottom-Right