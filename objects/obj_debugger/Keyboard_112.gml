/// @description Function Key Debug Commands

switch(keyboard_lastkey){
	case vk_f11: // Quickly restarting the game
		game_restart();
		break;
	case vk_f12: // Ending the game outright
		game_end();
		break;
}

/*if (keyboard_check_pressed(ord("M")) && global.gameState != GameState.InMenu){
	instance_create_depth(0, 0, GLOBAL_DEPTH, obj_inventory_menu);
	global.gameState = GameState.InMenu;
} else if (keyboard_check_pressed(ord("G"))){
	global.gameState = GameState.InGame;
}*/