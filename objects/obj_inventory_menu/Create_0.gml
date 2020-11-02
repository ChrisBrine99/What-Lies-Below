/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

// Inherit all variables from the parent menu class
event_inherited();
// First, initialize the menu itself
menu_initialize(-1, -1, 3, 1, 0, 30, 0.4); // TODO -- Place transition and its arguments where the -1s are located
// Next, initialize the menu option variables
var _optionOffset = floor(global.cameraSize[X] / 3); // Centers the position of each option and provides even spacing
menu_init_options((global.cameraSize[X] / 2) - _optionOffset, 20, fa_center, fa_top, _optionOffset, 0, font_gui_medium);
// Add the three options: "Items", "Notes", and "Maps"
options_add_info("Items", "", true);
options_add_info("Notes", "", true);
options_add_info("Maps", "", true);
// Finally, initialize the menu's control information
menu_init_control_info(5, global.cameraSize[Y] - 12, global.cameraSize[X] - 5, global.cameraSize[Y] - 12, font_gui_small, c_white, [0.5, 0.5, 0.5]);
// Add the initial control binding information below here
controls_add_info(ord("Z"), LEFT_ANCHOR, "Select", false);		// Menu option selection/deselecting keybindings
controls_add_info(ord("X"), LEFT_ANCHOR, "Exit Menu", true);

controls_add_info(vk_right, RIGHT_ANCHOR, "", false);			// Menu cursor movement keybindings
controls_add_info(vk_left, RIGHT_ANCHOR, "", false);
controls_add_info(vk_up, RIGHT_ANCHOR, "", false);
controls_add_info(vk_down, RIGHT_ANCHOR, "Move Cursor", false);

controls_add_info(ord("V"), RIGHT_ANCHOR, "", false); 
controls_add_info(ord("C"), RIGHT_ANCHOR, "Switch Section", true); 

menu_init_cursor(0, 0, spr_wall_movable);

// Alter the keybindings used for moving the menu's cursor to be exclusive to swapping inventory sections
rightIndex = ord("V");
leftIndex = ord("C");

// Set the initial state of the menu
set_cur_state(state_inventory_default);

#endregion


#region UNIQUE VARIABLE INITIALIZATION

invSection = array_create(3, noone);
// Add the three menu objects to the array, but deactivate all but the first one.
invSection[0] = instance_create_depth(0, 0, GLOBAL_DEPTH, obj_item_menu);
invSection[1] = instance_create_depth(0, 0, GLOBAL_DEPTH, obj_note_menu);
instance_deactivate_object(invSection[1]); // De-activated by default
invSection[2] = instance_create_depth(0, 0, GLOBAL_DEPTH, obj_map_menu);
instance_deactivate_object(invSection[2]); // De-activated by default


#endregion