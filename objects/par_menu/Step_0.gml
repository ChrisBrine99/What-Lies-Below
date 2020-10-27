/// @description Handling Transition/State Code

#region HANDLING TRANSITION STATE

if (transition != -1){
	// Don't perform transition if transitionArgs is no longer an array
	if (!is_array(transitionArgs)){
		transition = -1;
		return;
	}
	// Keeps the transition executing until an end case is triggered by the script itself
	transition = script_execute(transition, transitionArgs);
	return;
}

#endregion

#region CURRENT STATE EXECUTION

// FOR TESTING
menu_movement();
if (global.gameState == GameState.InGame){
	instance_destroy(self, false);
}

if (curState != -1){
	script_execute(curState);
}

#endregion