/// @description Sets the player's poisoned status condition to either true or false and updates the equipment
/// menu's item section if it is currently visible.
/// @param isPoisoned

isPoisoned = argument0;
conditionTimer = CONDITION_TIMER;
// Reset the damage for the poison AND the flag that makes it deal damage every 5 seconds instead of 2.5
curPoisonDamage = 0.01;
dealPoisonDamage = false;