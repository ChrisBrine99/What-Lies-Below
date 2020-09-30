/// @description Code for the grain filter effect that is applied onto the GUI layer, which affects all GUI
/// elements as well as the world. A 64x64 noise texture is used to determine the color of the pixel relative
/// to this frame's calculated offset -- simulating film grain.
/// @param spriteWidth
/// @param strength
/// @param size

var _spriteWidth, _strength, _size;
_spriteWidth = argument0;
_strength = argument1;
_size = argument2;

shader_set(filmGrainShader);
// Set the uniforms to their corresponding values.
shader_set_uniform_f(sGrainOffset, irandom_range(0, filmGrainWidth), irandom_range(0, filmGrainWidth));
shader_set_uniform_f(sGrainStrength, _strength);
shader_set_uniform_f(sGrainSize, _size);
texture_set_stage(sGrainTexture, filmGrainTexture);

// Draw the surface to the screen; applying the shader's effect to it
draw_surface(resultSurface, 0, 0);

shader_reset();