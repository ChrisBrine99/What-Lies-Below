/// @description Switches the inventory's currently active section to the next one.

// TODO -- Eventually place a check here for when the menu section has completed its transition.
//		   Only then will the section be switched.

// Deactivate the previous section object and activate the current one
instance_deactivate_object(invSection[prevOption]);
instance_activate_object(invSection[curOption]);
// Start up the section's intro transition
with(invSection[curOption]){
	// TODO -- Start transition here and lock inventory until transition is finished
	show_debug_message(object_get_name(object_index));
}

// For now, the state will instantly be reset here
set_cur_state(state_inventory_default);