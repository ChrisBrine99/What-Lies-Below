/// @description Adds an option to the menu's current list of available options. It also takes in information
/// for the options respective information and adds that to its respective lists as well.
/// @param option
/// @param optionInfo
/// @param isActive

var _option, _optionInfo, _isActive;
_option = argument0;
_optionInfo = argument1;
_isActive = argument2;

// Add information about the option to its respective lists
ds_list_add(option, _option);
ds_list_add(optionActive, _isActive);
ds_list_add(optionPosOffset, 0, 0);

// Update the total menu size and recalculate the total rows in the menu
menuSize = ds_list_size(option);
menuRows = floor(menuSize / menuWidth);

// Finally, add the option information to its list as well
ds_list_add(info, _optionInfo);