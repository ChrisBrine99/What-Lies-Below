/// @description Deletes Sub-Menus and Cleans Up Data

// Removes the parent menu's built in data structures and another potential memory leaks
event_inherited();

// Delete each of the three sub-menus if they still exist
var _length = array_length_1d(invSection);
for (var i = 0; i < _length; i++){
	if (instance_exists(invSection[i])){
		instance_destroy(invSection[i]);
	}
}