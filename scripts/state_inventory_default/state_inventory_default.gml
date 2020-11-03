/// @description Default state used by the inventory menu. It allows the user to shift between the three sections
/// contained within the menu. On top of that, the menu can be exited from within this section. Doing so will
/// cause the current section to close itself too.

// Borrow the parent menu's menument script
menu_movement();

// Begins the exit transition for the inventory menu
if (keyReturn){
	set_cur_state(-1);
	// FOR TESTING
	global.gameState = GameState.InMenu;
	return;
}

// Shifting to another section in the menu
if (prevOption != curOption){
	//set_cur_state(state_inventory_change_section);
}