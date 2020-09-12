/// @description Remove Any Data Structures/Lightweight Objects

with(cameraID){ // Before deleting the object, delete the camera it created
	camera_destroy(camera);
}
delete cameraID;