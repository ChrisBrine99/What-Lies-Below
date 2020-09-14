/// @description Creates the camera object that allows the game to be viewed through its window port. Otherwise,
/// the game would just be a black, empty square and that's no fun.
/// @param aspectRatio
/// @param scale

var _aspectRatio, _scale;
_aspectRatio = argument0;
_scale = argument1;

if (cameraID == -1){ // Only create the camera if it doesn't current exist
	cameraID = camera_create();
	camera_set_view_mat(cameraID, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
	set_camera_aspect_ratio(_aspectRatio, _scale);
}