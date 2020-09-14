// @description Initializes all global variables with default values.

// Singleton variables that keep track of important instances; preventing them from being created multiple times
// which would cause a myriad of issues, if the game even ran at all with multiple instances of these objects.
global.controllerID = noone;

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