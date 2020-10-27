/// @description Provides input functionality for the menu's cursor. Enables selecting of menu options,
/// moving between them, and backing out of selecting an item, or exiting the menu.

// Update current input states for the keyboard variables
keyRight = keyboard_check(vk_right);
keyLeft = keyboard_check(vk_left);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keySelect = keyboard_check_pressed(ord("Z"));
keyReturn = keyboard_check_pressed(ord("X"));
keyAuxReturn = keyboard_check_pressed(auxReturnIndex);

// Set the previous option to whatever the curOption value is before any input is considered
prevOption = curOption;

// Pressing the return key will ignore any directional menu input and instantly exit
if (keyReturn || keyAuxReturn){
	// TODO -- Play Return Sound Here if Enabled
	return;
}

if (keySelect){
	// TODO -- Play Select Sound Here if Enabled
	return;
}

// Menu has one or less than one element OR holdTimer is set to -1; don't bother updating menu cursor
if (menuSize <= 1){
	if (!keyRight && !keyLeft && !keyUp && !keyDown){ // Reset auto move key if all directions are released
		holdTimer = 0;
	}
	return;
}

// If any directional keys have been pressed, attempt to update the cursor
if (keyRight || keyLeft || keyUp || keyDown){
	holdTimer -= global.deltaTime;
	// Update the currently highlighted option (curOption)
	if (holdTimer <= 0){
		if (!isAutoScrolling){ // Enable the menu's auto-scrolling
			holdTimer = timeToHold;
			isAutoScrolling = true;
		} else{ // Reduce time needed to move cursor for auto-scrolling
			holdTimer = timeToHold * autoScrollSpeed;			
		}
		
		// Moving up/down to different rows in the menu
		if ((keyUp && !keyDown) || (keyDown && !keyUp)){
			curOption += (keyDown - keyUp) * menuWidth;
			// Updating the visible region of the menu depending on the cursor's current row
			var _curRow = floor(curOption / menuWidth);
			if (keyDown && firstRowToDraw + numRowsToDraw <= menuRows &&  _curRow >= firstRowToDraw + (numRowsToDraw - scrollOffset)){ // Move the visible region up the menu
				firstRowToDraw++;
			} else if (keyUp && firstRowToDraw > 0 && _curRow <= firstRowToDraw + scrollOffset){ // Move the visible region down the menu
				firstRowToDraw--;
			}
			
			// Check if the cursor needs to wrap around to the beginning/end
			if (curOption >= menuSize){
				curOption = curOption % menuWidth;
				firstRowToDraw = 0;
			} else if (curOption < 0){
				curOption = min((menuRows * menuWidth) + prevOption, menuSize - 1);
				firstRowToDraw = max(0, (menuRows + 1) - numRowsToDraw);
			}
		}
		
		// Moving left/right through the menu if there is more than one option per row
		if (menuWidth > 1){
			if ((keyLeft && !keyRight) || (!keyLeft && keyRight)){
				// Check if the cursor needs to wrap around to the other side
				if ((keyRight && ((curOption % menuWidth) == menuWidth - 1) || curOption == menuSize - 1)){ // Wrap around to the right
					curOption -= curOption % menuWidth;
				} else if (keyLeft && (curOption % menuWidth) == 0){ // Wrap around to the left
					curOption = min(curOption + (menuWidth - 1), menuSize - 1);
				} else{ // No wrapping is needed; move the cursor normally
					curOption += keyRight - keyLeft;
				}
			}
		}
		// Finally, reset the info text's character scrolling position
		numCharacters = 0;
	}
} else{ // No directional keys are being held; reset auto-scroll stat and its associated timer
	isAutoScrolling = false;
	holdTimer = 0;
}