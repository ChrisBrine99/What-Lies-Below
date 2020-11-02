/// @description Draws the cursors position relative to the option's position. It's important to draw the cursor
/// before activating the menu's shader otherwise adverse effects may occur. No arguments needed.

var _xPosition, _yPosition;
_xPosition = (cursorPos[X] + optionPos[X]) + ((curOption % menuWidth) * optionSpacing[X]);
_yPosition = (cursorPos[Y] + optionPos[Y]) + (floor(curOption / (menuWidth * menuRows)) * optionSpacing[Y]);

draw_sprite(cursorSprite, 0, _xPosition, _yPosition);