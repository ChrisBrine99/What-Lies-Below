/// @description Draw Every Currently Visible World Object

// Reset the variable for tracking total objects drawn
totalObjectsDrawn = 0;

// Update the Y-positions and zOffset in the grid and sort accordingly before drawing
var _index = 0;
with(par_world_object){
	global.worldObjects[# 0, _index] = id;
	global.worldObjects[# 1, _index] = y + zOffset;
	_index++;
}
// Sorts in descending order; lower Y-position objects are drawn first
ds_grid_sort(global.worldObjects, 1, true);

// Before drawing each sorted object, set the outline shader, but only use it for interactable objects
shader_set(outlineShader);
// Set the outline color here since it won't change for specific objects
shader_set_uniform_f_array(sOutlineColor, [1, 1, 1]);


// Store the uniform locations within local variables for quick access
var _sPixelWidth, _sPixelHeight, _drawOutline, _spriteTexture;
_sPixelWidth = sPixelWidth;
_sPixelHeight = sPixelHeight;
_drawOutline = sDrawOutline;
_spriteTexture = -1;

// Loop through each object in the list and draw them
var _halfWidth, _halfHeight, _totalObjectsDrawn, _length;
_halfWidth = global.cameraSize[X] / 2;
_halfHeight = global.cameraSize[Y] / 2;
_totalObjectsDrawn = 0;
_length = ds_grid_height(global.worldObjects);
for (var i = 0; i < _length; i++){
	with(global.worldObjects[# 0, i]){
		if (x < (global.controllerID.x - _halfWidth) - sprite_width || x > (global.controllerID.x + _halfWidth) + sprite_width || y < (global.controllerID.y - _halfHeight) - sprite_height || y > (global.controllerID.y + _halfHeight) + sprite_height){
			continue;	// The object isn't currently on screen; don't bother drawing them to the screen
		}
		// Set the shader's uniforms if and get textureID only if required -- except for setting drawOutline, which is mandatory for each object drawn
		if (drawOutline){
			_spriteTexture = sprite_get_texture(sprite_index, image_index);
			shader_set_uniform_f(_sPixelWidth, texture_get_texel_width(_spriteTexture));
			shader_set_uniform_f(_sPixelHeight, texture_get_texel_height(_spriteTexture));
		}
		shader_set_uniform_i(_drawOutline, drawOutline);
		// Draw the object
		draw_self();
		_totalObjectsDrawn++;
	}
}
totalObjectsDrawn = _totalObjectsDrawn;

// Reset the shader and return to normal drawing
shader_reset();