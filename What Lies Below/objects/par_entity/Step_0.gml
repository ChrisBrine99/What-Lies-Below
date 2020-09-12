/// @description Calling Current State Method/General Code

// If there is no state to execute or the 
if (curState == -1 || global.gameState == GameState.Paused){
	image_speed = 0;
	return;
}

// Execute the method containing the current state's code.
curState();

// Regenerating hitpoints based on a ratio of amount regenerated divided by the time in seconds
// that the hitpoints regenerates said amount. Allows for any speed of hitpoint regeneration.
if (hpRegenAmount > 0 && regenSpeed > 0 && hitpoints < maxHitpoints){
	hpRegenFraction += (hpRegenAmount / regenSpeed) * global.deltaTime;
	if (hpRegenFraction >= 1){
		var _healthGained = floor(hpRegenFraction);
		update_hitpoints(_healthGained);
		hpRegenFraction -= _healthGained;
	}
}