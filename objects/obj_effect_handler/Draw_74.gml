/// @description Draw World-Space Effects

// The result shader is used on multiple occasions to store the effect of a previous shader in order to 
// correctly apply it to another shader.
if (!surface_exists(resultSurface)){
	resultSurface = surface_create(global.cameraSize[X], global.cameraSize[Y]);	
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
	lighting_system([0, 0, 0], -0.6, 0.4, 0.25);
}

if (blurEnabled){ // Activate blur effect if currently enabled
	blur_effect(3, 0.25);
}

// After applying all effects to the surface; render the resulting surface
draw_surface(resultSurface, 0, 0);