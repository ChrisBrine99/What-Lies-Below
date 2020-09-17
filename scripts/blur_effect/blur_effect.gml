/// @description Holds all the code for processing a two-step blur shader effect. The first pass is a horizontal
/// blur, (Although, order doesn't matter) and that result is stored into the buffer surface. The second pass
/// takes that buffer and draws it to the application surface with a vertical blur applied.
/// @param blurSteps
/// @param sigma

var _blurSteps, _sigma;
_blurSteps = argument0;
_sigma = argument1;

// Since surfaces are volatile, a fail-safe must be in place to prevent crashing.
if (!surface_exists(blurSurfaceBuffer)){
	blurSurfaceBuffer = surface_create(global.cameraSize[X], global.cameraSize[Y]);
}

// Begin drawing using the blur shader's 2-pass system
shader_set(blurShader);
// Set all the uniforms to their corresponding values
shader_set_uniform_f(sBlurSteps, _blurSteps);
shader_set_uniform_f(sTexelSize, 1 / global.cameraSize[X], 1 / global.cameraSize[Y]);
shader_set_uniform_f(sSigma, _sigma);

// The first pass: horizontal blurring
shader_set_uniform_f(sBlurVector, 1, 0); // [1, 0] tells the shader to blur horizontally
surface_set_target(blurSurfaceBuffer);
draw_surface(resultSurface, 0, 0);
surface_reset_target();

// The second pass: vertical blurring
shader_set_uniform_f(sBlurVector, 0, 1); // [0, 1] tells the shader to blur vertically
surface_set_target(resultSurface);
draw_surface(blurSurfaceBuffer, 0, 0);
surface_reset_target();

shader_reset();