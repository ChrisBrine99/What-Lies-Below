/// @description Debug Commands

if (keyboard_check_pressed(vk_f11)){ // Restarting the Game
	game_restart();
} else if (keyboard_check_pressed(vk_f12)){ // Closing the Game
	game_end();
}