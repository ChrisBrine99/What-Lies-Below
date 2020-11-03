/// @description Initializes the variables for the optional scrollbar. This scrollbar will let the user know
/// their position in the menu relative to the first and last available rows. On top of that, it can also be
/// oriented hoizontally as well to show the position within the menu's first and last available columns.
/// @param xPos
/// @param yPos
/// @param width
/// @param height
/// @param innerCol
/// @param backgroundCol
/// @param isVertical

var _xPos, _yPos, _width, _height, _innerCol, _backgroundCol, _isVertical;
_xPos = argument0;
_yPos = argument1;
_width = argument2;
_height = argument3;
_innerCol = argument4;
_backgroundCol = argument5;
_isVertical = argument6;

if (_isVertical){ // Initializing a vertical scrollbar
	vScrollbar = [_xPos, _yPos, _width, _height];
} else{ // Initializing a horizontal scrollbar
	hScrollbar = [_xPos, _yPos, _width, _height];
}

scrollbarCol = _innerCol;
scrollbarBackCol = _backgroundCol;