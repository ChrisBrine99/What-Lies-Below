/// @description Variable Initialization

#region	SINGLETON CHECK

if (global.effectID != noone){
	if (global.effectID.object_index == object_index){
		instance_destroy(self);
		return;
	}
	instance_destroy(global.effectID);
}
global.effectID = id;

#endregion

#region EDIT INHERITED VARIABLES

image_speed = 0;
image_index = 0;
visible = true;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// A variable that stores the index for the final surface that is displayed after
// all shaders and effects have been processed.
resultSurface = -1;

// Variables for Lighting Shader ///////////////////////////////////////////////////

// This variable holds a reference to the shader's unique asset index value.
lightShader = shd_lighting;
// Get the uniform locations; storing them in local variables
sColor = shader_get_uniform(lightShader, "color");
sBrightness = shader_get_uniform(lightShader, "brightness");
sContrast = shader_get_uniform(lightShader, "contrast");
sSaturation = shader_get_uniform(lightShader, "saturation");
sLightTexture = shader_get_sampler_index(lightShader, "lightTexture");

// Two variables to hold data about the light sources used in the lighting shader.
// The first variable stores a reference to the texture for the surface that all light
// sources are drawn onto. The second variable holds the ID for the surface that is
// being drawn to.
lightTexture = -1;
lightSurface = -1;

// A flag that toggles the lighting system on and off.
lightingEnabled = true;

////////////////////////////////////////////////////////////////////////////////////

// Variables for the Blur Shader ///////////////////////////////////////////////////

// This variable holds a reference to the shader's unique asset index value.
blurShader = shd_blur;
// Get the uniform locations; storing them in local variables
sBlurSteps = shader_get_uniform(blurShader, "blurSteps");
sTexelSize = shader_get_uniform(blurShader, "texelSize");
sSigma = shader_get_uniform(blurShader, "sigma");
sBlurVector = shader_get_uniform(blurShader, "blurVector");

// A surface that acts as a buffer for the blur shader's horizontal blurring. Since
// this is a two-pass shader, it's necessary to store the first pass before applying
// the second pass to it and rendering the result.
blurSurfaceBuffer = -1;

// A flag that toggles the blur effect on and off.
blurEnabled = false;

////////////////////////////////////////////////////////////////////////////////////

// Disable the automatic drawing of the application surface
application_surface_draw_enable(false);

#endregion