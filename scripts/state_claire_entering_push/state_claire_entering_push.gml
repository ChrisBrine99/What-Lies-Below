/// @description The state for when the player is transitioning from their previous state into the state for
/// pushing objects around. If the player releases their held key in this state or changes directions, the
/// timer will count down to zero and exit to the default state. Othersize, the timer will count up and the
/// player will enter the object pushing state.

// If the object the player is pushing isn't stored in the ID variable (Ex. Exiting from pushing), the timer
// will count down and return to the default state.
if (inputMagnitude != 0 && inputDirection == pushedDirection && pushedObjectID != noone){
	enteringPushTimer += global.deltaTime;
	if (enteringPushTimer >= 15){ // 1/4th of a second to enter/exit pushing an object
		enteringPushTimer = 15;
		set_cur_state(state_claire_pushing_object);
	}
} else{
	enteringPushTimer -= global.deltaTime;
	if (enteringPushTimer < 0){ // Whatever remainder of seconds before returning to the default state
		enteringPushTimer = 0;
		pushedDirection = -1;
		set_cur_state(state_claire_default);
	}
}

direction = pushedDirection;
// TODO -- Add frame-based animation of entering/exiting the state here