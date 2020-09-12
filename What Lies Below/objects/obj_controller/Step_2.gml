/// @description Update Delta Time and Camera Position

// Update camera's position
with(cameraID){
	update_position();
}

// Calculate this frame's delta time
global.deltaTime = (delta_time / 1000000) * global.targetFPS;