/// @description Variable/Method Initialization

#region SINGLETON CHECK

if (global.controllerID != noone){
	if (global.controllerID.object_index == object_index){
		instance_destroy(self);
		return;
	}
	instance_destroy(global.controllerID);
}
global.controllerID = id;

#endregion

#region EDITING INHERITED VARIABLES

image_speed = 0;
image_index = 0;
//visible = false;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

cameraID = new Camera();
with(cameraID){ // Setting up default values
	create_camera(SIXTEEN_BY_NINE, 4);
}

#endregion

#region METHOD INITIALIZATION
#endregion