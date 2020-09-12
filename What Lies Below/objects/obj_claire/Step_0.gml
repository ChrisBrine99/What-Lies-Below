/// @description Updating Keyboard Input

// Updating keyboard input
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);

// Call the par_entity step event
event_inherited();
// Any non-state code for the player will be below here