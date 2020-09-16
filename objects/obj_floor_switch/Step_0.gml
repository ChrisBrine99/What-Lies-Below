/// @description Check Collision With Movable Objects

var _block = instance_place(x, y, par_wall);
if (_block != noone && _block.wallType == Wall.Movable){
	// If possible, activate the switch and delete the switch object
	if (weightNeeded <= _block.weight && !isActivated){
		isActivated = true;
		show_debug_message("Switch Activated");
		// Don't execute the script for an index that isn't valid
		if (script_exists(activatedScript)){
			script_execute(activatedScript);
		}
	}
} else{
	// Executes the deactivation script if the object is moved off the switch
	if (isActivated){
		isActivated = false;
		show_debug_message("Switch Deactivated");
		// Don't execute the script for an index that isn't valid
		if (script_exists(deactivateScript)){
			script_execute(deactivateScript);
		}
	}
}