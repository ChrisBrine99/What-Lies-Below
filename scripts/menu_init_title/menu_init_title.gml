/// @description Initializes the title contents, as well as the position, font, alignment, and color of the title.
/// @param title
/// @param xPos
/// @param yPos
/// @param hAlign
/// @param vAlign
/// @param font
/// @param innerCol
/// @param outerCol[r/g/b]

var _title, _xPos, _yPos, _hAlign, _vAlign, _font, _innerCol, _outerCol;
_title = argument0;
_xPos = argument1;
_yPos = argument2;
_hAlign = argument3;
_vAlign = argument4;
_font = argument5;
_innerCol = argument6;
_outerCol = argument7;

title = _title;

titlePos = [_xPos, _yPos];
titleAlign = [_hAlign, _vAlign];

titleFont = _font;
titleTextCol = _innerCol;
titleOutlineCol = _outerCol;