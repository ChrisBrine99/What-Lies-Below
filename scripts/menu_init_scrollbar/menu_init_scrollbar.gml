/// @description Initializes the variables for the optional scrollbar. This scrollbar will let the user know
/// their position in the menu relative to the first and last available rows.
/// @param xPos
/// @param yPos
/// @param width
/// @param height
/// @param innerCol
/// @param outerCol
/// @param backgroundCol

var _xPos, _yPos, _width, _height, _innerCol, _outerCol, _backgroundCol;
_xPos = argument0;
_yPos = argument1;
_width = argument2;
_height = argument3;
_innerCol = argument4;
_outerCol = argument5;
_backgroundCol = argument6;

scrollbar = [_xPos, _yPos, _width, _height];
scrollbarInnerCol = _innerCol;
scrollbarOuterCol = _outerCol;
scrollbarBackCol = _backgroundCol;