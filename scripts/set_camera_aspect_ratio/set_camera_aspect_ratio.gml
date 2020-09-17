/// @description Sets the camera's aspect ratio to a new value depending on the aspect ratio provided. This 
/// adjusts the in-game resolution to the new aspect, relative to around 180p.
/// @param aspectRatio
/// @param scale

var _aspectRatio, _scale;
_aspectRatio = argument0;
_scale = argument1;

camera_set_view_size(cameraID, _aspectRatio[X], _aspectRatio[Y]);
camera_set_proj_mat(cameraID, matrix_build_projection_ortho(_aspectRatio[X], _aspectRatio[Y], 1, 10000));
surface_resize(application_surface, _aspectRatio[X], _aspectRatio[Y]);
global.cameraSize = [_aspectRatio[X], _aspectRatio[Y]];
set_window_size(_scale);

// After updating the aspect ratio, update all the surfaces in the effect handler
with(global.effectID){
	clear_surfaces();
}