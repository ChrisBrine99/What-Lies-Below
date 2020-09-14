/// @description Updating Keyboard Input

// If there is no state to execute or the game state is set to paused; don't allow entity functionality
if (curState == -1 || global.gameState == GameState.Paused){
	image_speed = 0;
	return;
}

// Keyboard input for movement
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);

// Keyboard input for world interaction and flashlight toggling
keyInteract = keyboard_check_pressed(ord("Z"));
keyFlashlight = keyboard_check_pressed(ord("F"));

// Keyboard input for using weaponry
keyUseWeapon = keyboard_check(ord("Z"));
keyReadyWeapon = keyboard_check(ord("X"));
keyChangeAmmo = keyboard_check_pressed(vk_lcontrol);
keyReload = keyboard_check_pressed(ord("R"));

// Call the par_entity step event
event_inherited();
// Any non-state code for the player will be below here ////////////////////////////

// Updating current sanity level in 5 second intervals if the player can either gain or lose sanity
if (sanityModifier != 0){
	sanityTimer += global.deltaTime;
	if (sanityTimer > SANITY_TIMER){
		sanityTimer -= SANITY_TIMER; // Reset the timer
		sanityLevel = clamp(sanityLevel + sanityModifier, 0, MAX_SANITY_LEVEL);
	}
}

// Updating the 2.5 second status condition check if the timer is currently active
if (conditionTimer > 0){
	conditionTimer -= global.deltaTime;
	if (conditionTimer <= 0){ // Execute status condition effects
		if (isBleeding){ // Deals 2.5% damage relative to the player's maximum health value
			update_hitpoints(-ceil(maxHitpoints * BLEED_DAMAGE));
		}
		if (isPoisoned){ // Take damage that doubles each time
			if (dealPoisonDamage){ // Deals damage every other interval (5 seconds)
				update_hitpoints(-ceil(maxHitpoints * curPoisonDamage));
				curPoisonDamage = min(1, curPoisonDamage + curPoisonDamage);
			}
			dealPoisonDamage = !dealPoisonDamage;
		}
		// Finally, restart the timer if the player still has status conditions
		conditionTimer = (isBleeding || isPoisoned) ? CONDITION_TIMER : 0;
	}
}

// Updating timer for temporary poison immunity IF it's set to temporary
if (poisonImmunity && immunityTimer != -1){
	immunityTimer -= global.deltaTime;
	if (immunityTimer <= 0){ // Poison immunity effect is removed
		poisonImmunity = false;
		immunityTimer = 0;
	}
}

// Updating timer for temporary damage resistance IF it's set to temporary
if (damageResist && resistanceTimer != -1){
	resistanceTimer -= global.deltaTime;
	if (resistanceTimer <= 0){ // Damage resistance effect is removed
		damageResist = false;
		resistanceTimer = 0;
	}
}