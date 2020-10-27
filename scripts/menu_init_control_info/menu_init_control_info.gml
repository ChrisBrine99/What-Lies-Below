/// @description Initializes the position of the left and right anchor for the controls to be positioned with. Also determines 
/// the color and font used for control information.
/// @param lAnchorXPos
/// @param lAnchorYPos
/// @param rAnchorXPos
/// @param rAnchorYPos
/// @param font
/// @param innerCol
/// @param outerCol[r/g/b]

var _lAnchorXPos, _lAnchorYPos, _rAnchorXPos, _rAnchorYPos, _font, _innerCol, _outerCol;
_lAnchorXPos = argument0;
_lAnchorYPos = argument1;
_rAnchorXPos = argument2;
_rAnchorYPos = argument3;
_font = argument4;
_innerCol = argument5;
_outerCol = argument6;

rightAnchor = [_rAnchorXPos, _rAnchorYPos];
leftAnchor = [_lAnchorXPos, _lAnchorYPos];

controlsFont = _font;
controlsTextCol = _innerCol;
controlsOutlineCol = _outerCol;