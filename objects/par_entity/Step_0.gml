/// @description Calling Current State Function/Executing General Code

// Execute the method containing the current state's code.
script_execute(curState);

// Regenerating hitpoints based on a ratio of amount regenerated divided by the time in seconds
// that the hitpoints regenerates said amount. Allows for any speed of hitpoint regeneration.
if (hpRegenAmount > 0 && regenSpeed > 0 && hitpoints < maxHitpoints){
	hpRegenFraction += ((hpRegenAmount / regenSpeed) * global.deltaTime) / 60;
	if (hpRegenFraction >= 1){
		var _healthGained = floor(hpRegenFraction);
		update_hitpoints(_healthGained);
		hpRegenFraction -= _healthGained;
	}
}