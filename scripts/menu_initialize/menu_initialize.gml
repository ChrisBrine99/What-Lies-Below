/// @description Initializes the basic elements that are required for the menu to function properly. Otherwise, input
/// will not be allowed and it'll more than likely crash the game.
/// @param transition
/// @param transitionArgs[]
/// @param menuWidth
/// @param numRowsToDraw
/// @param scrollOffset
/// @param timeToHold
/// @param autoScrollSpeed

var _transition, _transitionArgs, _menuWidth, _numRowsToDraw, _scrollOffset, _timeToHold, _autoScrollSpeed;
_transition = argument0;
_transitionArgs = argument1;
_menuWidth = argument2;
_numRowsToDraw = argument3;
_scrollOffset = argument4;
_timeToHold = argument5;
_autoScrollSpeed = argument6;

// Carry over the transition to perform and arguments needed for said transition
transition = _transition;
transitionArgs = _transitionArgs;

// The width of the menu to allow for 2D or 1D menus, depending on the total width. The value can only be a 
// value of one or greater.
menuWidth = max(1, _menuWidth);

// The number of rows visible to the user at once and the offset needed to scroll the visible portion of the
// menu. The values for both must be one or above and zero or above, respectively.
numRowsToDraw = max(1, _numRowsToDraw);
scrollOffset = max(0, _scrollOffset);

// The speed of the cursor whenever it is automatically scrolling through the options. The values for both
// must be greater than 5 (60 = 1 second of real time) and 0.01 (smaller values = faster), respectively.
timeToHold = max(5, _timeToHold);
autoScrollSpeed = max(0.01, _autoScrollSpeed);