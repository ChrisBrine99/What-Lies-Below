randomize();

// Initialize all global variables
globals();

// All persistent, global objects will be created here
instance_create_depth(0, 0, GLOBAL_DEPTH, obj_controller);

// After intiialization, go to the next room and begin the game
room_goto_next();

// FOR TESTING
show_debug_overlay(true);