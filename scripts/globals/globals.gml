/// @description Initializes all global variables with default values.

// Variables to store the texture IDs for each of the fonts used in the game.
global.texFontXSmall = font_get_texture(font_gui_xSmall);

// Singleton variables that keep track of important instances; preventing them from being created multiple times
// which would cause a myriad of issues, if the game even ran at all with multiple instances of these objects.
global.controllerID = noone;		// For obj_controller
global.sorterID = noone;			// For obj_depth_sorter
global.effectID = noone;			// For obj_shader_handler
global.playerID = noone;			// For obj_claire

// Holds the game's current state. This state determines the functionality of certain objects.
global.gameState = GameState.InGame;

// Two variables that allow for the use of a variable frame rate. The first tracks the difference in time between
// the frames relative to the target FPS, and the second determines the game's target FPS for one second of real 
// time. This value determines where delta time will equal to a value of 1.00.
global.deltaTime = 0;
global.targetFPS = 60;

// An array with 2 indexes: the width of the camera given it's current aspect ratio, as well as the height for
// the same aspect. This allows for accurate drawing of GUI elements relative to the four corners of the screen.
global.cameraSize = [0, 0];

// A grid with the dimensions 2 by n, where n is equal to the total number of world object that exist currently
// for drawing using the depth sorting system. The grid is sorted by the current Y values of each object every
// frame.
global.worldObjects = ds_grid_create(2, 0);

// An array for the inventory that is two-dimensional, with a width of 28 (Maximum number of slots) and a 
// height of three. (itemID, # of items, and equipped or not)
/*for (var i = 0; i < INVENTORY_SIZE; i++){
	global.invItem[i, 0] = 0;
	global.invItem[i, 1] = 0;
	global.invItem[i, 2] = false;
}*/