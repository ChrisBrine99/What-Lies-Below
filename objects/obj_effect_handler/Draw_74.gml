/// @description Draw World-Space Effects

// The result shader is used on multiple occasions to store the effect of a previous shader in order to 
// correctly apply it to another shader. Also gets texture ID for any shaders that need to use it
if (!surface_exists(resultSurface)){
	resultSurface = surface_create(global.cameraSize[X], global.cameraSize[Y]);	
	resultTexture = surface_get_texture(resultSurface);
}

// The first auxillary surface that is used to store any effects that are being processed by a shader. Also
// gets the textureID for the same purpose.
if (!surface_exists(auxSurfaceA)){
	auxSurfaceA = surface_create(global.cameraSize[X], global.cameraSize[Y]);
	auxTextureA = surface_get_texture(auxSurfaceA);
}

// The second auxillary surface that is used to store any effects that are being processed by a shader. Also
// gets the texture ID for the same purpose.
if (!surface_exists(auxSurfaceB)){
	auxSurfaceB = surface_create(global.cameraSize[X], global.cameraSize[Y]);
	auxTextureB = surface_get_texture(auxSurfaceB);
}

// Before anything is processed, store the application surface onto the result surface
surface_set_target(resultSurface);
draw_surface(application_surface, 0, 0);
surface_reset_target();

// The post processing effects are ordered as follows:
//		1	--		Lighting System
//		2	--		Bloom
//		3	--		Blur
//		4	--		Chromatic Abberation
//		5	--		Image Correction

if (lightingEnabled){ // Activate lighting system if currently enabled
	lighting_system([0, 0, 0], -0.05, 0.4, 0.25);
}

// TODO -- Add toggle for bloom effect here
bloom_effect(0.85, 0.1, 3, 0.15, 0.75, 1.1, 0.7);

if (blurEnabled){ // Activate blur effect if currently enabled
	blur_effect(3, 0.25);
}

// TODO -- Add toggle for aberration effect here
aberration_effect(0.15);

if (isHazeEnabled){ // Activate the heat haze shader if it's currently enabled
	shader_set(heatHazeShader);
	// Set the uniforms to their corresponding values
	shader_set_uniform_f(sHazeTime, time);
	shader_set_uniform_f(sHazeSize, 0.9);
	shader_set_uniform_f(sHazeStrength, 0.01);
	texture_set_stage(sHazeTexture, hazeTexture);
	
	// Draw the aberration effect to the result surface
	surface_set_target(resultSurface);
	gpu_set_tex_filter(true); // Without a linear filter this shader looks like garbage
	
	draw_surface(auxSurfaceA, 0, 0);
	
	gpu_set_tex_filter(false);
	surface_reset_target();
	
	shader_reset();
	
	// Increment the shader's time value
	time += global.deltaTime * 0.004;
}

// After applying all effects to the surface; render the resulting surface
draw_surface(resultSurface, 0, 0);