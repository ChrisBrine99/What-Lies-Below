/// @description Debug Commands

if (keyboard_check_pressed(vk_f11)){ // Restarting the Game
	game_restart();
} else if (keyboard_check_pressed(vk_f12)){ // Closing the Game
	game_end();
}

if (keyboard_check_pressed(ord("M")) && global.gameState != GameState.InMenu){
	instance_create_depth(0, 0, GLOBAL_DEPTH, obj_inventory_menu);
	global.gameState = GameState.InMenu;
} else if (keyboard_check_pressed(ord("G"))){
	global.gameState = GameState.InGame;
}