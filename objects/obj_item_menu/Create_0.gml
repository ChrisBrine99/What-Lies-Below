/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

// Inherit all variables from the parent menu class
event_inherited();
// First, initialize the menu itself
menu_initialize(-1, -1, 4, 4, 6, 0, 0, 30, 0.4); // TODO -- Place transition and its arguments where the -1s are located
// Next, initialize the menu option and menu opiton info variables
menu_init_options(20, 28, fa_left, fa_top, 19, 19, font_gui_medium);
menu_init_option_info(110, 136, fa_left, fa_top, font_gui_small, c_white, [0.5, 0.5, 0.5]);
// NOTE -- The item menu will use images in place of options being represented with text, which is the norm.
// The only item name that will be visible is the item that is currently highlighted by the player; located
// below the item grid.

// Fetch the character's current inventory state
for (var i = 0; i < global.curInvSize; i++){
	options_add_info(global.invItem[i, 0], "This is a test of the item description to see if the scrolling text works, the wrapping works (Which will be implemented at a later time), and if it's in the correct position.", true);
	info[| i] = string_split_lines(info[| i], infoFont, global.cameraSize[X] - 15 - infoPos[X]);
}
// Make sure the option descriptions have scrolling text
scrollingInfoText = true;

// Set the initial state of the menu
set_cur_state(state_item_default);

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// Background Color Variables
colorItemBack = make_color_rgb(0, 0, 168);
colorItemHighlightBack = make_color_rgb(0, 0, 252);

#endregion