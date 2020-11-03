/// @description Draws the menu's scrollbars that tell the user where they are located relative to the beginning
/// and ending rows/columns of the menu. It is important to temporarily reset the shader whenever the scrollbar 
/// is drawn because of an unknown issue involving draw_sprite_ext and shaders. No arguments needed.

var _scrollbarSize, _scrollbarOffset;
if (is_array(hScrollbar)){ // Drawing the horizontal scrollbar
	_scrollbarSize = round(hScrollbar[Z] * (numDrawn[X] / menuDimensions[X]));
	_scrollbarOffset = lerp(hScrollbar[X], hScrollbar[X] + hScrollbar[Z] - _scrollbarSize, firstDrawn[X] / (menuDimensions[X] - numDrawn[X]));
	
	draw_sprite_ext(spr_rectangle, 0, hScrollbar[X], hScrollbar[Y], hScrollbar[Z], hScrollbar[W], 0, scrollbarBackCol, 1);
	draw_sprite_ext(spr_rectangle, 0, _scrollbarOffset, hScrollbar[Y], _scrollbarSize, hScrollbar[W], 0, scrollbarCol, 1);
}

if (is_array(vScrollbar)){ // Drawing the vertical scrollbar
	_scrollbarSize = round(vScrollbar[W] * (numDrawn[Y] / menuDimensions[Y]));
	_scrollbarOffset = lerp(vScrollbar[Y], vScrollbar[Y] + vScrollbar[W] - _scrollbarSize, firstDrawn[Y] / (menuDimensions[Y] - numDrawn[Y]));
	
	draw_sprite_ext(spr_rectangle, 0, vScrollbar[X], vScrollbar[Y], vScrollbar[Z], vScrollbar[W], 0, scrollbarBackCol, 1);
	draw_sprite_ext(spr_rectangle, 0, vScrollbar[X], _scrollbarOffset, vScrollbar[Z], _scrollbarSize, 0, scrollbarCol, 1);
}