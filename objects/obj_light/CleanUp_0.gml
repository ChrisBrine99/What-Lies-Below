/// @description Recalculate Interactability For All Interactable Objects In Radius

// If the light isn't a true light, ignore the interactable check
if (!trueLight){
	return;
}

// Calculate interactability for closest interactables relative to this light
var _id = id;
with(par_interactable){
	if (closestLight == _id){
		interactable_near_light();
	}
}