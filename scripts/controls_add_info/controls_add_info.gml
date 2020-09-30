/// @description Adds control prompt information for the current menu. This information includes the sprite
/// used for the chosen keybinding, and the anchor it uses, which can be either the right or left one.
/// @param keybinding
/// @param anchor
/// @param info
/// @param calculatePositions

var _keybinding, _anchor, _info, _calculatePositions;
_keybinding = argument0;
_anchor = argument1;
_info = argument2;
_calculatePositions = argument3;

ds_list_add(controlsPos, 0, 0); // Every 2 indexes is one "element"
ds_list_add(controlsAnchor, _anchor);

// TODO -- Get keybinding image using another script here
ds_list_add(controlsInfo, spr_floor_switch, 0, _info);

// Finally, if needed, calculate the positions for the anchor's controls
if (_calculatePositions){ // When initializing control info, the final index for each anchor should have this flag enabled.
	controls_calculate_position(_anchor);
}