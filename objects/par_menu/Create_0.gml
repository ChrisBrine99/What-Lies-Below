/// @description Variable Initialization

#region EDITING INHERITED VARIABLES

image_index = 0;
image_speed = 0;
image_alpha = 0;
visible = false;

#endregion

#region UNIQUE VARIABLE INITIALIZATION

// Variables that store the current transition script to execute and the arguments pertaining to that transition
// script, respectively. The arguments are contained within an array in order to allow the scripts to take in
// whatever number of arguments they choose, while only every actually using a single argument slot.
transition = -1;
transitionArgs = -1;	// An array of indefinite length

// A variable that stores a method's ID value. Whenever the variable is used, the relative state code will
// be executed, and for only that state's code. The lastState variable stores the previously active state.
curState = -1;
lastState = -1;

// These variables keep track of the option that has been highlighted by the user, the option that was
// selected by the user (if one has been selected), and the option that was selected by the user, but
// another option has to be selected in order to use that auxillary option. Finally, the size of the 
// menu is stored using the size of the option ds_list, and the direction determines if the menu is
// horizontal or vertical, which determines the keyboard input used for moving through the menu.
curOption = 0;
selOption = -1;
auxSelOption = -1;
menuSize = 0;
menuDirection = 0;		// A 2D vector [X, Y] 
// [1, 0] = horizontal menu, and [0, 1] = vertical menu

// These variables are for automatically scrolling through the menu's options. The first is the time
// (60 == 1 second) the menu movement key has been held for, the time it needs to be held in order to 
// automatically move the cursor, the speed relative to the time needed to hold that the cursor will 
// move once autoscrolling has been activated, and finally, the flag to toggle automatic cursor scrolling 
// on and off.
holdTimer = 0;
timeToHold = 0;
autoScrollSpeed = 0;
isAutoScrolling = false;

// VARIABLES FOR MENU TITLE ////////////////////////////////////////////////////////

// The string for the title that will displayed at its positional coordinates; aligned to that position
// using the alignment vector. Finally, there is the font that will be used to draw said title.
title = "";
titlePos = 0;			// A 2D vector [X, Y]
titleAlign = 0;			// A 2D vector [X, Y]
titleFont = font_gui_xSmall;

// The color of the title's text and respective outline.
titleTextCol = c_white;
titleOutlineCol = [0.5, 0.5, 0.5];

////////////////////////////////////////////////////////////////////////////////////

// VARIABLES FOR MENU OPTIONS //////////////////////////////////////////////////////

// The ds_list that stores all the string values for the available menu options.
option = ds_list_create();			// A ds_list of indefinite length (string)
// The position of the top element for the displayed options, the offsets for each option, and the spacing
// between each of the options on each axis.
optionPos = 0;						// A 2D vector [X, Y]
optionPosOffset = 0;				// A ds_list of indefinite length (x, y)
optionSpacing = 0;					// A 2D vector [X, Y]
// The alignment of the options relative to their posiiton value, as well as the font used for the options.
optionAlign = 0;					// A 2D vector [X, Y]
optionFont = font_gui_xSmall;

// The colors used for options that aren't selected or being highlighted by the user current, but they are
// currently visible.
optionCol = c_white;
optionOutlineCol = [0.5, 0.5, 0.5];
// The first two variables are the colors used for the option that was selected by the user. Meanwhile, the
// second pair of variables are used for an option that was selected by the user, but it now stored in an
// auxillary buffer for use once another option is selected by the user. (Ex. Combining Items, Swapping Items)
optionSelectCol = c_lime;
optionSelectOutlineCol = [0, 0.5, 0];
optionAuxSelectCol = c_red;
optionAuxSelectOutlineCol = [0.5, 0, 0];
// The colors used for the option the is equal to the curOption value, meaning it is being hovered over by 
// the user, but it hasn't been selected yet.
optionHighlightCol = make_color_rgb(252, 224, 168);
optionHighlightOutlineCol = [0.49, 0.44, 0.33];

// Determines the first visible option that will be drawn, which is located wherever the zeroth element would
// drawn relative to the position of the options. The next variable determines how many options are visible
// at any given time. Finally, the offset is how many options from the last or first visible one the cursor
// needs to be before the visible options will be shifted.
firstToDraw = 0;
numToDraw = 0;
scrollOffset = 0;

// The first variable is a flag that will determine whether or not a highlighted option cursor will be 
// visible next to the respective option. The next variable is the sprite that is used as the highlighted 
// option cursor. Finally, the last variable is a 2D vector to store the zeroth position of the cursor.
displayCursor = false;
cursorSprite = -1;
cursorPos = 0;			// A 2D vector [X, Y]

// Variables relating to an optional scrollbar that the menu can use to display the user's cursor's position
// relative to the first, last menu options, and number of visible options. The first variable is a flag to
// toggle the drawing of the scrollbar. The second is a vector storing the position and size of the scrollbar 
// on the screen. The third and fourth are the inner scrollbar and outer scrollbar colors, respectively. 
// Finally, the last variable is a 2D vector equalling either [1, 0] or [0, 1], which determines the direction 
// of the scrollbar on the screen.
displayScrollbar = false;
scrollbar = 0;			// A 4D vector [X, Y, W, H]
scrollbarInnerCol = c_white;
scrollbarOuterCol = [0.5, 0.5, 0.5];
scrollbarDirection = 0;	// A 2D vector [X, Y]
// [1, 0] = horizontal scrollbar, [0, 1] = vertical scrollbar

////////////////////////////////////////////////////////////////////////////////////

// VARIABLES FOR MENU OPTIONS INFO /////////////////////////////////////////////////

// The ds_list that stores all the string values for the available menu option information. Also, below that
// is the vector to store the position of the information on the screen, and another vector for the alignment
// of that text relative to the position of the information. Finally, the font is found below those variables.
info = ds_list_create();			// A ds_list of indefinite length (string)
infoPos = 0;						// A 2D vector [X, Y]
infoAlign = 0;						// A 2D vector [X, Y]
infoFont = font_gui_xSmall;

// The color of both the inside of the iunformation text and its accompanying outline.
infoTextCol = c_white;
infoOutlineCol = [0.5, 0.5, 0.5];

// A flag that enables/disables the information text to smoothly scroll onto the screen for displaying. The
// variable below that is the number of currently visible characters, which is increased relative to the 
// text speed setting in the accessibility menu.
scrollingInfoText = false;
numCharacters = 0;

////////////////////////////////////////////////////////////////////////////////////

// VARIABLES FOR MENU CONTROL INFO /////////////////////////////////////////////////

// The two choices for anchors that the control information can be positioned relative to. One if for the
// left-side of the screen, and the other is for the right-side of the screen.
leftAnchor = 0;						// A 2D vector [X, Y]
rightAnchor = 0;					// A 2D vector [X, Y]

// The control information is contained over 3 ds_lists that each store unique information relative to the
// "index". The first is the calculated position of the control information relative to the anchor it uses.
// The second is for the anchor that the control positions are calculated from. The third contains the string
// telling the user what the control does in the menu, and the image that goes along with that keybinding.
// Below that is the font used for displaying the control information.
controlsPos = ds_list_create();		// A ds_list of indefinite length (X, Y)
controlsAnchor = ds_list_create();	// A ds_list of indefinite length (element(s) must be either -1 or 1)	
controlsInfo = ds_list_create();	// A ds_list of indefinite length (sprite_index, image_index, string) 
controlsFont = font_gui_xSmall;

// The color of both the inside of the iunformation text and its accompanying outline.
controlsTextCol = c_white;
controlsOutlineCol = [0.5, 0.5, 0.5];

///////////////////////////////////////////////////////////////////////////////////

// FOR TESTING
leftAnchor = [5, 168];
rightAnchor = [315, 168];

controls_add_info(vk_space, LEFT_ANCHOR, "Test", false);
controls_add_info(vk_space, LEFT_ANCHOR, "TestTwo", true);

controls_add_info(vk_space, RIGHT_ANCHOR, "Test", false);
controls_add_info(vk_space, RIGHT_ANCHOR, "TestTwo", true);

#endregion