/// @description Clean Up Data Structures/Camera

ds_grid_destroy(global.worldObjects);
ds_map_destroy(global.fontTextures);

camera_destroy(cameraID);
game_end();