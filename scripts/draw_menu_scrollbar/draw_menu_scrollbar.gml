/// @description Draws the menu's scrollbar that tells the user where they are located relative to the beginning
/// and ending of the menu. It is important to temporarily reset the shader whenever the scrollbar is drawn
/// because of an unknown issue involving draw_sprite_ext and shaders. No arguments needed.

var _scrollbarSize, _scrollbarOffset;
_scrollbarSize = round(scrollbar[W] * (numRowsToDraw / menuRows));
_scrollbarOffset = lerp(scrollbar[Y], scrollbar[Y] + scrollbar[W] - _scrollbarSize, firstRowToDraw / (menuRows - numRowsToDraw));

draw_sprite_ext(spr_rectangle, 0, scrollbar[X], scrollbar[Y], scrollbar[Z], scrollbar[W], 0, scrollbarBackCol, 1);
draw_rect_outline(scrollbar[X], _scrollbarOffset, scrollbar[Z], _scrollbarSize, scrollbarInnerCol, scrollbarOuterCol, 1, 1);