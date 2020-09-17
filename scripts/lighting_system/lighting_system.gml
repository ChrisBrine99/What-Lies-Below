/// @description Holds all the code for processing the simple lighting shader. First it goes through all existing
/// and visible light sources in the room and draws them to a surface. After that, the shader effect is applied
/// with the light surface; resulting in the final result output onto the screen.
/// @param [r/g/b]
/// @param brightness
/// @param contrast
/// @param saturation

var _lightColor, _brightness, _contrast, _saturation;
_lightColor = argument0;
_brightness = argument1;
_contrast = argument2;
_saturation = argument3;

// Since surfaces are volatile, a fail-safe must be in place to prevent crashing.
if (!surface_exists(lightSurface)){
	lightSurface = surface_create(global.cameraSize[X], global.cameraSize[Y]);
	lightTexture = surface_get_texture(lightSurface);
}

// Begin by drawing all the light sources onto a texture
surface_set_target(lightSurface);

// Completely black out the lighting surface before drawing the lights to it
draw_clear(c_black);
gpu_set_blendmode(bm_add);
gpu_set_tex_filter(true);

// Store the top-left coordinate of the camera for easy reuse
var _cameraX, _cameraY;
_cameraX = global.controllerID.x - (global.cameraSize[X] / 2);
_cameraY = global.controllerID.y - (global.cameraSize[Y] / 2);
with(obj_light){ // Display every visible light instance onto the light surface
	if (x + radius[X] < _cameraX || y + radius[Y] < _cameraY || x - radius[X] > _cameraX + global.cameraSize[X] || y - radius[Y] > _cameraY + global.cameraSize[Y]){
		continue; // The light is off of the screen; don't bother drawing the light
	}
	// Draw the light based on its radius, color, and strength
	draw_set_alpha(strength);
	draw_ellipse_color(x - radius[X] - _cameraX, y - radius[Y] - _cameraY, x + radius[X] - _cameraX, y + radius[Y] - _cameraY, color, c_black, false);
	draw_set_alpha(1);
}

// Finally, reset the GPU and surface target
gpu_set_tex_filter(false);
gpu_set_blendmode(bm_normal);
surface_reset_target();

// After adding all the lights to their surface, render the lighting system with its shader
shader_set(lightShader);
// Set all the uniforms to their corresponding values
shader_set_uniform_f_array(sColor, _lightColor);
shader_set_uniform_f(sBrightness, _brightness);
shader_set_uniform_f(sContrast, _contrast);
shader_set_uniform_f(sSaturation, _saturation);
texture_set_stage(sLightTexture, lightTexture);

surface_set_target(resultSurface);
draw_surface(application_surface, 0, 0);
surface_reset_target();

shader_reset();