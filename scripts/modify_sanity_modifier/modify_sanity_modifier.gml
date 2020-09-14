/// @description Adds/subtracts a new value to the player's current sanity modifier. This value maxes out at 
/// a value of 20. So in the most perilous situations, it's only 20 seconds before the plaeyr begins to have
/// a mental breakdown.
/// @param modifier

var _modifier = argument0;
sanityModifier = min(20, sanityModifier + _modifier);