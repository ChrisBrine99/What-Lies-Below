/// @description Initializes the position, alignment, font, and color for the text. The alignment values alter
/// how the text is displayed relative to its given position.
/// @param xPos
/// @param yPos
/// @param hAlign
/// @param vAlign
/// @param font
/// @param innerCol
/// @param outerCol[r/g/b]

var _xPos, _yPos, _hAlign, _vAlign, _font, _innerCol, _outerCol;
_xPos = argument0;
_yPos = argument1;
_hAlign = argument2;
_vAlign = argument3;
_font = argument4;
_innerCol = argument5;
_outerCol = argument6;

infoPos = [_xPos, _yPos];
infoAlign = [_hAlign, _vAlign];

infoFont = _font;
infoTextCol = _innerCol;
infoOutlineCol = _outerCol;