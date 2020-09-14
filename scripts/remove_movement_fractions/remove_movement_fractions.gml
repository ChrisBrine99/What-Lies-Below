/// @description Removes and stores away the decimal values for the entity's current hspd and vspd. This ensures 
/// that the entity will never move on a sub-pixel basis, which makes collision a lot more simplified.

// Recalculate the remaining fractional value for horizontal movement
hspd += hspdFraction;
hspdFraction = hspd - (floor(abs(hspd)) * sign(hspd));
hspd -= hspdFraction;
	
// Recalculate the remaining fractional value for vertical movement
vspd += vspdFraction;
vspdFraction = vspd - (floor(abs(vspd)) * sign(vspd));
vspd -= vspdFraction;