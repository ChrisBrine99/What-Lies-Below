/// @description Resets the player's current sanity modifier value, with an optional flag to instantly restore
/// the player's sanity level back to its maximum value.
/// @param restoreSanity

var _restoreSanity = argument0;

sanityTimer = 0;
sanityModifier = 0;
if (_restoreSanity){
	sanityLevel = MAX_SANITY_LEVEL;
}